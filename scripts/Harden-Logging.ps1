function Ensure-Key {
    param ($Path)
    if (-not (Test-Path $Path)) {
        New-Item -Path $Path | Out-Null
    }
}

function Set-Value {
    param ($Path, $Name, $Value)

    Ensure-Key $Path

    New-ItemProperty `
        -Path $Path `
        -Name $Name `
        -Value $Value `
        -PropertyType DWord `
        -Force | Out-Null
}


# WINDOWS FIREWALL LOGGING

# DOMAIN PROFILE
Set-Value "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging" "LogFileSize" 16384
Set-Value "HKLM:\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile\Logging" "LogFileSize" 16384

Set-Value "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging" "LogDroppedPackets" 1
Set-Value "HKLM:\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile\Logging" "LogDroppedPackets" 1

Set-Value "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging" "LogSuccessfulConnections" 1
Set-Value "HKLM:\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile\Logging" "LogSuccessfulConnections" 1

# PRIVATE PROFILE
Set-Value "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging" "LogFileSize" 16384
Set-Value "HKLM:\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\Logging" "LogFileSize" 16384

Set-Value "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging" "LogDroppedPackets" 1
Set-Value "HKLM:\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\Logging" "LogDroppedPackets" 1

Set-Value "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging" "LogSuccessfulConnections" 1
Set-Value "HKLM:\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\Logging" "LogSuccessfulConnections" 1

# PUBLIC PROFILE
Set-Value "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging" "LogFileSize" 16384
Set-Value "HKLM:\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile\Logging" "LogFileSize" 16384

Set-Value "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging" "LogDroppedPackets" 1
Set-Value "HKLM:\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile\Logging" "LogDroppedPackets" 1

Set-Value "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging" "LogSuccessfulConnections" 1
Set-Value "HKLM:\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile\Logging" "LogSuccessfulConnections" 1

# POWERSHELL LOGGING

# Windows PowerShell
Set-Value "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ModuleLogging" "EnableModuleLogging" 1
Set-Value "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" "EnableScriptBlockLogging" 1
Set-Value "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" "EnableScriptBlockInvocationLogging" 1

# PowerShell Core
Set-Value "HKLM:\Software\Policies\Microsoft\PowerShellCore\ModuleLogging" "EnableModuleLogging" 1
Set-Value "HKLM:\Software\Policies\Microsoft\PowerShellCore\ModuleLogging" "UseWindowsPowerShellPolicySetting" 1

Set-Value "HKLM:\Software\Policies\Microsoft\PowerShellCore\ScriptBlockLogging" "EnableScriptBlockLogging" 1
Set-Value "HKLM:\Software\Policies\Microsoft\PowerShellCore\ScriptBlockLogging" "EnableScriptBlockInvocationLogging" 1
Set-Value "HKLM:\Software\Policies\Microsoft\PowerShellCore\ScriptBlockLogging" "UseWindowsPowerShellPolicySetting" 1

# SECURITY OPTIONS

Set-Value "HKLM:\System\CurrentControlSet\Control\Lsa" "SCENoApplyLegacyAuditPolicy" 1
Set-Value "HKLM:\System\CurrentControlSet\Control\Lsa\MSV1_0" "AuditReceivingNTLMTraffic" 2
Set-Value "HKLM:\System\CurrentControlSet\Services\Netlogon\Parameters" "AuditNTLMInDomain" 7

Set-Value "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\LSASS.exe" "AuditLevel" 8

# AUDIT POLICY

function Audit {
    param ($Guid, $Success, $Failure)
    auditpol /set /subcategory:"$Guid" /success:$Success /failure:$Failure | Out-Null
}

Audit "{0CCE923F-69AE-11D9-BED3-505054503030}" enable enable
Audit "{0CCE9237-69AE-11D9-BED3-505054503030}" enable disable
Audit "{0CCE9235-69AE-11D9-BED3-505054503030}" enable enable
Audit "{0CCE922D-69AE-11D9-BED3-505054503030}" enable enable

Audit "{0CCE9248-69AE-11D9-BED3-505054503030}" enable disable
Audit "{0CCE922B-69AE-11D9-BED3-505054503030}" enable enable
Audit "{0CCE9217-69AE-11D9-BED3-505054503030}" disable enable

Audit "{0CCE9249-69AE-11D9-BED3-505054503030}" enable disable
Audit "{0CCE9215-69AE-11D9-BED3-505054503030}" enable enable
Audit "{0CCE921C-69AE-11D9-BED3-505054503030}" enable enable
Audit "{0CCE921B-69AE-11D9-BED3-505054503030}" enable disable

Audit "{0CCE9244-69AE-11D9-BED3-505054503030}" disable enable
Audit "{0CCE921F-69AE-11D9-BED3-505054503030}" enable enable
Audit "{0CCE9227-69AE-11D9-BED3-505054503030}" enable enable
Audit "{0CCE9245-69AE-11D9-BED3-505054503030}" enable enable
Audit "{0CCE9220-69AE-11D9-BED3-505054503030}" enable enable

Audit "{0CCE922F-69AE-11D9-BED3-505054503030}" enable disable
Audit "{0CCE9230-69AE-11D9-BED3-505054503030}" enable disable
Audit "{0CCE9232-69AE-11D9-BED3-505054503030}" enable enable
Audit "{0CCE9234-69AE-11D9-BED3-505054503030}" disable enable

Audit "{0CCE9228-69AE-11D9-BED3-505054503030}" enable enable

Audit "{0CCE9214-69AE-11D9-BED3-505054503030}" enable enable
Audit "{0CCE9210-69AE-11D9-BED3-505054503030}" enable disable
Audit "{0CCE9211-69AE-11D9-BED3-505054503030}" enable disable
Audit "{0CCE9212-69AE-11D9-BED3-505054503030}" enable enable

Write-Host "Done"
