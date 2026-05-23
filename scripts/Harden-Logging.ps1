[CmdletBinding(SupportsShouldProcess)]

param(
    [string]$LogPath = "C:\ProgramData\Hardening\Logs"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Continue"


# ROLE DETECTION


$IsDC = $false

try {
    $IsDC = (Get-WindowsFeature AD-Domain-Services `
        -ErrorAction SilentlyContinue).InstallState -eq "Installed"
}
catch {}


# LOGGING / BACKUP


New-Item -ItemType Directory -Path $LogPath -Force | Out-Null
New-Item -ItemType Directory -Path "C:\ProgramData\Hardening" -Force | Out-Null

Start-Transcript `
    -Path "$LogPath\Logging_$(Get-Date -f yyyyMMdd_HHmmss).log" `
    -Append

reg export HKLM `
    "C:\ProgramData\Hardening\HKLM_Logging_Backup_$(Get-Date -f yyyyMMdd).reg" `
    /y 2>$null


# FUNCTIONS


function Ensure-RegistryPath {

    param(
        [string]$Path
    )

    if (!(Test-Path $Path)) {
        New-Item -Path $Path -Force | Out-Null
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

function Set-AuditPolicy {

    param(
        [string]$Subcategory,
        [string]$Success,
        [string]$Failure
    )

    try {

        auditpol /set `
            /subcategory:$Subcategory `
            /success:$Success `
            /failure:$Failure | Out-Null

        Write-Host "[OK] Audit -> $Subcategory"
    }
    catch {
        Write-Warning "[FAILED] Audit -> $Subcategory"
    }
}


# FIREWALL LOGGING


$firewallPaths = @(

    "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging",
    "HKLM:\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile\Logging",

    "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging",
    "HKLM:\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\Logging",

    "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging",
    "HKLM:\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile\Logging"
)

foreach ($path in $firewallPaths) {

    Set-Reg $path "LogFileSize" "DWord" 16384
    Set-Reg $path "LogDroppedPackets" "DWord" 1
    Set-Reg $path "LogSuccessfulConnections" "DWord" 1
}


# POWERSHELL LOGGING


# Windows PowerShell

Set-Reg `
    "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ModuleLogging" `
    "EnableModuleLogging" `
    "DWord" `
    1

Set-Reg `
    "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" `
    "EnableScriptBlockLogging" `
    "DWord" `
    1

Set-Reg `
    "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" `
    "EnableScriptBlockInvocationLogging" `
    "DWord" `
    1

# REQUIRED by audit:
# ModuleNames = *

$modulePath = "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ModuleLogging\ModuleNames"

Ensure-RegistryPath $modulePath

Set-Reg `
    $modulePath `
    "*" `
    "String" `
    "*"

# PowerShell Core

Set-Reg `
    "HKLM:\Software\Policies\Microsoft\PowerShellCore\ModuleLogging" `
    "EnableModuleLogging" `
    "DWord" `
    1

Set-Reg `
    "HKLM:\Software\Policies\Microsoft\PowerShellCore\ModuleLogging" `
    "UseWindowsPowerShellPolicySetting" `
    "DWord" `
    1

Set-Reg `
    "HKLM:\Software\Policies\Microsoft\PowerShellCore\ScriptBlockLogging" `
    "EnableScriptBlockLogging" `
    "DWord" `
    1

Set-Reg `
    "HKLM:\Software\Policies\Microsoft\PowerShellCore\ScriptBlockLogging" `
    "EnableScriptBlockInvocationLogging" `
    "DWord" `
    1

Set-Reg `
    "HKLM:\Software\Policies\Microsoft\PowerShellCore\ScriptBlockLogging" `
    "UseWindowsPowerShellPolicySetting" `
    "DWord" `
    1


# NTLM / LSASS AUDITING


Set-Reg `
    "HKLM:\System\CurrentControlSet\Control\Lsa" `
    "SCENoApplyLegacyAuditPolicy" `
    "DWord" `
    1

Set-Reg `
    "HKLM:\System\CurrentControlSet\Control\Lsa\MSV1_0" `
    "AuditReceivingNTLMTraffic" `
    "DWord" `
    2

Set-Reg `
    "HKLM:\System\CurrentControlSet\Services\Netlogon\Parameters" `
    "AuditNTLMInDomain" `
    "DWord" `
    7

Set-Reg `
    "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\LSASS.exe" `
    "AuditLevel" `
    "DWord" `
    8


# AUDIT POLICIES


$AuditPolicies = @(
    "Credential Validation",
    "User Account Management",
    "DPAPI Activity",
    "Process Creation",
    "Logon",
    "Other Logon/Logoff Events",
    "Kernel Object",
    "Other Object Access Events",
    "Removable Storage",
    "SAM",
    "Filtering Platform Packet Drop",
    "Sensitive Privilege Use",
    "Other System Events",
    "System Integrity",
    "File Share"
)

foreach ($policy in $AuditPolicies) {

    Set-AuditPolicy `
        -Subcategory $policy `
        -Success enable `
        -Failure enable
}

# DC REQUIRED BY AUDIT

if ($IsDC) {

    Set-AuditPolicy `
        -Subcategory "Directory Service Access" `
        -Success enable `
        -Failure enable

    Set-AuditPolicy `
        -Subcategory "Directory Service Changes" `
        -Success enable `
        -Failure enable
}


# PROCESS CREATION LOGGING


Set-Reg `
    "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit" `
    "ProcessCreationIncludeCmdLine_Enabled" `
    "DWord" `
    1


# EVENT LOG SIZES


try {

    wevtutil sl Security /ms:1073741824
    wevtutil sl System /ms:536870912
    wevtutil sl Application /ms:536870912
    wevtutil sl "Microsoft-Windows-PowerShell/Operational" /ms:104857600

    Write-Host "[OK] Event log sizes configured"
}
catch {
    Write-Warning $_
}

Write-Host "`n[+] Logging Hardening COMPLETE" -ForegroundColor Green

Stop-Transcript
