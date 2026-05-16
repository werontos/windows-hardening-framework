#Requires -RunAsAdministrator

Write-Host "Applying MEMBER endpoint hardening" -ForegroundColor Cyan

function Ensure-RegistryPath {
    param ([string]$Path)

    if (-not (Test-Path $Path)) {
        New-Item -Path $Path -Force | Out-Null
    }
}

function Set-DwordValue {
    param (
        [string]$Path,
        [string]$Name,
        [int]$Value
    )

    Ensure-RegistryPath $Path

    New-ItemProperty `
        -Path $Path `
        -Name $Name `
        -PropertyType DWord `
        -Value $Value `
        -Force | Out-Null

    Write-Host "[+] $Name = $Value"
}

# Microsoft Defender

Set-DwordValue "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" "LocalSettingOverrideSpynetReporting" 0
Set-DwordValue "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" "SpynetReporting" 0

Set-DwordValue "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\MpEngine" "EnableFileHashComputation" 1

Set-DwordValue "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" "DisableIOAVProtection" 0
Set-DwordValue "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" "DisableRealtimeMonitoring" 0
Set-DwordValue "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" "DisableBehaviorMonitoring" 0
Set-DwordValue "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" "DisableScriptScanning" 0

Set-DwordValue "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Reporting" "DisableGenericRePorts" 1

Set-DwordValue "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Scan" "DisableRemovableDriveScanning" 0
Set-DwordValue "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Scan" "DisableEmailScanning" 0

Set-DwordValue "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" "PUAProtection" 1
Set-DwordValue "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" "DisableAntiSpyware" 0

# ASR Rules

Set-DwordValue "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR" "ExploitGuard_ASR_Rules" 1

$ASRRules = @(
"d4f940ab-401b-4efc-aadc-ad5f3c50688a",
"3b576869-a4ec-4529-8536-b80a7769e899",
"5beb7efe-fd9a-4556-801d-275e5ffc04cc",
"75668c1f-73b5-4cf0-bb93-3ecf5cb7cc84",
"7674ba52-37eb-4a4f-a9a1-f0f9a1619a2c",
"92e97fa1-2edf-4476-bdd6-9dd0b4dddc7b",
"9e6c4e1f-7d60-472f-ba1a-a39ef669e4b2",
"b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4",
"be9ba2d9-53ea-4cdc-84e5-9b1eeee46550",
"d3e037e1-3eb8-44c8-a917-57927947596d",
"26190899-1602-49e8-8b27-eb1d0a1ce869",
"e6db77e5-3df2-4cf1-b95a-636979351e5b"
)

foreach ($Rule in $ASRRules) {
    Set-DwordValue "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\rules" $Rule 1
}

# Security / Device Guard


Set-DwordValue "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" "SCENoApplyLegacyAuditPolicy" 1
Set-DwordValue "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" "SubmitControl" 0

# MEMBER CONFIGURATION
Set-DwordValue "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" "LsaCfgFlags" 1

Set-DwordValue "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" "LsaCfgFlags" 1
# Set-DwordValue "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" "DeployConfigCIPolicy" 1
# WARNING: Requires signed WDAC policy — dangerous without proper CI policy configured

Set-DwordValue "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" "DisableExceptionChainValidation" 0

Set-DwordValue "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\AppModel\StateManager" "AllowSharedLocalAppData" 0

Set-DwordValue "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" "RunAsPPL" 1

Ensure-RegistryPath "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment"
New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" -Name "__PSLockdownPolicy" -PropertyType String -Value "4" -Force | Out-Null

Set-DwordValue "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer" "NoAutoplayfornonVolume" 1
Set-DwordValue "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" "NoDriveTypeAutoRun" 255

# WinRM

Set-DwordValue "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client" "AllowBasic" 0
Set-DwordValue "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service" "AllowBasic" 0
Set-DwordValue "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client" "AllowUnencryptedTraffic" 0
Set-DwordValue "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service" "AllowUnencryptedTraffic" 0
Set-DwordValue "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client" "AllowDigest" 0
Set-DwordValue "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service" "DisableRunAs" 1

# Misc

Set-DwordValue "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager" "SafeDllSearchMode" 1

Set-DwordValue "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Network Protection" "EnableNetworkProtection" 1

Set-DwordValue "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Controlled Folder Access" "EnableControlledFolderAccess" 1

Set-DwordValue "HKLM:\SOFTWARE\Microsoft\Windows Script Host\Settings" "Enabled" 0

# Mitigations

Set-ProcessMitigation -System -Enable DEP
Set-ProcessMitigation -System -Enable SEHOP
Set-ProcessMitigation -System -Disable SEHOPTelemetry
Set-ProcessMitigation -System -Disable SEHOPOverrideSEHOP
Set-ProcessMitigation -System -Enable ForceRelocateImages
Set-ProcessMitigation -System -Disable OverrideForceRelocateImages
Set-ProcessMitigation -System -Disable OverrideBottomUp
Set-ProcessMitigation -System -Enable BottomUp
Set-ProcessMitigation -System -Enable HighEntropy

# WDigest Authentication

Set-DwordValue "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest" "UseLogonCredential" 0

# Microsoft Defender Tamper Protection
# NOTE:
# Requires Tamper Protection management through Microsoft Defender portal,
# Intune, or manual enablement in Windows Security.
# Direct registry modification is often blocked by Windows.

try {
    Set-DwordValue "HKLM:\SOFTWARE\Microsoft\Windows Defender\Features" "TamperProtection" 5
}
catch {
    Write-Host "[!] Tamper Protection registry change blocked by Windows." -ForegroundColor Yellow
}

bcdedit /set {current} nx AlwaysOn

Write-Host "MEMBER hardening complete. Reboot recommended." -ForegroundColor Green
