#Requires -RunAsAdministrator

<#
    Harden-Network-Member.ps1
    SAFE Production-Oriented Network Hardening
    Member Server / Workstation Edition

    SAFE FOR:
    - Windows 10/11
    - Windows Server Member Servers
    - Domain joined systems
    - WinRM
    - RMM tools
    - Server Manager
    - RSAT
    - Enterprise environments

    GOALS:
    - Secure modern Windows environments
    - Avoid breaking management infrastructure
    - Maintain compatibility
#>

[CmdletBinding(SupportsShouldProcess)]

param(
    [string]$LogPath = "C:\ProgramData\Hardening\Logs"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Continue"

# =========================================================
# LOGGING / BACKUP
# =========================================================

New-Item -ItemType Directory -Path $LogPath -Force | Out-Null
New-Item -ItemType Directory -Path "C:\Temp" -Force | Out-Null
New-Item -ItemType Directory -Path "C:\ProgramData\Hardening" -Force | Out-Null

Start-Transcript `
    -Path "$LogPath\Network_MEMBER_$(Get-Date -Format yyyyMMdd_HHmmss).log" `
    -Append

try {

    reg export HKLM `
        "C:\ProgramData\Hardening\HKLM_Backup_$(Get-Date -Format yyyyMMdd).reg" `
        /y 2>$null
}
catch {}

$tempPath = "C:\Temp"

# =========================================================
# FUNCTIONS
# =========================================================

function Ensure-RegistryPath {

    param ([string]$Path)

    if (!(Test-Path $Path)) {

        New-Item -Path $Path -Force | Out-Null
    }
}

function Set-Reg {

    param (
        [string]$Path,
        [string]$Name,

        [ValidateSet("DWord","String","MultiString")]
        [string]$Type,

        $Value
    )

    Ensure-RegistryPath $Path

    try {

        switch ($Type) {

            "DWord" {

                if (Get-ItemProperty -Path $Path -Name $Name -ErrorAction SilentlyContinue) {

                    Set-ItemProperty `
                        -Path $Path `
                        -Name $Name `
                        -Value $Value
                }
                else {

                    New-ItemProperty `
                        -Path $Path `
                        -Name $Name `
                        -PropertyType DWord `
                        -Value $Value `
                        -Force | Out-Null
                }
            }

            "String" {

                if (Get-ItemProperty -Path $Path -Name $Name -ErrorAction SilentlyContinue) {

                    Set-ItemProperty `
                        -Path $Path `
                        -Name $Name `
                        -Value $Value
                }
                else {

                    New-ItemProperty `
                        -Path $Path `
                        -Name $Name `
                        -PropertyType String `
                        -Value $Value `
                        -Force | Out-Null
                }
            }

            "MultiString" {

                if (Get-ItemProperty -Path $Path -Name $Name -ErrorAction SilentlyContinue) {

                    Set-ItemProperty `
                        -Path $Path `
                        -Name $Name `
                        -Value $Value
                }
                else {

                    New-ItemProperty `
                        -Path $Path `
                        -Name $Name `
                        -PropertyType MultiString `
                        -Value $Value `
                        -Force | Out-Null
                }
            }
        }

        Write-Host "[OK] $Path -> $Name = $Value" -ForegroundColor Green
    }
    catch {

        Write-Warning "[FAILED] $Path -> $Name : $_"
    }
}

# =========================================================
# TLS HARDENING
# =========================================================

Write-Host "`n[*] TLS Hardening" -ForegroundColor Cyan

$protocols = @("TLS 1.0","TLS 1.1")

foreach ($proto in $protocols) {

    $server = "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\$proto\Server"
    $client = "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\$proto\Client"

    Ensure-RegistryPath $server
    Ensure-RegistryPath $client

    Set-Reg $server "Enabled" "DWord" 0
    Set-Reg $server "DisabledByDefault" "DWord" 1

    Set-Reg $client "Enabled" "DWord" 0
    Set-Reg $client "DisabledByDefault" "DWord" 1
}

# TLS 1.2

$tls12 = @(
    "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Server",
    "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Client"
)

foreach ($path in $tls12) {

    Ensure-RegistryPath $path

    Set-Reg $path "Enabled" "DWord" 1
    Set-Reg $path "DisabledByDefault" "DWord" 0
}

# =========================================================
# WEAK CIPHERS
# =========================================================

Write-Host "`n[*] Cipher Hardening" -ForegroundColor Cyan

$weakCiphers = @(
    "RC4 128/128",
    "RC4 64/128",
    "RC4 40/128",
    "Triple DES 168",
    "DES 56/56"
)

foreach ($cipher in $weakCiphers) {

    $path = "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\$cipher"

    Ensure-RegistryPath $path

    Set-Reg $path "Enabled" "DWord" 0
}

# =========================================================
# SMB HARDENING
# =========================================================

Write-Host "`n[*] SMB Hardening" -ForegroundColor Cyan

Set-Reg `
    "HKLM:\System\CurrentControlSet\Services\LanmanWorkstation\Parameters" `
    "RequireSecuritySignature" `
    DWord `
    1

Set-Reg `
    "HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters" `
    "RequireSecuritySignature" `
    DWord `
    1

Set-Reg `
    "HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters" `
    "EnableSecuritySignature" `
    DWord `
    1

# SMBv1 disable
# Legacy devices may fail

Set-Reg `
    "HKLM:\SYSTEM\CurrentControlSet\Services\MrxSmb10" `
    "Start" `
    DWord `
    4

Set-Reg `
    "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" `
    "SMB1" `
    DWord `
    0

try {

    Disable-WindowsOptionalFeature `
        -Online `
        -FeatureName SMB1Protocol `
        -NoRestart `
        -ErrorAction SilentlyContinue
}
catch {}

# =========================================================
# NTLM / LSA HARDENING
# =========================================================

Write-Host "`n[*] NTLM / LSA Hardening" -ForegroundColor Cyan

Set-Reg `
    "HKLM:\System\CurrentControlSet\Control\Lsa" `
    "RestrictAnonymous" `
    DWord `
    1

# May affect some inventory/RMM products

Set-Reg `
    "HKLM:\System\CurrentControlSet\Control\Lsa" `
    "RestrictRemoteSAM" `
    String `
    "O:BAG:BAD:(A;;RC;;;BA)"

# NTLMv2 only

Set-Reg `
    "HKLM:\System\CurrentControlSet\Control\Lsa" `
    "LmCompatibilityLevel" `
    DWord `
    5

Set-Reg `
    "HKLM:\System\CurrentControlSet\Control\Lsa\MSV1_0" `
    "allownullsessionfallback" `
    DWord `
    0

Set-Reg `
    "HKLM:\System\CurrentControlSet\Control\Lsa\pku2u" `
    "AllowOnlineID" `
    DWord `
    0

# =========================================================
# DNS / LLMNR
# =========================================================

Write-Host "`n[*] DNS / LLMNR Hardening" -ForegroundColor Cyan

# Disable LLMNR

Set-Reg `
    "HKLM:\Software\Policies\Microsoft\Windows NT\DNSClient" `
    "EnableMulticast" `
    DWord `
    0

# NetBIOS node type

Set-Reg `
    "HKLM:\SYSTEM\CurrentControlSet\Services\NetBT\Parameters" `
    "NodeType" `
    DWord `
    2

# =========================================================
# WCN / PEERNET
# =========================================================

Write-Host "`n[*] WCN / Peernet Hardening" -ForegroundColor Cyan

Set-Reg `
    "HKLM:\Software\Policies\Microsoft\Peernet" `
    "Disabled" `
    DWord `
    1

$wcn = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars"

Set-Reg $wcn "EnableRegistrars" DWord 0
Set-Reg $wcn "DisableUPnPRegistrar" DWord 1
Set-Reg $wcn "DisableInBand802DOT11Registrar" DWord 1
Set-Reg $wcn "DisableFlashConfigRegistrar" DWord 1
Set-Reg $wcn "DisableWPDRegistrar" DWord 1

# =========================================================
# NETWORK CONNECTIONS
# =========================================================

Write-Host "`n[*] Network Connections Hardening" -ForegroundColor Cyan

$nc = "HKLM:\Software\Policies\Microsoft\Windows\Network Connections"

Set-Reg $nc "NC_AllowNetBridge_NLA" DWord 0
Set-Reg $nc "NC_ShowSharedAccessUI" DWord 0
Set-Reg $nc "NC_StdDomainUserSetLocation" DWord 1

# =========================================================
# UNC HARDENING
# =========================================================

Write-Host "`n[*] UNC Hardening" -ForegroundColor Cyan

# Safe in modern domains

$unc = "HKLM:\Software\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths"

Set-Reg `
    $unc `
    "\\*\NETLOGON" `
    String `
    "RequireMutualAuthentication=1,RequireIntegrity=1"

Set-Reg `
    $unc `
    "\\*\SYSVOL" `
    String `
    "RequireMutualAuthentication=1,RequireIntegrity=1"

# =========================================================
# WINRM SAFE HARDENING
# =========================================================

Write-Host "`n[*] WinRM Safe Hardening" -ForegroundColor Cyan

# SAFE:
# does NOT disable WinRM
# preserves Server Manager and RSAT

Set-Reg `
    "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client" `
    "AllowBasic" `
    DWord `
    0

Set-Reg `
    "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service" `
    "AllowBasic" `
    DWord `
    0

Set-Reg `
    "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client" `
    "AllowUnencryptedTraffic" `
    DWord `
    0

Set-Reg `
    "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service" `
    "AllowUnencryptedTraffic" `
    DWord `
    0

# =========================================================
# OTHER SAFE HARDENING
# =========================================================

Write-Host "`n[*] Additional Hardening" -ForegroundColor Cyan

Set-Reg `
    "HKLM:\Software\Policies\Microsoft\Windows\LanmanWorkstation" `
    "AllowInsecureGuestAuth" `
    DWord `
    0

Set-Reg `
    "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" `
    "UserAuthentication" `
    DWord `
    1

Set-Reg `
    "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Device Metadata" `
    "PreventDeviceMetadataFromNetwork" `
    DWord `
    1

Set-Reg `
    "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Wpad" `
    "WpadOverride" `
    DWord `
    1

# =========================================================
# COMPLETION
# =========================================================

Write-Host ""
Write-Host "[+] SAFE MEMBER Network Hardening Complete" -ForegroundColor Green
Write-Host "[!] Reboot Recommended" -ForegroundColor Yellow

Stop-Transcript
