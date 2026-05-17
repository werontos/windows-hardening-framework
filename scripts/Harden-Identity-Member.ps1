function Ensure-RegistryPath {
    param (
        [string]$Path
    )

    if (-not (Test-Path $Path)) {
        New-Item -Path $Path -Force | Out-Null
    }
}

# Account Policies
net accounts /uniquepw:24
net accounts /maxpwage:365
net accounts /minpwage:1
net accounts /minpwlen:14
net accounts /lockoutduration:30
net accounts /lockoutthreshold:5
net accounts /lockoutwindow:15

# Relax minimum password length limits
Ensure-RegistryPath "HKLM:\System\CurrentControlSet\Control\SAM"
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\SAM" -Name "RelaxMinimumPasswordLengthLimits" -Type DWord -Value 1

# Accounts: Limit local account use of blank passwords to console logon only
Ensure-RegistryPath "HKLM:\System\CurrentControlSet\Control\Lsa"
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Lsa" -Name "LimitBlankPasswordUse" -Type DWord -Value 1

# Domain member: Disable machine account password changes
Ensure-RegistryPath "HKLM:\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters"
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" -Name "DisablePasswordChange" -Type DWord -Value 0

# Domain member: Maximum machine account password age
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" -Name "MaximumPasswordAge" -Type DWord -Value 30

# Interactive logon: Prompt user to change password before expiration
Ensure-RegistryPath "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "PasswordExpiryWarning" -Type DWord -Value 14

# Microsoft network client: Send unencrypted password to third-party SMB servers
Ensure-RegistryPath "HKLM:\System\CurrentControlSet\Services\LanmanWorkstation\Parameters"
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Services\LanmanWorkstation\Parameters" -Name "EnablePlainTextPassword" -Type DWord -Value 0

# Network access: Do not allow storage of passwords and credentials for network authentication
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Lsa" -Name "DisableDomainCreds" -Type DWord -Value 1

# Network security: Do not store LAN Manager hash value on next password change
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Lsa" -Name "NoLMHash" -Type DWord -Value 1

# LAPS
Ensure-RegistryPath "HKLM:\SOFTWARE\Policies\Microsoft Services\AdmPwd"
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft Services\AdmPwd" -Name "PwdExpirationProtectionEnabled" -Type DWord -Value 1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft Services\AdmPwd" -Name "AdmPwdEnabled" -Type DWord -Value 1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft Services\AdmPwd" -Name "PasswordComplexity" -Type DWord -Value 4
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft Services\AdmPwd" -Name "PasswordLength" -Type DWord -Value 15
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft Services\AdmPwd" -Name "PasswordAgeDays" -Type DWord -Value 30

# Turn off picture password sign-in
Ensure-RegistryPath "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System"
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "BlockDomainPicturePassword" -Type DWord -Value 1

# Sleep Settings
Ensure-RegistryPath "HKLM:\Software\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51"
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51" -Name "DCSettingIndex" -Type DWord -Value 1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51" -Name "ACSettingIndex" -Type DWord -Value 1

# Credential UI
Ensure-RegistryPath "HKLM:\Software\Policies\Microsoft\Windows\CredUI"
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\CredUI" -Name "DisablePasswordReveal" -Type DWord -Value 1

# RDP
Ensure-RegistryPath "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name "DisablePasswordSaving" -Type DWord -Value 1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name "fPromptForPassword" -Type DWord -Value 1

# Password complexity
secedit /export /cfg C:\secpol.cfg
(Get-Content C:\secpol.cfg) `
-replace "PasswordComplexity = 0", "PasswordComplexity = 1" |
Set-Content C:\secpol.cfg
secedit /configure /db C:\Windows\Security\Database\secedit.sdb /cfg C:\secpol.cfg /areas SECURITYPOLICY
Remove-Item C:\secpol.cfg -Force

# Store passwords using reversible encryption
secedit /export /cfg C:\secpol.cfg
(Get-Content C:\secpol.cfg) `
-replace "ClearTextPassword = 1", "ClearTextPassword = 0" |
Set-Content C:\secpol.cfg
secedit /configure /db C:\Windows\Security\Database\secedit.sdb /cfg C:\secpol.cfg /areas SECURITYPOLICY
Remove-Item C:\secpol.cfg -Force

# Deny access to this computer from the network
secedit /export /cfg C:\secpol.cfg
(Get-Content C:\secpol.cfg) `
-replace 'SeDenyNetworkLogonRight = .*', 'SeDenyNetworkLogonRight = *S-1-5-32-546,*S-1-5-114' |
Set-Content C:\secpol.cfg
secedit /configure /db C:\Windows\Security\Database\secedit.sdb /cfg C:\secpol.cfg /areas USER_RIGHTS
Remove-Item C:\secpol.cfg -Force

# Deny log on through Remote Desktop Services
secedit /export /cfg C:\secpol.cfg
(Get-Content C:\secpol.cfg) `
-replace 'SeDenyRemoteInteractiveLogonRight = .*', 'SeDenyRemoteInteractiveLogonRight = *S-1-5-32-546,*S-1-5-113' |
Set-Content C:\secpol.cfg
secedit /configure /db C:\Windows\Security\Database\secedit.sdb /cfg C:\secpol.cfg /areas USER_RIGHTS
Remove-Item C:\secpol.cfg -Force

# Enable computer and user accounts to be trusted for delegation
secedit /export /cfg C:\secpol.cfg
(Get-Content C:\secpol.cfg) `
-replace 'SeEnableDelegationPrivilege = .*', 'SeEnableDelegationPrivilege =' |
Set-Content C:\secpol.cfg
secedit /configure /db C:\Windows\Security\Database\secedit.sdb /cfg C:\secpol.cfg /areas USER_RIGHTS
Remove-Item C:\secpol.cfg -Force

# Accounts
Rename-LocalUser -Name "Administrator" -NewName "PUT_NEW_ADMIN_NAME"
Rename-LocalUser -Name "Guest" -NewName "PUT_YOUR_GUEST_NAME"
net user "PUT_NEW_ADMIN_NAME" /active:no
net user "PUT_YOUR_GUEST_NAME" /active:no

# Block Microsoft accounts
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "NoConnectedUser" -Type DWord -Value 3

# Restrict anonymous SAM enumeration
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Lsa" -Name "RestrictAnonymousSAM" -Type DWord -Value 1

# UAC
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "FilterAdministratorToken" -Type DWord -Value 1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorAdmin" -Type DWord -Value 2
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorUser" -Type DWord -Value 0
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableInstallerDetection" -Type DWord -Value 1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableSecureUIAPaths" -Type DWord -Value 1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" -Type DWord -Value 1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "PromptOnSecureDesktop" -Type DWord -Value 1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableVirtualization" -Type DWord -Value 1

# Audit Policies
auditpol /set /subcategory:"Computer Account Management" /success:enable /failure:disable
auditpol /set /subcategory:"Other Account Management Events" /success:enable /failure:enable
auditpol /set /subcategory:"User Account Management" /success:enable /failure:enable
auditpol /set /subcategory:"Account Lockout" /success:disable /failure:enable

# Apply UAC restrictions to local accounts on network logons
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "LocalAccountTokenFilterPolicy" -Type DWord -Value 0

# Locale Services
Ensure-RegistryPath "HKLM:\SOFTWARE\Policies\Microsoft\Control Panel\International"
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Control Panel\International" -Name "BlockUserInputMethodsForSignIn" -Type DWord -Value 1

# Logon
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "BlockUserFromShowingAccountDetailsOnSignin" -Type DWord -Value 1

# Microsoft Accounts Optional
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "MSAOptional" -Type DWord -Value 1

# Cloud Content
Ensure-RegistryPath "HKLM:\Software\Policies\Microsoft\Windows\CloudContent"
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\CloudContent" -Name "DisableConsumerAccountStateContent" -Type DWord -Value 1

# Enumerate administrator accounts on elevation
Ensure-RegistryPath "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\CredUI"
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\CredUI" -Name "EnumerateAdministrators" -Type DWord -Value 0

# Block all consumer Microsoft account user authentication
Ensure-RegistryPath "HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftAccount"
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftAccount" -Name "DisableUserAuth" -Type DWord -Value 1

# Device Guard
Ensure-RegistryPath "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard"
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" -Name "DeployConfigCIPolicy" -Type DWord -Value 1

# CTRL+ALT+DEL
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "DisableCAD" -Type DWord -Value 0

# Machine inactivity limit
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "InactivityTimeoutSecs" -Type DWord -Value 900

# Don't display last signed-in
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "DontDisplayLastUserName" -Type DWord -Value 1

Write-Host "Member hardening completed." -ForegroundColor Green
