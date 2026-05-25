[CmdletBinding()]
param(
    [switch]$StrictMode,
    [switch]$EnableCredentialGuard,
    [switch]$EnableControlledFolderAccess,
    [switch]$DisableWinRM,
    [switch]$EnableAggressiveASR,
    [switch]$EnableAdvancedMitigations
)

# ENTERPRISE DOMAIN CONTROLLER ENDPOINT HARDENING
# PRODUCTION-SAFE VERSION

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

# VALIDATION

try {

    $ComputerSystem = Get-CimInstance Win32_ComputerSystem

    if ($ComputerSystem.DomainRole -lt 4) {

        Write-Host "[ERROR] This system is NOT a Domain Controller." -ForegroundColor Red
        exit 1
    }
}
catch {

    Write-Host "[ERROR] Unable to validate DC role: $_" -ForegroundColor Red
    exit 1
}

# ADMIN CHECK

$Identity = [Security.Principal.WindowsIdentity]::GetCurrent()
$Principal = New-Object Security.Principal.WindowsPrincipal($Identity)

if (-not $Principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {

    Write-Host "[ERROR] Administrator privileges required." -ForegroundColor Red
    exit 1
}

# LOGGING

$LogPath = "C:\ProgramData\Hardening\Logs"

if (-not (Test-Path $LogPath)) {

    New-Item -ItemType Directory -Path $LogPath -Force | Out-Null
}

$Transcript = Join-Path `
    $LogPath `
    "Endpoint_DC_$(Get-Date -Format 'yyyyMMdd_HHmmss').log"

Start-Transcript -Path $Transcript -Append

Write-Host " DOMAIN CONTROLLER ENDPOINT HARDENING" -ForegroundColor Cyan


# BACKUP

New-Item `
    -ItemType Directory `
    -Path "C:\ProgramData\Hardening" `
    -Force | Out-Null

reg export HKLM `
    "C:\ProgramData\Hardening\HKLM_Endpoint_DC_Backup_$(Get-Date -Format 'yyyyMMdd_HHmmss').reg" `
    /y 2>$null

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

function Ensure-RegistryPath {

    param(
        [Parameter(Mandatory)]
        [string]$Path
    )

    if (-not (Test-Path $Path)) {

        New-Item `
            -Path $Path `
            -Force | Out-Null

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

        $Existing = Get-ItemProperty `
            -Path $Path `
            -Name $Name `
            -ErrorAction SilentlyContinue

        if ($null -ne $Existing) {

            $CurrentValue = (Get-ItemProperty `
                -Path $Path `
                -Name $Name).$Name

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
    -Value 2

# LSA / NTLM / WDIGEST

Write-Log "Configuring LSA protections..." "INFO"

Set-RegistryValue `
    -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" `
    -Name "NoLMHash" `
    -Value 1

Set-RegistryValue `
    -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" `
    -Name "RestrictAnonymousSAM" `
    -Value 1

Set-RegistryValue `
    -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0" `
    -Name "AuditReceivingNTLMTraffic" `
    -Value 2

Set-RegistryValue `
    -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" `
    -Name "AuditNTLMInDomain" `
    -Value 7

Set-RegistryValue `
    -Path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest" `
    -Name "UseLogonCredential" `
    -Value 0

# MICROSOFT DEFENDER

Write-Log "Configuring Microsoft Defender..." "INFO"

# Cloud Protection

Set-RegistryValue `
    -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" `
    -Name "SpynetReporting" `
    -Value 2

Set-RegistryValue `
    -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" `
    -Name "SubmitSamplesConsent" `
    -Value 1

# Engine

Set-RegistryValue `
    -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\MpEngine" `
    -Name "EnableFileHashComputation" `
    -Value 1

# Realtime Protection

$RTP = "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection"

Set-RegistryValue -Path $RTP -Name "DisableRealtimeMonitoring" -Value 0
Set-RegistryValue -Path $RTP -Name "DisableBehaviorMonitoring" -Value 0
Set-RegistryValue -Path $RTP -Name "DisableIOAVProtection" -Value 0
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

# Tamper Protection

try {

    Set-RegistryValue `
        -Path "HKLM:\SOFTWARE\Microsoft\Windows Defender\Features" `
        -Name "TamperProtection" `
        -Value 5
}
catch {

    Write-Log "Tamper Protection managed by platform" "WARN"
}

# ASR RULES

Write-Log "Configuring ASR rules..." "INFO"

$ASRMode = 2

if ($EnableAggressiveASR) {

    $ASRMode = 1

    Write-Log "Aggressive ASR BLOCK mode enabled" "WARN"
}
else {

    Write-Log "ASR running in AUDIT mode (recommended first)" "WARN"
}

$ASRRules = @(

    # Block Office child processes
    "d4f940ab-401b-4efc-aadc-ad5f3c50688a"

    # Block Office executable content
    "3b576869-a4ec-4529-8536-b80a7769e899"

    # Block obfuscated scripts
    "5beb7efe-fd9a-4556-801d-275e5ffc04cc"

    # Block credential stealing
    "9e6c4e1f-7d60-472f-ba1a-a39ef669e4b2"

    # Block PSExec/WMI lateral movement
    "d1e49aac-8f56-4280-b9ba-993a6d77406c"

    # Block executable email content
    "be9ba2d9-53ea-4cdc-84e5-9b1eeee46550"

    # Block unsigned USB processes
    "b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4"
)

foreach ($Rule in $ASRRules) {

    Set-RegistryValue `
        -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules" `
        -Name $Rule `
        -Value $ASRMode
}

# OPTIONAL AGGRESSIVE ASR

# THESE CAN BREAK:
# - SCCM
# - backup software
# - admin tools
# - PowerShell automation
# - remote management

# Uncomment ONLY after testing

# $AggressiveRules = @(
#     "d3e037e1-3eb8-44c8-a917-57927947596d"
#     "26190899-1602-49e8-8b27-eb1d0a1ce869"
#     "e6db77e5-3df2-4cf1-b95a-636979351e5b"
# )

# DEVICE GUARD / CREDENTIAL GUARD

try {

    $CPU = Get-CimInstance Win32_Processor

    if ($CPU.VirtualizationFirmwareEnabled) {

        if ($EnableCredentialGuard) {

            Write-Log "Enabling Credential Guard..." "WARN"

            Set-RegistryValue `
                -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" `
                -Name "EnableVirtualizationBasedSecurity" `
                -Value 1

            Set-RegistryValue `
                -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" `
                -Name "RequirePlatformSecurityFeatures" `
                -Value 3

            Set-RegistryValue `
                -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" `
                -Name "LsaCfgFlags" `
                -Value 1
        }
        else {

            Write-Log "Credential Guard skipped" "WARN"
        }
    }
    else {

        Write-Log "Virtualization unsupported" "WARN"
    }
}
catch {

    Write-Log "Credential Guard failed: $_" "ERROR"
}

# OPTIONAL LSASS PPL

# CAN BREAK:
# - EDR
# - AV
# - password filters
# - identity integrations

# TEST BEFORE ENABLE

# Set-RegistryValue `
#     -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" `
#     -Name "RunAsPPL" `
#     -Value 1

# Set-RegistryValue `
#     -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" `
#     -Name "RunAsPPLBoot" `
#     -Value 1

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

# DLL SEARCH MODE

Set-RegistryValue `
    -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager" `
    -Name "SafeDllSearchMode" `
    -Value 1

# KERNEL / DEP / SEHOP

Set-RegistryValue `
    -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Kernel" `
    -Name "DisableExceptionChainValidation" `
    -Value 0

try {

    bcdedit /set {current} nx AlwaysOn | Out-Null

    Write-Log "DEP AlwaysOn configured" "OK"
}
catch {

    Write-Log "DEP configuration failed" "ERROR"
}

# OPTIONAL ADVANCED MITIGATIONS

if ($EnableAdvancedMitigations) {

    Write-Log "Applying advanced mitigations..." "WARN"

    try {

        Set-ProcessMitigation -System -Enable DEP
        Set-ProcessMitigation -System -Enable SEHOP
        Set-ProcessMitigation -System -Enable BottomUp
        Set-ProcessMitigation -System -Enable HighEntropy

        Write-Log "Advanced mitigations configured" "OK"
    }
    catch {

        Write-Log "Mitigation configuration failed: $_" "ERROR"
    }
}
else {

    Write-Log "Advanced mitigations skipped" "WARN"
}

# AUTORUN / USB

Set-RegistryValue `
    -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer" `
    -Name "NoAutoplayfornonVolume" `
    -Value 1

Set-RegistryValue `
    -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" `
    -Name "NoDriveTypeAutoRun" `
    -Value 255

# NETWORK PROTECTION

Set-RegistryValue `
    -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Network Protection" `
    -Name "EnableNetworkProtection" `
    -Value 1

# OPTIONAL CONTROLLED FOLDER ACCESS

# CAN BREAK:
# - SYSVOL
# - backup software
# - scripts
# - management agents

if ($EnableControlledFolderAccess) {

    Set-RegistryValue `
        -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Controlled Folder Access" `
        -Name "EnableControlledFolderAccess" `
        -Value 1

    Write-Log "Controlled Folder Access enabled" "WARN"
}
else {

    Write-Log "Controlled Folder Access skipped" "WARN"
}

# OPTIONAL WINDOWS SCRIPT HOST DISABLE

# CAN BREAK:
# - login scripts
# - GPO scripts
# - legacy automation

# Set-RegistryValue `
#     -Path "HKLM:\SOFTWARE\Microsoft\Windows Script Host\Settings" `
#     -Name "Enabled" `
#     -Value 0

# WINRM HARDENING

if ($DisableWinRM) {

    Write-Log "Hardening WinRM..." "WARN"

    $WinRMClient  = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client"
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
}
else {

    Write-Log "WinRM hardening skipped" "WARN"
}

# PRINT SPOOLER

try {

    $Spooler = Get-Service Spooler -ErrorAction SilentlyContinue

    if ($Spooler) {

        Stop-Service `
            -Name Spooler `
            -Force `
            -ErrorAction SilentlyContinue

        Set-Service `
            -Name Spooler `
            -StartupType Disabled

        Write-Log "Print Spooler disabled" "OK"
    }
}
catch {

    Write-Log "Print Spooler disable failed: $_" "ERROR"
}

# EVENT LOGS

try {

    wevtutil sl Security /ms:1073741824
    wevtutil sl System /ms:536870912
    wevtutil sl Application /ms:536870912

    Write-Log "Event log sizes configured" "OK"
}
catch {

    Write-Log "Event log configuration failed" "ERROR"
}

# FINAL

Write-Host " DOMAIN CONTROLLER HARDENING COMPLETE" -ForegroundColor Green

Write-Host " Reboot strongly recommended" -ForegroundColor Yellow
Write-Host ""

Stop-Transcript
