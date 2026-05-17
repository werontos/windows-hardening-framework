# Harden-Identity.ps1 — Implementation Documentation

---
***Account Policies	Length of password history maintained***
```
Windows Server 2022 21H2
accountpolicy
DefaultValue:      None
RecommendedValue:  24
```
```ps1
net accounts /uniquepw:24
```
---
***Account Policies	Maximum password age***
```
Windows Server 2022 21H2
accountpolicy
DefaultValue:      42
RecommendedValue:  365
```
```ps1
net accounts /maxpwage:365
```
---
***Account Policies	Minimum password age***
```
Windows Server 2022 21H2
accountpolicy
DefaultValue:      0
RecommendedValue:  1
```
```ps1
net accounts /minpwage:1
```
---
***Account Policies	Minimum password length***
```
Windows Server 2022 21H2
accountpolicy
DefaultValue:      0
RecommendedValue:  14
```
```ps1
net accounts /minpwlen:14
```
<img width="478" height="146" alt="image" src="https://github.com/user-attachments/assets/81625de7-4d5b-4fb0-b468-4a5eaa0fccd5" />

---
***Account Policies Relax minimum password length limits***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\System\CurrentControlSet\Control\SAM
RegistryItem:  RelaxMinimumPasswordLengthLimits
DefaultValue:      0
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\SAM" -Name "RelaxMinimumPasswordLengthLimits" -Type DWord -Value 1
```
<img width="1263" height="601" alt="image" src="https://github.com/user-attachments/assets/40695ee9-e3e3-41f7-9a59-08fd96c5431d" />

---
***Security Options	Accounts: Limit local account use of blank passwords to console logon only***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\System\CurrentControlSet\Control\Lsa
RegistryItem:  LimitBlankPasswordUse
DefaultValue:      1
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Lsa" -Name "LimitBlankPasswordUse" -Type DWord -Value 1
```
<img width="1268" height="602" alt="image" src="https://github.com/user-attachments/assets/985481e9-bf90-426a-a0fd-232f66da081b" />

---
***Security Options	Domain controller: Refuse machine account password changes (DC)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters
RegistryItem:  RefusePasswordChange
DefaultValue:      1
RecommendedValue:  0
```
```ps1
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" -Name "RefusePasswordChange" -Type DWord -Value 0
```
<img width="1265" height="602" alt="image" src="https://github.com/user-attachments/assets/acde62f7-46d6-4147-8bcc-2cd53ddc46e2" />

---
***Security Options	Domain member: Disable machine account password changes***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters
RegistryItem:  DisablePasswordChange
DefaultValue:      0
RecommendedValue:  0
```
```ps1
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" -Name "DisablePasswordChange" -Type DWord -Value 0
```
<img width="1270" height="599" alt="image" src="https://github.com/user-attachments/assets/b820bad5-60a8-4501-b4c1-dca14a295e57" />

---
***Security Options	Domain member: Disable machine account password changes***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters
RegistryItem:  MaximumPasswordAge
DefaultValue:      30
RecommendedValue:  30
```
```ps1
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" -Name "MaximumPasswordAge" -Type DWord -Value 30
```
<img width="1272" height="604" alt="image" src="https://github.com/user-attachments/assets/b4b2c023-21d9-4291-b8b8-57b9db6f345c" />

---
***Security Options	Interactive logon: Prompt user to change password before expiration (Max)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System
RegistryItem:  PasswordExpiryWarning
DefaultValue:      5
RecommendedValue:  14
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "PasswordExpiryWarning" -Type DWord -Value 14
```
<img width="1263" height="603" alt="image" src="https://github.com/user-attachments/assets/6e116bef-8295-47e5-9a92-580c4c92962e" />

---
***Security Options	Interactive logon: Prompt user to change password before expiration (Min)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System
RegistryItem:  PasswordExpiryWarning
DefaultValue:      5
RecommendedValue:  5
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "PasswordExpiryWarning" -Type DWord -Value 5
```
<img width="1266" height="603" alt="image" src="https://github.com/user-attachments/assets/41205f2f-9f65-4120-ab03-cc8f1b0bdf43" />

---
***Security Options	Microsoft network client: Send unencrypted password to third-party SMB servers***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\System\CurrentControlSet\Services\LanmanWorkstation\Parameters
RegistryItem:  EnablePlainTextPassword
DefaultValue:      0
RecommendedValue:  0
```
```ps1
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Services\LanmanWorkstation\Parameters" -Name "EnablePlainTextPassword" -Type DWord -Value 0
```
<img width="1265" height="602" alt="image" src="https://github.com/user-attachments/assets/e491eceb-0e2a-4cf1-872f-de63dcdd8496" />

---
***Security Options	Network access: Do not allow storage of passwords and credentials for network authentication***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\System\CurrentControlSet\Control\Lsa
RegistryItem:  DisableDomainCreds
DefaultValue:      0
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Lsa" -Name "DisableDomainCreds" -Type DWord -Value 1
```
<img width="1269" height="602" alt="image" src="https://github.com/user-attachments/assets/16e74304-a667-409f-b29f-65bd1969ae37" />

---
***Security Options	Network security: Do not store LAN Manager hash value on next password change***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\System\CurrentControlSet\Control\Lsa
RegistryItem:  NoLMHash
DefaultValue:      1
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Lsa" -Name "NoLMHash" -Type DWord -Value 1
```
<img width="1267" height="603" alt="image" src="https://github.com/user-attachments/assets/a2be68d5-507a-41c9-9f47-2f83ff4fc767" />

---
***Administrative Templates: LAPS	Do not allow password expiration time longer than required by policy (Member)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft Services\AdmPwd
RegistryItem:  PwdExpirationProtectionEnabled
DefaultValue:      0
RecommendedValue:  1
```
```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft Services\AdmPwd" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft Services\AdmPwd" -Name "PwdExpirationProtectionEnabled" -Type DWord -Value 1
```
<img width="1271" height="602" alt="image" src="https://github.com/user-attachments/assets/b90315a5-a76b-4415-bd39-49e0f6a7af5c" />

---
***Administrative Templates: LAPS	Enable local admin password management (Member)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft Services\AdmPwd
RegistryItem:  AdmPwdEnabled
DefaultValue:      0
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft Services\AdmPwd" -Name "AdmPwdEnabled" -Type DWord -Value 1
```
<img width="1267" height="599" alt="image" src="https://github.com/user-attachments/assets/9a197554-1a93-44e3-9df5-2b0d21ef798e" />

---
***Administrative Templates: LAPS	Password Settings: Password Complexity (Member)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft Services\AdmPwd
RegistryItem:  PasswordComplexity
DefaultValue:      4
RecommendedValue:  4
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft Services\AdmPwd" -Name "PasswordComplexity" -Type DWord -Value 4
```
<img width="1264" height="604" alt="image" src="https://github.com/user-attachments/assets/6d32183c-51a4-48e4-93a9-a9087a76350d" />

---
***Administrative Templates: LAPS	Password Settings: Password Length (Member)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft Services\AdmPwd
RegistryItem:  PasswordLength
DefaultValue:      14
RecommendedValue:  15
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft Services\AdmPwd" -Name "PasswordLength" -Type DWord -Value 15
```
<img width="1264" height="603" alt="image" src="https://github.com/user-attachments/assets/f25dfc7c-2537-4196-8b97-7c61560cbd8b" />

---
***Administrative Templates: LAPS	Password Settings: Password Age (Days) (Member)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft Services\AdmPwd
RegistryItem:  PasswordAgeDays
DefaultValue:      30
RecommendedValue:  30
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft Services\AdmPwd" -Name "PasswordAgeDays" -Type DWord -Value 30
```
<img width="1268" height="602" alt="image" src="https://github.com/user-attachments/assets/6b535ff6-1e8a-4409-ab5d-af5d9cf3dd5c" />

---
***Administrative Templates: System	Logon: Turn off picture password sign-in***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows\System
RegistryItem:  BlockDomainPicturePassword
DefaultValue:      0
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "BlockDomainPicturePassword" -Type DWord -Value 1
```
<img width="1269" height="599" alt="image" src="https://github.com/user-attachments/assets/6e154ab0-542b-4fb1-9dcc-3614e5ea7bd7" />

---
***Administrative Templates: System	Sleep Settings: Require a password when a computer wakes (on battery)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51
RegistryItem:  DCSettingIndex
DefaultValue:      0
RecommendedValue:  1
```
```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51" -Name "DCSettingIndex" -Type DWord -Value 1
```
<img width="1268" height="598" alt="image" src="https://github.com/user-attachments/assets/554809af-41a5-47d7-aa92-2e1e882011dc" />

---
***Administrative Templates: System	Sleep Settings: Require a password when a computer wakes (plugged in)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51
RegistryItem:  ACSettingIndex
DefaultValue:      0
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51" -Name "ACSettingIndex" -Type DWord -Value 1
```
<img width="1270" height="600" alt="image" src="https://github.com/user-attachments/assets/de059a14-fb64-4f52-95e6-709c567927b5" />

---
***Administrative Templates: Windows Components	Credential User Interface: Do not display the password reveal button***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\CredUI
RegistryItem:  DisablePasswordReveal
DefaultValue:      0
RecommendedValue:  1
```
```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CredUI" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\CredUI" -Name "DisablePasswordReveal" -Type DWord -Value 1
```
<img width="1265" height="599" alt="image" src="https://github.com/user-attachments/assets/5c7b636a-6ffa-4159-aac7-4a387a25be39" />

---
***Administrative Templates: Windows Components	Remote Desktop Connection Client: Do not allow passwords to be saved***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services
RegistryItem:  DisablePasswordSaving
DefaultValue:      0
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name "DisablePasswordSaving" -Type DWord -Value 1
```
<img width="1267" height="603" alt="image" src="https://github.com/user-attachments/assets/69841903-963a-4639-af25-29c1859dbc03" />

---
***Administrative Templates: Windows Components	Remote Desktop Session Host: Security: Always prompt for password upon connection***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services
RegistryItem:  fPromptForPassword
DefaultValue:      0
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name "fPromptForPassword" -Type DWord -Value 1
```
<img width="1265" height="601" alt="image" src="https://github.com/user-attachments/assets/073343dd-a088-4c27-8e8d-9ac695665163" />

---
***Account Policies	Password must meet complexity requirements***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services
RegistryItem:  fPromptForPassword
DefaultValue:      0
RecommendedValue:  1
```
```ps1
secedit /export /cfg C:\secpol.cfg

(Get-Content C:\secpol.cfg) `
-replace "PasswordComplexity = 0", "PasswordComplexity = 1" |
Set-Content C:\secpol.cfg

secedit /configure /db C:\Windows\Security\Database\secedit.sdb /cfg C:\secpol.cfg /areas SECURITYPOLICY

Remove-Item C:\secpol.cfg -Force
```
---
***Account Policies	Password must meet complexity requirements***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services
RegistryItem:  fPromptForPassword
DefaultValue:      0
RecommendedValue:  1
```
```ps1
secedit /export /cfg C:\secpol.cfg

(Get-Content C:\secpol.cfg) `
-replace "ClearTextPassword = 1", "ClearTextPassword = 0" |
Set-Content C:\secpol.cfg

secedit /configure /db C:\Windows\Security\Database\secedit.sdb /cfg C:\secpol.cfg /areas SECURITYPOLICY

Remove-Item C:\secpol.cfg -Force
```
---
***Account Policies	Account lockout duration***
```
Windows Server 2022 21H2
accountpolicy
DefaultValue:      30
RecommendedValue:  30
```
```ps1
net accounts /lockoutduration:30
```
---
***Account Policies	Account lockout threshold***
```
Windows Server 2022 21H2
accountpolicy
DefaultValue:      Never
RecommendedValue:  5
```
```ps1
net accounts /lockoutthreshold:5
```
---
***Account Policies	Reset account lockout counter***
```
Windows Server 2022 21H2
accountpolicy
DefaultValue:      30
RecommendedValue:  15
```
```ps1
net accounts /lockoutwindow:15
```
---
***User Rights Assignment	Add workstations to domain (DC)***
```
Windows Server 2022 21H2
accesschk
Method:            SeMachineAccountPrivilege
DefaultValue:      NT AUTHORITY\Authenticated Users
RecommendedValue:  BUILTIN\Administrators
```
```ps1
secedit /export /cfg C:\secpol.cfg

(Get-Content C:\secpol.cfg) `
-replace 'SeMachineAccountPrivilege = .*', 'SeMachineAccountPrivilege = *S-1-5-32-544' |
Set-Content C:\secpol.cfg

secedit /configure /db C:\Windows\Security\Database\secedit.sdb /cfg C:\secpol.cfg /areas USER_RIGHTS

Remove-Item C:\secpol.cfg -Force
```
<img width="838" height="176" alt="image" src="https://github.com/user-attachments/assets/c71df947-59c7-4465-a304-5eed49de3661" />

---
***User Rights Assignment	Deny access to this computer from the network (Member)***
```
Windows Server 2022 21H2
accesschk
Method:            SeDenyNetworkLogonRight
DefaultValue:      BUILTIN\Guests
RecommendedValue:  BUILTIN\Guests;NT AUTHORITY\Local account and member of Administrators group
```
```ps1
secedit /export /cfg C:\secpol.cfg

(Get-Content C:\secpol.cfg) `
-replace 'SeDenyNetworkLogonRight = .*', 'SeDenyNetworkLogonRight = *S-1-5-32-546,*S-1-5-114' |
Set-Content C:\secpol.cfg

secedit /configure /db C:\Windows\Security\Database\secedit.sdb /cfg C:\secpol.cfg /areas USER_RIGHTS

Remove-Item C:\secpol.cfg -Force
```
<img width="840" height="179" alt="image" src="https://github.com/user-attachments/assets/800a587b-191c-4c9d-b0fc-45d59da21be9" />

---
***User Rights Assignment	Deny log on through Remote Desktop Services (Member)***
```
Windows Server 2022 21H2
accesschk
Method:            SeDenyRemoteInteractiveLogonRight
DefaultValue:      -
RecommendedValue:  BUILTIN\Guests;NT AUTHORITY\Local account
```
```ps1
secedit /export /cfg C:\secpol.cfg

(Get-Content C:\secpol.cfg) `
-replace 'SeDenyRemoteInteractiveLogonRight = .*', 'SeDenyRemoteInteractiveLogonRight = *S-1-5-32-546,*S-1-5-113' |
Set-Content C:\secpol.cfg

secedit /configure /db C:\Windows\Security\Database\secedit.sdb /cfg C:\secpol.cfg /areas USER_RIGHTS

Remove-Item C:\secpol.cfg -Force
```
<img width="949" height="178" alt="image" src="https://github.com/user-attachments/assets/ee8e3ec5-0bfd-4b96-8f38-8a4cd00bee5a" />

---
***User Rights Assignment	Enable computer and user accounts to be trusted for delegation (DC)***
```
Windows Server 2022 21H2
accesschk
Method:            SeEnableDelegationPrivilege
DefaultValue:      -
RecommendedValue:  BUILTIN\Guests;NT AUTHORITY\Local account
```
```ps1
secedit /export /cfg C:\secpol.cfg

(Get-Content C:\secpol.cfg) `
-replace 'SeEnableDelegationPrivilege = .*', 'SeEnableDelegationPrivilege = *S-1-5-32-544' |
Set-Content C:\secpol.cfg

secedit /configure /db C:\Windows\Security\Database\secedit.sdb /cfg C:\secpol.cfg /areas USER_RIGHTS

Remove-Item C:\secpol.cfg -Force
```
<img width="836" height="176" alt="image" src="https://github.com/user-attachments/assets/1486628e-3c36-43f0-868e-2df5c193cdce" />

---
***User Rights Assignment	Enable computer and user accounts to be trusted for delegation (Member)***
```
Windows Server 2022 21H2
accesschk
Method:            SeEnableDelegationPrivilege
DefaultValue:      -
RecommendedValue:  -
```
```ps1
secedit /export /cfg C:\secpol.cfg

(Get-Content C:\secpol.cfg) `
-replace 'SeEnableDelegationPrivilege = .*', 'SeEnableDelegationPrivilege =' |
Set-Content C:\secpol.cfg

secedit /configure /db C:\Windows\Security\Database\secedit.sdb /cfg C:\secpol.cfg /areas USER_RIGHTS

Remove-Item C:\secpol.cfg -Force
```
<img width="837" height="172" alt="image" src="https://github.com/user-attachments/assets/aeb78b64-f541-4327-ae63-5ff39eee4a89" />

---
***Security Options	Accounts: Administrator account status (Member)***
```
Windows Server 2022 21H2
Method:            localaccount
DefaultValue:      True
RecommendedValue:  False
```
```ps1
net user Administrator /active:no
```
---
***Security Options	Accounts: Guest account status (Member)***
```
Windows Server 2022 21H2
Method:            localaccount
DefaultValue:      False
RecommendedValue:  False
```
```ps1
net user Guest /active:no
```
---
***Security Options	Accounts: Rename administrator account***
```
Windows Server 2022 21H2
Method:            localaccount
DefaultValue:      Administrator
RecommendedValue:  PUT_NEW_ADMIN_NAME
```
```ps1
Rename-LocalUser -Name "Administrator" -NewName "PUT_NEW_ADMIN_NAME"
```
---
***Security Options	Accounts: Rename guest account***
```
Windows Server 2022 21H2
Method:            localaccount
DefaultValue:      Guest
RecommendedValue:  PUT_YOUR_GUEST_NAME
```
```ps1
Rename-LocalUser -Name "Guest" -NewName "PUT_YOUR_GUEST_NAME"
```
---
***Security Options	Accounts: Block Microsoft accounts***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System
RegistryItem:  NoConnectedUser
DefaultValue:      0
RecommendedValue:  3
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "NoConnectedUser" -Type DWord -Value 3
```
<img width="1271" height="602" alt="image" src="https://github.com/user-attachments/assets/1b4e1284-0725-477c-85e0-53aead7e9c3c" />

---
***Security Options	Network access: Do not allow anonymous enumeration of SAM accounts (Member)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\System\CurrentControlSet\Control\Lsa
RegistryItem:  RestrictAnonymousSAM
DefaultValue:      1
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Lsa" -Name "RestrictAnonymousSAM" -Type DWord -Value 1
```
<img width="1265" height="599" alt="image" src="https://github.com/user-attachments/assets/53ae6607-24c6-46bd-b245-ce75135d6b0b" />

---
***Security Options	User Account Control: Admin Approval Mode for the Built-in Administrator account***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System
RegistryItem:  FilterAdministratorToken
DefaultValue:      0
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "FilterAdministratorToken" -Type DWord -Value 1
```
<img width="1253" height="603" alt="image" src="https://github.com/user-attachments/assets/040cf2bb-723b-44a9-8f64-4e9deb06dcd0" />

---
***Security Options	User Account Control: Behavior of the elevation prompt for administrators in Admin Approval Mode***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System
RegistryItem:  ConsentPromptBehaviorAdmin
DefaultValue:      5
RecommendedValue:  2
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorAdmin" -Type DWord -Value 2
```
<img width="1255" height="605" alt="image" src="https://github.com/user-attachments/assets/aada0d61-de3f-445d-9b42-aae4e53bece3" />

---
***Security Options	User Account Control: Behavior of the elevation prompt for standard users***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System
RegistryItem:  ConsentPromptBehaviorUser
DefaultValue:      3
RecommendedValue:  0
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorUser" -Type DWord -Value 0
```
<img width="1250" height="597" alt="image" src="https://github.com/user-attachments/assets/b906b8eb-9b4b-457a-8bef-217ce603d480" />

---
***Security Options	User Account Control: Detect application installations and prompt for elevation***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System
RegistryItem:  EnableInstallerDetection
DefaultValue:      1
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableInstallerDetection" -Type DWord -Value 1
```
<img width="1255" height="608" alt="image" src="https://github.com/user-attachments/assets/f43a4caf-fe03-48a6-9748-39e3828c5f89" />

---
***Security Options	User Account Control: Only elevate UIAccess applications that are installed in secure locations***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System
RegistryItem:  EnableSecureUIAPaths
DefaultValue:      1
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableSecureUIAPaths" -Type DWord -Value 1
```
<img width="1254" height="602" alt="image" src="https://github.com/user-attachments/assets/3489382e-a48e-477d-a2b7-19e784b6fd05" />

---
***Security Options	User Account Control: Run all administrators in Admin Approval Mode***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System
RegistryItem:  EnableLUA
DefaultValue:      1
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" -Type DWord -Value 1
```
<img width="1250" height="605" alt="image" src="https://github.com/user-attachments/assets/3db3c770-8c7d-4451-87d2-5611b046818d" />

---
***Security Options	User Account Control: Switch to the secure desktop when prompting for elevation***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System
RegistryItem:  PromptOnSecureDesktop
DefaultValue:      1
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "PromptOnSecureDesktop" -Type DWord -Value 1
```
<img width="1249" height="602" alt="image" src="https://github.com/user-attachments/assets/858a2d06-33be-4045-b90e-e16dbbfd9434" />

---
***Security Options	User Account Control: Virtualize file and registry write failures to per-user locations***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System
RegistryItem:  EnableVirtualization
DefaultValue:      1
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableVirtualization" -Type DWord -Value 1
```
<img width="1252" height="605" alt="image" src="https://github.com/user-attachments/assets/72a6d934-e0b7-444a-aa64-12d8785515de" />

---
***Advanced Audit Policy Configuration	Computer Account Management***
```
Windows Server 2022 21H2
auditpol:          {0CCE9236-69AE-11D9-BED3-505054503030}
DefaultValue:      Success
RecommendedValue:  Success
```
```ps1
auditpol /set /subcategory:"Computer Account Management" /success:enable /failure:disable
```
<img width="931" height="127" alt="image" src="https://github.com/user-attachments/assets/07147944-4085-4f2a-bbf0-b1700c8690bc" />

---
***Advanced Audit Policy Configuration	Other Account Management Events***
```
Windows Server 2022 21H2
auditpol:          {0CCE923A-69AE-11D9-BED3-505054503030}
DefaultValue:      Success
RecommendedValue:  Success
```
```ps1
auditpol /set /subcategory:"Other Account Management Events" /success:enable /failure:enable
```
<img width="960" height="126" alt="image" src="https://github.com/user-attachments/assets/bec4b0e9-d25e-4edf-9901-2208c63ef73c" />

---
***Advanced Audit Policy Configuration	User Account Management***
```
Windows Server 2022 21H2
auditpol:          {0CCE9235-69AE-11D9-BED3-505054503030}
DefaultValue:      Success
RecommendedValue:  Success and Failure
```
```ps1
auditpol /set /subcategory:"User Account Management" /success:enable /failure:enable
```
<img width="892" height="127" alt="image" src="https://github.com/user-attachments/assets/fa68dc42-895d-4018-a814-9d4f446a0073" />

---
***Advanced Audit Policy Configuration	Account Lockout***
```
Windows Server 2022 21H2
auditpol:          {0CCE9217-69AE-11D9-BED3-505054503030}
DefaultValue:      Success
RecommendedValue:  Failure
```
```ps1
auditpol /set /subcategory:"Account Lockout" /success:disable /failure:enable
```
<img width="833" height="111" alt="image" src="https://github.com/user-attachments/assets/395abdf3-64f6-4130-9438-49fe1dbfb9ae" />

---
***MS Security Guide	Apply UAC restrictions to local accounts on network logons (Member)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System
RegistryItem:  LocalAccountTokenFilterPolicy
DefaultValue:      0
RecommendedValue:  0
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "LocalAccountTokenFilterPolicy" -Type DWord -Value 0
```
<img width="1251" height="604" alt="image" src="https://github.com/user-attachments/assets/2db9c5e5-6fad-47b6-86f6-16f552b3ec09" />

---
***Administrative Templates: System	Locale Services: Disallow copying of user input methods to the system account for sign-in***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Control Panel\International
RegistryItem:  BlockUserInputMethodsForSignIn
DefaultValue:      0
RecommendedValue:  1
```
```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Control Panel\International" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Control Panel\International" -Name "BlockUserInputMethodsForSignIn" -Type DWord -Value 1
```
<img width="1268" height="601" alt="image" src="https://github.com/user-attachments/assets/75451ae1-d8f6-4ba4-a2c6-1729b4555125" />

---
***Administrative Templates: System	Logon: Block user from showing account details on sign-in***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows\System
RegistryItem:  BlockUserFromShowingAccountDetailsOnSignin
DefaultValue:      0
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "BlockUserFromShowingAccountDetailsOnSignin" -Type DWord -Value 1
```
<img width="1269" height="604" alt="image" src="https://github.com/user-attachments/assets/db3b61fe-9b83-4de4-ae05-4b52cc06a436" />

---
***Administrative Templates: System	Security Account Manager: Configure validation of ROCA-vulnerable WHfB keys during authentication (DC only)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System\SAM
RegistryItem:  SamNGCKeyROCAValidation
DefaultValue:      -
RecommendedValue:  1
```
```ps1
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System\SAM" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System\SAM" -Name "SamNGCKeyROCAValidation" -Type DWord -Value 1
```
<img width="1266" height="603" alt="image" src="https://github.com/user-attachments/assets/b940dbf4-7976-4cfd-87b0-823f1c11211d" />

---
***Administrative Templates: Windows Components	App runtime: Allow Microsoft accounts to be optional***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System
RegistryItem:  MSAOptional
DefaultValue:      0
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "MSAOptional" -Type DWord -Value 1
```
<img width="1252" height="604" alt="image" src="https://github.com/user-attachments/assets/f9449be5-9971-46bc-a7a4-fce461f03e72" />

---
***Administrative Templates: Windows Components	Cloud Content: Turn off cloud consumer account state content***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\CloudContent
RegistryItem:  DisableConsumerAccountStateContent
DefaultValue:      -
RecommendedValue:  1
```
```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CloudContent" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\CloudContent" -Name "DisableConsumerAccountStateContent" -Type DWord -Value 1
```
<img width="1270" height="603" alt="image" src="https://github.com/user-attachments/assets/d9bf200a-1ced-45e6-a475-343390c2747c" />

---
***Administrative Templates: Windows Components	Credential User Interface: Enumerate administrator accounts on elevation***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\CredUI
RegistryItem:  EnumerateAdministrators
DefaultValue:      1
RecommendedValue:  0
```
```ps1
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\CredUI" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\CredUI" -Name "EnumerateAdministrators" -Type DWord -Value 0
```
<img width="1267" height="604" alt="image" src="https://github.com/user-attachments/assets/cc60c611-bff4-4ec8-b5f2-8bcec2f59ace" />

---
***Administrative Templates: Windows Components	Microsoft account: Block all consumer Microsoft account user authentication***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftAccount
RegistryItem:  DisableUserAuth
DefaultValue:      -
RecommendedValue:  1
```
```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftAccount" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftAccount" -Name "DisableUserAuth" -Type DWord -Value 1
```
<img width="1270" height="606" alt="image" src="https://github.com/user-attachments/assets/eed06ca4-4388-4277-bb56-e7a9a9e640eb" />

---
***Security Options    Domain controller: Allow server operators to schedule tasks (DC)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\System\CurrentControlSet\Control\Lsa
RegistryItem:  SubmitControl
DefaultValue:      0
RecommendedValue:  0
```
```ps1
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Lsa" -Name "SubmitControl" -Type DWord -Value 0
```
<img width="1268" height="589" alt="image" src="https://github.com/user-attachments/assets/d69d3e5d-991b-4b20-a7b6-925217e2c8d0" />

---
***Administrative Templates: System    Device Guard: Windows Defender Application Control deployed (Policy)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard
RegistryItem:  DeployConfigCIPolicy
DefaultValue:      0
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" -Name "DeployConfigCIPolicy" -Type DWord -Value 1
```
<img width="1212" height="545" alt="image" src="https://github.com/user-attachments/assets/1762b6d0-cc32-4755-ae92-b1e07dfec79c" />

---
***Security Options	Interactive logon: Do not require CTRL+ALT+DEL***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System
RegistryItem:  DisableCAD
DefaultValue:      1
RecommendedValue:  0
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "DisableCAD" -Type DWord -Value 0
```
<img width="1253" height="602" alt="image" src="https://github.com/user-attachments/assets/1569cdd8-6d98-4675-aaac-7aaa19860be1" />

---
***Security Options	Interactive logon: Machine inactivity limit***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System
RegistryItem:  InactivityTimeoutSecs
DefaultValue:      900
RecommendedValue:  900
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "InactivityTimeoutSecs" -Type DWord -Value 900
```
<img width="1250" height="603" alt="image" src="https://github.com/user-attachments/assets/c9220c21-a308-4788-a5b7-26f85ce15155" />

---
