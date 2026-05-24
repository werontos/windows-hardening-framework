[CmdletBinding()]
param(
    [switch]$StrictMode,
    [switch]$DisableWinRM
)

# Harden-GPO-DC.ps1
# SAFE ENTERPRISE DOMAIN CONTROLLER HARDENING
#
# Dangerous / compatibility-risk settings are COMMENTED
# and marked clearly.
#
# Test before enterprise rollout.

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

# LOGGING

$LogPath = "C:\ProgramData\Hardening\Logs"

if (-not (Test-Path $LogPath)) {
    New-Item -ItemType Directory -Path $LogPath -Force | Out-Null
}

Start-Transcript `
    -Path "$LogPath\GPO_DC_$(Get-Date -Format 'yyyyMMdd_HHmmss').log"

# FUNCTIONS

function Write-Log {

    param(
        [string]$Message,

        [ValidateSet('INFO','OK','WARN','ERROR','SKIP')]
        [string]$Level = 'INFO'
    )

    $Color = switch ($Level) {
        'INFO'  { 'Cyan' }
        'OK'    { 'Green' }
        'WARN'  { 'Yellow' }
        'ERROR' { 'Red' }
        'SKIP'  { 'DarkYellow' }
    }

    Write-Host "[$Level] $Message" -ForegroundColor $Color
}

function Set-RegistryValue {

    param(
        [Parameter(Mandatory)][string]$Path,
        [Parameter(Mandatory)][string]$Name,
        [Parameter(Mandatory)]$Value,

        [ValidateSet('String','ExpandString','Binary','DWord','MultiString','QWord')]
        [string]$Type = 'DWord'
    )

    try {

        if (-not (Test-Path $Path)) {

            New-Item `
                -Path $Path `
                -Force | Out-Null

            Write-Log "Created registry path: $Path" "INFO"
        }

        $Existing = Get-ItemProperty `
            -Path $Path `
            -Name $Name `
            -ErrorAction SilentlyContinue

        if ($null -ne $Existing) {

            $CurrentValue = (
                Get-ItemProperty `
                    -Path $Path `
                    -Name $Name
            ).$Name

            if ($CurrentValue -eq $Value) {

                Write-Log "$Path -> $Name already configured" "SKIP"
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

        Write-Log "$Path -> $Name = $Value" "OK"
    }
    catch {

        Write-Log "$Path -> $Name failed : $_" "ERROR"
    }
}

# VALIDATION

try {

    $ComputerSystem = Get-CimInstance Win32_ComputerSystem

    if ($ComputerSystem.DomainRole -lt 4) {

        throw "This system is NOT a Domain Controller."
    }

    Write-Log "Domain Controller detected" "OK"
}
catch {

    Write-Log $_ "ERROR"

    Stop-Transcript
    exit 1
}

# LDAP HARDENING

Set-RegistryValue `
    -Path "HKLM:\SYSTEM\CurrentControlSet\Services\NTDS\Parameters" `
    -Name "LDAPServerIntegrity" `
    -Value 2

# MAY BREAK LEGACY LDAP CLIENTS / NAS / PRINTERS
# TEST BEFORE ENFORCING
#
# Set-RegistryValue `
#     -Path "HKLM:\SYSTEM\CurrentControlSet\Services\NTDS\Parameters" `
#     -Name "LdapEnforceChannelBinding" `
#     -Value 1

Write-Log "LDAP signing configured" "OK"

# DEVICE GUARD / VBS / HVCI

# OPTIONAL
# MAY BREAK:
# - old drivers
# - EDR
# - backup agents
# - VMware tools
# - monitoring software
#
# TEST BEFORE ENTERPRISE ROLLOUT

# try {
#
#     $CPU = Get-CimInstance Win32_Processor
#
#     if ($CPU.VirtualizationFirmwareEnabled) {
#
#         Set-RegistryValue `
#             -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" `
#             -Name "EnableVirtualizationBasedSecurity" `
#             -Value 1
#
#         Set-RegistryValue `
#             -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" `
#             -Name "RequirePlatformSecurityFeatures" `
#             -Value 3
#
#         Set-RegistryValue `
#             -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" `
#             -Name "HypervisorEnforcedCodeIntegrity" `
#             -Value 1
#
#         Set-RegistryValue `
#             -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" `
#             -Name "HVCIMATRequired" `
#             -Value 1
#
#         Write-Log "VBS/HVCI configured" "OK"
#     }
#     else {
#
#         Write-Log "Virtualization unsupported, VBS skipped" "WARN"
#     }
# }
# catch {
#
#     Write-Log "VBS configuration failed: $_" "ERROR"
# }

# OPTIONAL LSASS PROTECTION

# MAY BREAK:
# - legacy EDR
# - credential providers
# - smartcard middleware
#
# TEST BEFORE ENABLE

# Set-RegistryValue `
#     -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" `
#     -Name "LsaCfgFlags" `
#     -Value 1

# CREDENTIAL HARDENING

Set-RegistryValue `
    -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\CredSSP\Parameters" `
    -Name "AllowEncryptionOracle" `
    -Value 0

Set-RegistryValue `
    -Path "HKLM:\Software\Policies\Microsoft\Windows\CredentialsDelegation" `
    -Name "AllowProtectedCreds" `
    -Value 1

Set-RegistryValue `
    -Path "HKLM:\Software\Policies\Microsoft\Windows\CredUI" `
    -Name "DisablePasswordReveal" `
    -Value 1

Set-RegistryValue `
    -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\CredUI" `
    -Name "EnumerateAdministrators" `
    -Value 0

Set-RegistryValue `
    -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" `
    -Name "NoLMHash" `
    -Value 1

# SMARTSCREEN

Set-RegistryValue `
    -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" `
    -Name "EnableSmartScreen" `
    -Value 1

Set-RegistryValue `
    -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" `
    -Name "ShellSmartScreenLevel" `
    -Value "Block" `
    -Type String

# AUTORUN / USB

Set-RegistryValue `
    -Path "HKLM:\Software\Policies\Microsoft\Windows\Explorer" `
    -Name "NoAutoplayfornonVolume" `
    -Value 1

Set-RegistryValue `
    -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" `
    -Name "NoAutorun" `
    -Value 1

Set-RegistryValue `
    -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" `
    -Name "NoDriveTypeAutoRun" `
    -Value 255

# WINDOWS UPDATE

Set-RegistryValue `
    -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" `
    -Name "NoAutoUpdate" `
    -Value 0

Set-RegistryValue `
    -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" `
    -Name "NoAutoRebootWithLoggedOnUsers" `
    -Value 1

Set-RegistryValue `
    -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" `
    -Name "ManagePreviewBuilds" `
    -Value 1

Set-RegistryValue `
    -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" `
    -Name "ManagePreviewBuildsPolicyValue" `
    -Value 0

# TELEMETRY

# SAFE VALUE FOR DEFENDER / MDE COMPATIBILITY

Set-RegistryValue `
    -Path "HKLM:\Software\Policies\Microsoft\Windows\DataCollection" `
    -Name "AllowTelemetry" `
    -Value 1

Set-RegistryValue `
    -Path "HKLM:\Software\Policies\Microsoft\Windows\DataCollection" `
    -Name "DisableEnterpriseAuthProxy" `
    -Value 1

Set-RegistryValue `
    -Path "HKLM:\Software\Policies\Microsoft\Windows\DataCollection" `
    -Name "DisableOneSettingsDownloads" `
    -Value 1

Set-RegistryValue `
    -Path "HKLM:\Software\Policies\Microsoft\Windows\DataCollection" `
    -Name "DoNotShowFeedbackNotifications" `
    -Value 1

# WINRM

if ($DisableWinRM) {

    Write-Log "WinRM hardening ENABLED" "WARN"

    Set-RegistryValue `
        -Path "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Client" `
        -Name "AllowBasic" `
        -Value 0

    Set-RegistryValue `
        -Path "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Client" `
        -Name "AllowUnencryptedTraffic" `
        -Value 0

    Set-RegistryValue `
        -Path "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Client" `
        -Name "AllowDigest" `
        -Value 0

    Set-RegistryValue `
        -Path "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Service" `
        -Name "AllowBasic" `
        -Value 0

    Set-RegistryValue `
        -Path "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Service" `
        -Name "AllowUnencryptedTraffic" `
        -Value 0

    Set-RegistryValue `
        -Path "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Service\WinRS" `
        -Name "AllowRemoteShellAccess" `
        -Value 0
}
else {

    Write-Log "WinRM hardening skipped (recommended for enterprise management)" "WARN"
}

# RDP HARDENING

$RDP = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"

Set-RegistryValue -Path $RDP -Name "DisablePasswordSaving" -Value 1
Set-RegistryValue -Path $RDP -Name "fPromptForPassword" -Value 1
Set-RegistryValue -Path $RDP -Name "SecurityLayer" -Value 2
Set-RegistryValue -Path $RDP -Name "UserAuthentication" -Value 1
Set-RegistryValue -Path $RDP -Name "MinEncryptionLevel" -Value 3
Set-RegistryValue -Path $RDP -Name "fEncryptRPCTraffic" -Value 1
Set-RegistryValue -Path $RDP -Name "fDisableCdm" -Value 1
Set-RegistryValue -Path $RDP -Name "fDisableLPT" -Value 1
Set-RegistryValue -Path $RDP -Name "fDisablePNPRedir" -Value 1
Set-RegistryValue -Path $RDP -Name "fDisableLocationRedir" -Value 1
Set-RegistryValue -Path $RDP -Name "DeleteTempDirsOnExit" -Value 1
Set-RegistryValue -Path $RDP -Name "PerSessionTempDir" -Value 1

# NETWORK HARDENING

Set-RegistryValue `
    -Path "HKLM:\System\CurrentControlSet\Services\Tcpip\Parameters" `
    -Name "DisableIPSourceRouting" `
    -Value 2

Set-RegistryValue `
    -Path "HKLM:\System\CurrentControlSet\Services\Tcpip6\Parameters" `
    -Name "DisableIPSourceRouting" `
    -Value 2

Set-RegistryValue `
    -Path "HKLM:\System\CurrentControlSet\Services\Tcpip\Parameters" `
    -Name "EnableICMPRedirect" `
    -Value 0

Set-RegistryValue `
    -Path "HKLM:\System\CurrentControlSet\Services\Netbt\Parameters" `
    -Name "NoNameReleaseOnDemand" `
    -Value 1

Set-RegistryValue `
    -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Rpc" `
    -Name "EnableAuthEpResolution" `
    -Value 1

# MAY BREAK LEGACY RPC/DCOM APPS
# TEST BEFORE ENFORCING
#
# Set-RegistryValue `
#     -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Rpc" `
#     -Name "RestrictRemoteClients" `
#     -Value 1

# PRINTNIGHTMARE

Set-RegistryValue `
    -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers\PointAndPrint" `
    -Name "NoWarningNoElevationOnInstall" `
    -Value 0

Set-RegistryValue `
    -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers\PointAndPrint" `
    -Name "UpdatePromptSettings" `
    -Value 0

# EVENT LOGS

Set-RegistryValue `
    -Path "HKLM:\Software\Policies\Microsoft\Windows\EventLog\Security" `
    -Name "MaxSize" `
    -Value 262144

Set-RegistryValue `
    -Path "HKLM:\Software\Policies\Microsoft\Windows\EventLog\Application" `
    -Name "MaxSize" `
    -Value 65536

Set-RegistryValue `
    -Path "HKLM:\Software\Policies\Microsoft\Windows\EventLog\System" `
    -Name "MaxSize" `
    -Value 65536

# DEFENDER

Set-RegistryValue `
    -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\App and Browser protection" `
    -Name "DisallowExploitProtectionOverride" `
    -Value 1

# CLOUD / CONSUMER FEATURES

Set-RegistryValue `
    -Path "HKLM:\Software\Policies\Microsoft\Windows\CloudContent" `
    -Name "DisableConsumerAccountStateContent" `
    -Value 1

Set-RegistryValue `
    -Path "HKLM:\Software\Policies\Microsoft\Windows\CloudContent" `
    -Name "DisableWindowsConsumerFeatures" `
    -Value 1

Set-RegistryValue `
    -Path "HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftAccount" `
    -Name "DisableUserAuth" `
    -Value 1

# LOGON HARDENING

Set-RegistryValue `
    -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" `
    -Name "BlockUserFromShowingAccountDetailsOnSignin" `
    -Value 1

Set-RegistryValue `
    -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" `
    -Name "DontDisplayLastUserName" `
    -Value 1

Set-RegistryValue `
    -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" `
    -Name "DisableCAD" `
    -Value 0

Set-RegistryValue `
    -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" `
    -Name "InactivityTimeoutSecs" `
    -Value 900

# PRINT SPOOLER



 try {

     $Spooler = Get-Service Spooler -ErrorAction SilentlyContinue

     if ($Spooler) {

         Stop-Service -Name Spooler -Force -ErrorAction SilentlyContinue
         Set-Service -Name Spooler -StartupType Disabled

         Write-Log "Print Spooler disabled" "OK"
     }
 }
 catch {

     Write-Log "Failed to disable Print Spooler: $_" "ERROR"
 }

# COMPLETE

Write-Log "Enterprise DC GPO hardening completed" "OK"
Write-Log "Reboot recommended" "WARN"

Stop-Transcript
