[CmdletBinding()]
param(
    [switch]$StrictMode,
    [switch]$EnableCredentialGuard,
    [switch]$EnableControlledFolderAccess,
    [switch]$DisableWinRM
)

# GLOBALS

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$LogPath = "C:\ProgramData\Hardening\Logs"

if (-not (Test-Path $LogPath)) {

    New-Item -ItemType Directory -Path $LogPath -Force | Out-Null
}

$Transcript = Join-Path $LogPath "Endpoint_DC_$(Get-Date -Format 'yyyyMMdd_HHmmss').log"

Start-Transcript -Path $Transcript -Append


Write-Host " Enterprise Endpoint Hardening - DOMAIN CONTROLLER" -ForegroundColor Cyan


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

# ADMIN CHECK

$Identity = [Security.Principal.WindowsIdentity]::GetCurrent()
$Principal = New-Object Security.Principal.WindowsPrincipal($Identity)

if (-not $Principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {

    Write-Host "[ERROR] Administrator privileges required." -ForegroundColor Red
    Stop-Transcript
    exit 1
}

# REGISTRY FUNCTIONS

function Ensure-RegistryPath {

    param(
        [Parameter(Mandatory)]
        [string]$Path
    )

    if (-not (Test-Path $Path)) {

        New-Item -Path $Path -Force | Out-Null
        Write-Log "Created registry path: $Path" "INFO"
    }
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

        Ensure-RegistryPath $Path

        $Existing = Get-ItemProperty -Path $Path -Name $Name -ErrorAction SilentlyContinue

        if ($null -ne $Existing) {

            $CurrentValue = (Get-ItemProperty -Path $Path -Name $Name).$Name

            if ($CurrentValue -eq $Value) {

                Write-Log "$Path -> $Name already configured" "SKIP"
                return
            }

            Set-ItemProperty `
                -Path $Path `
                -Name $Name `
                -Value $Value `
                -Force
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

# LDAP HARDENING

Write-Log "Configuring LDAP hardening..." "INFO"

Set-RegistryValue `
    -Path "HKLM:\SYSTEM\CurrentControlSet\Services\NTDS\Parameters" `
    -Name "LDAPServerIntegrity" `
    -Value 2

Set-RegistryValue `
    -Path "HKLM:\SYSTEM\CurrentControlSet\Services\NTDS\Parameters" `
    -Name "LdapEnforceChannelBinding" `
    -Value 1

# MICROSOFT DEFENDER HARDENING

Write-Log "Configuring Microsoft Defender..." "INFO"

# MAPS / Cloud Protection

Set-RegistryValue `
    -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" `
    -Name "LocalSettingOverrideSpynetReporting" `
    -Value 0

Set-RegistryValue `
    -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" `
    -Name "SpynetReporting" `
    -Value 2

# Engine

Set-RegistryValue `
    -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\MpEngine" `
    -Name "EnableFileHashComputation" `
    -Value 1

# RTP

$RTP = "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection"

Set-RegistryValue -Path $RTP -Name "DisableIOAVProtection" -Value 0
Set-RegistryValue -Path $RTP -Name "DisableRealtimeMonitoring" -Value 0
Set-RegistryValue -Path $RTP -Name "DisableBehaviorMonitoring" -Value 0
Set-RegistryValue -Path $RTP -Name "DisableScriptScanning" -Value 0

# Scan

$Scan = "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Scan"

Set-RegistryValue -Path $Scan -Name "DisableRemovableDriveScanning" -Value 0
Set-RegistryValue -Path $Scan -Name "DisableEmailScanning" -Value 0

# PUA

Set-RegistryValue `
    -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" `
    -Name "PUAProtection" `
    -Value 1

Set-RegistryValue `
    -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" `
    -Name "DisableAntiSpyware" `
    -Value 0

# ASR RULES

Write-Log "Configuring ASR rules..." "INFO"

Set-RegistryValue `
    -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR" `
    -Name "ExploitGuard_ASR_Rules" `
    -Value 1

$ASRRules = @(
    "d4f940ab-401b-4efc-aadc-ad5f3c50688a"
    "3b576869-a4ec-4529-8536-b80a7769e899"
    "5beb7efe-fd9a-4556-801d-275e5ffc04cc"
    "75668c1f-73b5-4cf0-bb93-3ecf5cb7cc84"
    "7674ba52-37eb-4a4f-a9a1-f0f9a1619a2c"
    "92e97fa1-2edf-4476-bdd6-9dd0b4dddc7b"
    "9e6c4e1f-7d60-472f-ba1a-a39ef669e4b2"
    "b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4"
    "be9ba2d9-53ea-4cdc-84e5-9b1eeee46550"
    "d3e037e1-3eb8-44c8-a917-57927947596d"
    "26190899-1602-49e8-8b27-eb1d0a1ce869"
    "e6db77e5-3df2-4cf1-b95a-636979351e5b"
)

foreach ($Rule in $ASRRules) {

    Set-RegistryValue `
        -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules" `
        -Name $Rule `
        -Value 1
}

# SECURITY OPTIONS

Set-RegistryValue `
    -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" `
    -Name "SCENoApplyLegacyAuditPolicy" `
    -Value 1

# DEVICE GUARD / CREDENTIAL GUARD

Write-Log "Configuring Device Guard / Credential Guard..." "INFO"

try {

    $CPU = Get-CimInstance Win32_Processor

    if ($CPU.VirtualizationFirmwareEnabled) {

        if ($EnableCredentialGuard) {

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
                -Name "LsaCfgFlags" `
                -Value 1

            Set-RegistryValue `
                -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" `
                -Name "LsaCfgFlags" `
                -Value 1

            Write-Log "Credential Guard configured" "OK"
        }
        else {

            Write-Log "Credential Guard skipped" "WARN"
        }
    }
    else {

        Write-Log "Virtualization not supported - Credential Guard skipped" "WARN"
    }
}
catch {

    Write-Log "Credential Guard configuration failed: $_" "ERROR"
}

# WDAC WARNING

Write-Log "WDAC deployment intentionally skipped" "WARN"
Write-Log "Deploy signed WDAC CI policy separately before enabling enforcement" "WARN"

# KERNEL / SEHOP

Set-RegistryValue `
    -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Kernel" `
    -Name "DisableExceptionChainValidation" `
    -Value 0

# APPMODEL

Set-RegistryValue `
    -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\AppModel\StateManager" `
    -Name "AllowSharedLocalAppData" `
    -Value 0

# LSA PROTECTION

Set-RegistryValue `
    -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" `
    -Name "RunAsPPL" `
    -Value 1

Set-RegistryValue `
    -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" `
    -Name "RunAsPPLBoot" `
    -Value 1

# AUTORUN / USB

Set-RegistryValue `
    -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer" `
    -Name "NoAutoplayfornonVolume" `
    -Value 1

Set-RegistryValue `
    -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" `
    -Name "NoDriveTypeAutoRun" `
    -Value 255

# WINRM HARDENING

if ($DisableWinRM) {

    Write-Log "Hardening WinRM..." "INFO"

    $WinRMClient = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client"
    $WinRMService = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service"

    Set-RegistryValue -Path $WinRMClient -Name "AllowBasic" -Value 0
    Set-RegistryValue -Path $WinRMClient -Name "AllowUnencryptedTraffic" -Value 0
    Set-RegistryValue -Path $WinRMClient -Name "AllowDigest" -Value 0

    Set-RegistryValue -Path $WinRMService -Name "AllowBasic" -Value 0
    Set-RegistryValue -Path $WinRMService -Name "AllowUnencryptedTraffic" -Value 0
    Set-RegistryValue -Path $WinRMService -Name "DisableRunAs" -Value 1

    Set-RegistryValue `
        -Path "$WinRMService\WinRS" `
        -Name "AllowRemoteShellAccess" `
        -Value 0

    Write-Log "WinRM hardened" "OK"
}
else {

    Write-Log "WinRM hardening skipped" "WARN"
}

# DLL SEARCH MODE

Set-RegistryValue `
    -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager" `
    -Name "SafeDllSearchMode" `
    -Value 1

# EXPLOIT GUARD

Set-RegistryValue `
    -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Network Protection" `
    -Name "EnableNetworkProtection" `
    -Value 1

if ($EnableControlledFolderAccess) {

    Set-RegistryValue `
        -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Controlled Folder Access" `
        -Name "EnableControlledFolderAccess" `
        -Value 1

    Write-Log "Controlled Folder Access enabled" "OK"
}
else {

    Write-Log "Controlled Folder Access skipped" "WARN"
}

# WINDOWS SCRIPT HOST

Set-RegistryValue `
    -Path "HKLM:\SOFTWARE\Microsoft\Windows Script Host\Settings" `
    -Name "Enabled" `
    -Value 0

# PROCESS MITIGATIONS

Write-Log "Applying process mitigations..." "INFO"

try {

    Set-ProcessMitigation -System -Enable DEP
    Set-ProcessMitigation -System -Enable SEHOP
    Set-ProcessMitigation -System -Disable SEHOPTelemetry
    Set-ProcessMitigation -System -Disable SEHOPOverrideSEHOP
    Set-ProcessMitigation -System -Enable ForceRelocateImages
    Set-ProcessMitigation -System -Disable OverrideForceRelocateImages
    Set-ProcessMitigation -System -Disable OverrideBottomUp
    Set-ProcessMitigation -System -Enable BottomUp
    Set-ProcessMitigation -System -Enable HighEntropy

    Write-Log "Process mitigations configured" "OK"
}
catch {

    Write-Log "Process mitigations failed: $_" "ERROR"
}

# DEP ALWAYS ON

try {

    bcdedit /set {current} nx AlwaysOn | Out-Null

    Write-Log "DEP AlwaysOn configured" "OK"
}
catch {

    Write-Log "DEP configuration failed: $_" "ERROR"
}

# WDIGEST

Set-RegistryValue `
    -Path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest" `
    -Name "UseLogonCredential" `
    -Value 0

# TAMPER PROTECTION

try {

    Set-RegistryValue `
        -Path "HKLM:\SOFTWARE\Microsoft\Windows Defender\Features" `
        -Name "TamperProtection" `
        -Value 5

    Write-Log "Tamper Protection registry value applied" "OK"
}
catch {

    Write-Log "Tamper Protection protected by Windows/platform management" "WARN"
}

# COMPLETION

Write-Host " DOMAIN CONTROLLER endpoint hardening completed" -ForegroundColor Green
Write-Host " Reboot strongly recommended" -ForegroundColor Yellow

Stop-Transcript
