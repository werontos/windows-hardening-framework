function Ensure-RegistryPath {
    param (
        [string]$Path
    )

    if (-not (Test-Path $Path)) {
        $parts = $Path -split '\\'
        $current = $parts[0]

        for ($i = 1; $i -lt $parts.Length; $i++) {
            $current = "$current\$($parts[$i])"
            if (-not (Test-Path $current)) {
                New-Item -Path $current | Out-Null
            }
        }
    }
}

function Set-RegValue {
    param (
        [string]$Path,
        [string]$Name,
        [int]$Value
    )

    Ensure-RegistryPath $Path

    if (Get-ItemProperty -Path $Path -Name $Name -ErrorAction SilentlyContinue) {
        Set-ItemProperty -Path $Path -Name $Name -Value $Value
    } else {
        New-ItemProperty -Path $Path -Name $Name -PropertyType DWord -Value $Value | Out-Null
    }

    Write-Host "[OK] $Path -> $Name = $Value"
}

$firewallPaths = @(
    "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging",
    "HKLM:\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile\Logging",

    "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging",
    "HKLM:\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\Logging",

    "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging",
    "HKLM:\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile\Logging"
)

foreach ($path in $firewallPaths) {
    Set-RegValue $path "LogFileSize" 16384
    Set-RegValue $path "LogDroppedPackets" 1
    Set-RegValue $path "LogSuccessfulConnections" 1
}


Set-RegValue "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ModuleLogging" "EnableModuleLogging" 1
Set-RegValue "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" "EnableScriptBlockLogging" 1
Set-RegValue "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" "EnableScriptBlockInvocationLogging" 1
Set-RegValue "HKLM:\Software\Policies\Microsoft\PowerShellCore\ModuleLogging" "EnableModuleLogging" 1
Set-RegValue "HKLM:\Software\Policies\Microsoft\PowerShellCore\ModuleLogging" "UseWindowsPowerShellPolicySetting" 1
Set-RegValue "HKLM:\Software\Policies\Microsoft\PowerShellCore\ScriptBlockLogging" "EnableScriptBlockLogging" 1
Set-RegValue "HKLM:\Software\Policies\Microsoft\PowerShellCore\ScriptBlockLogging" "EnableScriptBlockInvocationLogging" 1
Set-RegValue "HKLM:\Software\Policies\Microsoft\PowerShellCore\ScriptBlockLogging" "UseWindowsPowerShellPolicySetting" 1
Set-RegValue "HKLM:\System\CurrentControlSet\Control\Lsa" "SCENoApplyLegacyAuditPolicy" 1
Set-RegValue "HKLM:\System\CurrentControlSet\Control\Lsa\MSV1_0" "AuditReceivingNTLMTraffic" 2
Set-RegValue "HKLM:\System\CurrentControlSet\Services\Netlogon\Parameters" "AuditNTLMInDomain" 7
Set-RegValue "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\LSASS.exe" "AuditLevel" 8

$auditSettings = @(
    "{0CCE923F-69AE-11D9-BED3-505054503030}", # Credential Validation
    "{0CCE9235-69AE-11D9-BED3-505054503030}", # User Account Management
    "{0CCE922D-69AE-11D9-BED3-505054503030}", # DPAPI
    "{0CCE922B-69AE-11D9-BED3-505054503030}", # Process Creation
    "{0CCE9215-69AE-11D9-BED3-505054503030}", # Logon
    "{0CCE921C-69AE-11D9-BED3-505054503030}", # Other Logon
    "{0CCE921F-69AE-11D9-BED3-505054503030}", # Kernel Object
    "{0CCE9227-69AE-11D9-BED3-505054503030}", # Other Object Access
    "{0CCE9245-69AE-11D9-BED3-505054503030}", # Removable Storage
    "{0CCE9220-69AE-11D9-BED3-505054503030}", # SAM
    "{0CCE9232-69AE-11D9-BED3-505054503030}", # MPSSVC
    "{0CCE9228-69AE-11D9-BED3-505054503030}", # Privilege Use
    "{0CCE9214-69AE-11D9-BED3-505054503030}", # Other System
    "{0CCE9212-69AE-11D9-BED3-505054503030}", # System Integrity
    "{0CCE9224-69AE-11D9-BED3-505054503030}"  # File Share
)

foreach ($id in $auditSettings) {
    auditpol /set /subcategory:$id /success:enable /failure:enable
}

auditpol /set /subcategory:"{0CCE9217-69AE-11D9-BED3-505054503030}" /success:disable /failure:enable
auditpol /set /subcategory:"{0CCE9237-69AE-11D9-BED3-505054503030}" /success:enable /failure:disable
auditpol /set /subcategory:"{0CCE9248-69AE-11D9-BED3-505054503030}" /success:enable /failure:disable
auditpol /set /subcategory:"{0CCE9249-69AE-11D9-BED3-505054503030}" /success:enable /failure:disable
auditpol /set /subcategory:"{0CCE922F-69AE-11D9-BED3-505054503030}" /success:enable /failure:disable
auditpol /set /subcategory:"{0CCE9230-69AE-11D9-BED3-505054503030}" /success:enable /failure:disable
auditpol /set /subcategory:"{0CCE9234-69AE-11D9-BED3-505054503030}" /success:disable /failure:enable
auditpol /set /subcategory:"{0CCE9210-69AE-11D9-BED3-505054503030}" /success:enable /failure:disable
auditpol /set /subcategory:"{0CCE9211-69AE-11D9-BED3-505054503030}" /success:enable /failure:disable
auditpol /set /subcategory:"{0CCE9244-69AE-11D9-BED3-505054503030}" /success:disable /failure:enable

Set-RegValue "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit" "ProcessCreationIncludeCmdLine_Enabled" 1

wevtutil sl Security /ms:1073741824
wevtutil sl System /ms:536870912
wevtutil sl Application /ms:536870912
wevtutil sl "Microsoft-Windows-PowerShell/Operational" /ms:104857600

Write-Host "`nLogging-Hardening DONE" -ForegroundColor Green
