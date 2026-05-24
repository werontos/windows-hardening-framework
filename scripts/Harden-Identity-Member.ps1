[CmdletBinding(SupportsShouldProcess)]

param(
    [string]$LogPath = "C:\ProgramData\Hardening\Logs"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Continue"


# ROLE VALIDATION


$IsDC = $false

try {

    $IsDC = (
        Get-WindowsFeature AD-Domain-Services `
        -ErrorAction SilentlyContinue
    ).InstallState -eq "Installed"

}
catch {}

if ($IsDC) {

    Write-Error "Do NOT run Harden-Identity-Member.ps1 on Domain Controllers."
    exit 1
}


# LOGGING / BACKUP


New-Item -ItemType Directory -Path $LogPath -Force | Out-Null
New-Item -ItemType Directory -Path "C:\ProgramData\Hardening" -Force | Out-Null
New-Item -ItemType Directory -Path "C:\Temp" -Force | Out-Null

Start-Transcript `
    -Path "$LogPath\Identity-Member_$(Get-Date -f yyyyMMdd_HHmmss).log" `
    -Append

reg export HKLM `
    "C:\ProgramData\Hardening\HKLM_Identity_Member_Backup_$(Get-Date -f yyyyMMdd).reg" `
    /y 2>$null

$tempPath = "C:\Temp"


# FUNCTIONS


function Ensure-RegistryPath {

    param(
        [string]$Path
    )

    if (!(Test-Path $Path)) {

        New-Item `
            -Path $Path `
            -Force | Out-Null
    }
}

function Set-Reg {

    param(
        [string]$Path,
        [string]$Name,
        [string]$Type,
        $Value
    )

    Ensure-RegistryPath $Path

    try {

        $existing = Get-ItemProperty `
            -Path $Path `
            -Name $Name `
            -ErrorAction SilentlyContinue

        if ($null -ne $existing) {

            $current = $existing.$Name

            if ($current -eq $Value) {

                Write-Host "[SKIP] $Path -> $Name already configured"
                return
            }

            Set-ItemProperty `
                -Path $Path `
                -Name $Name `
                -Value $Value
        }
        else {

            New-ItemProperty `
                -Path $Path `
                -Name $Name `
                -PropertyType $Type `
                -Value $Value `
                -Force | Out-Null
        }

        Write-Host "[OK] $Path -> $Name = $Value"
    }
    catch {

        Write-Warning "[FAILED] $Path -> $Name : $_"
    }
}

function Invoke-Secedit {

    param(
        [string]$Content,
        [string]$Area
    )

    $guid = Get-Random

    $infPath = "$tempPath\$guid.inf"
    $dbPath  = "$tempPath\$guid.sdb"

    try {

        $Content | Out-File `
            $infPath `
            -Encoding Unicode

        secedit /configure `
            /db $dbPath `
            /cfg $infPath `
            /areas $Area `
            /quiet

        Write-Host "[OK] Secedit applied ($Area)"
    }
    catch {

        Write-Warning "[SECEEDIT FAILED] $_"
    }
    finally {

        Remove-Item `
            $infPath `
            -Force `
            -ErrorAction SilentlyContinue

        Remove-Item `
            $dbPath `
            -Force `
            -ErrorAction SilentlyContinue
    }
}

function Set-AuditPolicy {

    param(
        [string]$Subcategory,
        [string]$Success,
        [string]$Failure
    )

    try {

        auditpol /set `
            /subcategory:"$Subcategory" `
            /success:$Success `
            /failure:$Failure | Out-Null

        Write-Host "[OK] Audit -> $Subcategory"
    }
    catch {

        Write-Warning "[FAILED] Audit -> $Subcategory"
    }
}


# ACCOUNT POLICIES


net accounts /uniquepw:24
net accounts /maxpwage:60
net accounts /minpwage:1
net accounts /minpwlen:14
net accounts /lockoutduration:30
net accounts /lockoutthreshold:5
net accounts /lockoutwindow:15


# SECURITY POLICY (SECEDIT)


$inf = @"
[Unicode]
Unicode=yes

[Version]
signature="`$CHICAGO`$"
Revision=1

[System Access]
PasswordComplexity = 1
ClearTextPassword = 0

[Privilege Rights]

# Deny network logon to Guests + Local Accounts
SeDenyNetworkLogonRight = *S-1-5-32-546,*S-1-5-114

# OPTIONAL
# May affect local helpdesk RDP workflows
# SeDenyRemoteInteractiveLogonRight = *S-1-5-32-546,*S-1-5-113

# Prevent non-admin machine joins
SeMachineAccountPrivilege = *S-1-5-32-544

# Prevent delegation abuse
SeEnableDelegationPrivilege = *S-1-5-32-544
"@

Invoke-Secedit `
    -Content $inf `
    -Area SECURITYPOLICY

Invoke-Secedit `
    -Content $inf `
    -Area USER_RIGHTS


# PASSWORD / AUTHENTICATION


Set-Reg `
    "HKLM:\System\CurrentControlSet\Control\SAM" `
    "RelaxMinimumPasswordLengthLimits" `
    "DWord" `
    1

Set-Reg `
    "HKLM:\System\CurrentControlSet\Control\Lsa" `
    "LimitBlankPasswordUse" `
    "DWord" `
    1

Set-Reg `
    "HKLM:\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" `
    "DisablePasswordChange" `
    "DWord" `
    0

Set-Reg `
    "HKLM:\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" `
    "MaximumPasswordAge" `
    "DWord" `
    30

Set-Reg `
    "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" `
    "PasswordExpiryWarning" `
    "DWord" `
    14

Set-Reg `
    "HKLM:\System\CurrentControlSet\Services\LanmanWorkstation\Parameters" `
    "EnablePlainTextPassword" `
    "DWord" `
    0

Set-Reg `
    "HKLM:\System\CurrentControlSet\Control\Lsa" `
    "NoLMHash" `
    "DWord" `
    1

Set-Reg `
    "HKLM:\System\CurrentControlSet\Control\Lsa" `
    "RestrictAnonymousSAM" `
    "DWord" `
    1


# WINDOWS LAPS


$laps = "HKLM:\SOFTWARE\Microsoft\Policies\LAPS"

Set-Reg $laps "BackupDirectory" "DWord" 2
Set-Reg $laps "PasswordComplexity" "DWord" 4
Set-Reg $laps "PasswordLength" "DWord" 15
Set-Reg $laps "PasswordAgeDays" "DWord" 30
Set-Reg $laps "AdministratorAccountName" "String" "Administrator"


# CREDENTIAL UI / RDP


Set-Reg `
    "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" `
    "BlockDomainPicturePassword" `
    "DWord" `
    1

Set-Reg `
    "HKLM:\Software\Policies\Microsoft\Windows\CredUI" `
    "DisablePasswordReveal" `
    "DWord" `
    1

Set-Reg `
    "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" `
    "DisablePasswordSaving" `
    "DWord" `
    1

Set-Reg `
    "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" `
    "fPromptForPassword" `
    "DWord" `
    1


# POWER SETTINGS


$powerPath = "HKLM:\Software\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51"

Set-Reg $powerPath "DCSettingIndex" "DWord" 1
Set-Reg $powerPath "ACSettingIndex" "DWord" 1


# UAC HARDENING


$uac = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"

Set-Reg $uac "FilterAdministratorToken" "DWord" 1
Set-Reg $uac "ConsentPromptBehaviorAdmin" "DWord" 2
Set-Reg $uac "ConsentPromptBehaviorUser" "DWord" 0
Set-Reg $uac "EnableInstallerDetection" "DWord" 1
Set-Reg $uac "EnableSecureUIAPaths" "DWord" 1
Set-Reg $uac "EnableLUA" "DWord" 1
Set-Reg $uac "PromptOnSecureDesktop" "DWord" 1
Set-Reg $uac "EnableVirtualization" "DWord" 1

# Harden remote admin token filtering
# May affect some legacy remote admin tools
Set-Reg $uac "LocalAccountTokenFilterPolicy" "DWord" 0

# OPTIONAL - blocks Microsoft Accounts
# Recommended only for fully managed enterprise environments
# Set-Reg $uac "NoConnectedUser" "DWord" 3
# Set-Reg $uac "MSAOptional" "DWord" 1

Set-Reg $uac "DisableCAD" "DWord" 0
Set-Reg $uac "InactivityTimeoutSecs" "DWord" 900
Set-Reg $uac "DontDisplayLastUserName" "DWord" 1


# MICROSOFT ACCOUNT RESTRICTIONS
# OPTIONAL - may affect hybrid/cloud workflows

# Set-Reg `
#     "HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftAccount" `
#     "DisableUserAuth" `
#     "DWord" `
#     1


# LOCALE / SIGN-IN
# OPTIONAL - may affect multilingual environments

# Set-Reg `
#     "HKLM:\SOFTWARE\Policies\Microsoft\Control Panel\International" `
#     "BlockUserInputMethodsForSignIn" `
#     "DWord" `
#     1

Set-Reg `
    "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" `
    "BlockUserFromShowingAccountDetailsOnSignin" `
    "DWord" `
    1


# CLOUD CONTENT


Set-Reg `
    "HKLM:\Software\Policies\Microsoft\Windows\CloudContent" `
    "DisableConsumerAccountStateContent" `
    "DWord" `
    1


# CREDUI


Set-Reg `
    "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\CredUI" `
    "EnumerateAdministrators" `
    "DWord" `
    0


# AUDIT POLICIES


Set-AuditPolicy `
    -Subcategory "Computer Account Management" `
    -Success enable `
    -Failure disable

Set-AuditPolicy `
    -Subcategory "Other Account Management Events" `
    -Success enable `
    -Failure enable

Set-AuditPolicy `
    -Subcategory "User Account Management" `
    -Success enable `
    -Failure enable

Set-AuditPolicy `
    -Subcategory "Account Lockout" `
    -Success disable `
    -Failure enable


# LOCAL ACCOUNTS


try {

    Disable-LocalUser `
        -Name "Guest" `
        -ErrorAction SilentlyContinue

    Write-Host "[OK] Guest account disabled"
}
catch {

    Write-Warning "[FAILED] Guest account"
}


# DEVICE GUARD PLACEHOLDER


Ensure-RegistryPath `
    "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard"


# DONE


Write-Host ""
Write-Host "[+] Identity Member Hardening COMPLETE" `
    -ForegroundColor Green

Stop-Transcript
