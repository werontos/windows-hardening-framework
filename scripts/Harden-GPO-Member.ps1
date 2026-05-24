[CmdletBinding()]
param(
    [switch]$StrictMode,
    [switch]$DisableWinRM,
    [switch]$DisableCamera,
    [switch]$DisableOneDrive
)

# GLOBALS

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$LogPath = "C:\ProgramData\Hardening\Logs"

if (-not (Test-Path $LogPath)) {
    New-Item -ItemType Directory -Path $LogPath -Force | Out-Null
}

Start-Transcript -Path "$LogPath\GPO_Member_$(Get-Date -Format 'yyyyMMdd_HHmmss').log"

# LOGGING

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

# REGISTRY FUNCTION

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
            New-Item -Path $Path -Force | Out-Null
            Write-Log "Created registry path: $Path" "INFO"
        }

        $Existing = Get-ItemProperty -Path $Path -Name $Name -ErrorAction SilentlyContinue

        if ($null -ne $Existing) {

            $CurrentValue = (Get-ItemProperty -Path $Path -Name $Name).$Name

            if ($CurrentValue -eq $Value) {
                Write-Log "$Path -> $Name already configured" "SKIP"
                return
            }

            Set-ItemProperty -Path $Path -Name $Name -Value $Value
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

# DEVICE GUARD / VBS

try {

    $CPU = Get-CimInstance Win32_Processor

    if ($CPU.VirtualizationFirmwareEnabled) {

        Set-RegistryValue `
            -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" `
            -Name "EnableVirtualizationBasedSecurity" `
            -Value 1

        Set-RegistryValue `
            -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" `
            -Name "RequirePlatformSecurityFeatures" `
            -Value 3

        Set-RegistryValue `
            -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" `
            -Name "HypervisorEnforcedCodeIntegrity" `
            -Value 1

        Set-RegistryValue `
            -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" `
            -Name "HVCIMATRequired" `
            -Value 1

        Set-RegistryValue `
            -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" `
            -Name "LsaCfgFlags" `
            -Value 1

        Write-Log "VBS/HVCI configured" "OK"
    }
    else {
        Write-Log "Virtualization unsupported, VBS skipped" "WARN"
    }
}
catch {
    Write-Log "VBS configuration failed: $_" "ERROR"
}

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
    -Value 0

Set-RegistryValue `
    -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" `
    -Name "ManagePreviewBuilds" `
    -Value 1

Set-RegistryValue `
    -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" `
    -Name "ManagePreviewBuildsPolicyValue" `
    -Value 0

# TELEMETRY

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

    Write-Log "WinRM hardened" "OK"
}
else {
    Write-Log "WinRM hardening skipped (enterprise compatibility)" "WARN"
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

Set-RegistryValue `
    -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Rpc" `
    -Name "RestrictRemoteClients" `
    -Value 1

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
    -Value 196608

Set-RegistryValue `
    -Path "HKLM:\Software\Policies\Microsoft\Windows\EventLog\Application" `
    -Name "MaxSize" `
    -Value 32768

Set-RegistryValue `
    -Path "HKLM:\Software\Policies\Microsoft\Windows\EventLog\System" `
    -Name "MaxSize" `
    -Value 32768

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

# OPTIONAL CAMERA DISABLE

if ($DisableCamera) {

    Set-RegistryValue `
        -Path "HKLM:\SOFTWARE\Policies\Microsoft\Camera" `
        -Name "AllowCamera" `
        -Value 0

    Write-Log "Camera disabled" "OK"
}

# OPTIONAL ONEDRIVE DISABLE

if ($DisableOneDrive) {

    Set-RegistryValue `
        -Path "HKLM:\Software\Policies\Microsoft\Windows\OneDrive" `
        -Name "DisableFileSyncNGSC" `
        -Value 1

    Write-Log "OneDrive disabled" "OK"
}

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

# COMPLETION

Write-Log "Enterprise GPO hardening completed" "OK"
Write-Log "Reboot recommended" "WARN"

Stop-Transcript
