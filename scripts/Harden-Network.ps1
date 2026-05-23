[CmdletBinding(SupportsShouldProcess)]

param(
    [string]$LogPath = "C:\ProgramData\Hardening\Logs"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Continue"


# LOGGING BACKUP


New-Item -ItemType Directory -Path $LogPath -Force | Out-Null
New-Item -ItemType Directory -Path "C:\Temp" -Force | Out-Null
New-Item -ItemType Directory -Path "C:\ProgramData\Hardening" -Force | Out-Null

Start-Transcript `
    -Path "$LogPath\Network_$(Get-Date -f yyyyMMdd_HHmmss).log" `
    -Append

reg export HKLM `
    "C:\ProgramData\Hardening\HKLM_Backup_$(Get-Date -f yyyyMMdd).reg" `
    /y 2>$null

$tempPath = "C:\Temp"


# FUNCTIONS


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
        [string]$Type,
        $Value
    )

    Ensure-RegistryPath $Path

    try {

        switch ($Type) {

            "DWord" {
                Set-ItemProperty `
                    -Path $Path `
                    -Name $Name `
                    -Type DWord `
                    -Value $Value
            }

            "String" {
                Set-ItemProperty `
                    -Path $Path `
                    -Name $Name `
                    -Type String `
                    -Value $Value
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

        $Content | Out-File $infPath -Encoding Unicode

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

        Remove-Item $infPath -Force -ErrorAction SilentlyContinue
        Remove-Item $dbPath -Force -ErrorAction SilentlyContinue
    }
}

# TLS HARDENING


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

# TLS 1.2 Explicit Enable

$tls12 = @(
    "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Server",
    "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Client"
)

foreach ($path in $tls12) {

    Ensure-RegistryPath $path

    Set-Reg $path "Enabled" "DWord" 1
    Set-Reg $path "DisabledByDefault" "DWord" 0
}

# Disable Weak Ciphers

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


# USER RIGHTS ASSIGNMENT


$networkLogon = @"
[Unicode]
Unicode=yes
[Version]
signature="`$CHICAGO`$"
Revision=1
[Privilege Rights]
SeNetworkLogonRight = *S-1-5-9,*S-1-5-32-544,*S-1-5-11
"@

Invoke-Secedit -Content $networkLogon -Area USER_RIGHTS

$denyNetworkLogon = @"
[Unicode]
Unicode=yes
[Version]
signature="`$CHICAGO`$"
Revision=1
[Privilege Rights]
SeDenyNetworkLogonRight = *S-1-5-32-546,*S-1-5-114
"@

Invoke-Secedit -Content $denyNetworkLogon -Area USER_RIGHTS

$forceLogoff = @"
[Unicode]
Unicode=yes
[Version]
signature="`$CHICAGO`$"
Revision=1
[System Access]
ForceLogoffWhenHourExpire = 1
"@

Invoke-Secedit -Content $forceLogoff -Area SECURITYPOLICY


# SMB HARDENING


Set-Reg "HKLM:\System\CurrentControlSet\Services\LanmanWorkstation\Parameters" "RequireSecuritySignature" DWord 1

Set-Reg "HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters" "RequireSecuritySignature" DWord 1

Set-Reg "HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters" "EnableSecuritySignature" DWord 1

Set-Reg "HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters" "SMBServerNameHardeningLevel" DWord 1

Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" "NullSessionPipes" MultiString @("netlogon","samr","lsarpc")

Set-Reg "HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters" "RestrictNullSessAccess" DWord 1

Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Services\MrxSmb10" "Start" DWord 4

Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" "SMB1" DWord 0

try {
    Disable-WindowsOptionalFeature `
        -Online `
        -FeatureName SMB1Protocol `
        -NoRestart `
        -ErrorAction SilentlyContinue
}
catch {
    Write-Warning $_
}

try {
    Set-SmbServerConfiguration `
        -EncryptData $true `
        -Force
}
catch {
    Write-Warning $_
}


# NTLM / LSA HARDENING


Set-Reg "HKLM:\System\CurrentControlSet\Control\Lsa" "RestrictAnonymous" DWord 1

Set-Reg "HKLM:\System\CurrentControlSet\Control\Lsa" "RestrictRemoteSAM" String "O:BAG:BAD:(A;;RC;;;BA)"

Set-Reg "HKLM:\System\CurrentControlSet\Control\Lsa" "UseMachineId" DWord 1

Set-Reg "HKLM:\System\CurrentControlSet\Control\Lsa" "LmCompatibilityLevel" DWord 5

Set-Reg "HKLM:\System\CurrentControlSet\Control\Lsa\MSV1_0" "allownullsessionfallback" DWord 0

Set-Reg "HKLM:\System\CurrentControlSet\Control\Lsa\MSV1_0" "NTLMMinClientSec" DWord 537395200

Set-Reg "HKLM:\System\CurrentControlSet\Control\Lsa\MSV1_0" "NTLMMinServerSec" DWord 537395200

Set-Reg "HKLM:\System\CurrentControlSet\Control\Lsa\pku2u" "AllowOnlineID" DWord 0


# KERBEROS


Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Kerberos\Parameters" "SupportedEncryptionTypes" DWord 2147483640


# DNS / NETWORK


Set-Reg "HKLM:\Software\Policies\Microsoft\Windows NT\DNSClient" "DoHPolicy" DWord 3

Set-Reg "HKLM:\Software\Policies\Microsoft\Windows NT\DNSClient" "EnableMulticast" DWord 0

Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Services\TCPIP6\Parameters" "DisabledComponents" DWord 32

Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Services\NetBT\Parameters" "NodeType" DWord 2

# LLMNR / PEERNET / LLTD


$lltd = "HKLM:\Software\Policies\Microsoft\Windows\LLTD"

Set-Reg $lltd "AllowLLTDIOOndomain" DWord 0
Set-Reg $lltd "AllowLLTDIOOnPublicNet" DWord 0
Set-Reg $lltd "EnableLLTDIO" DWord 0
Set-Reg $lltd "ProhibitLLTDIOOnPrivateNet" DWord 0

Set-Reg $lltd "AllowRspndrOnDomain" DWord 0
Set-Reg $lltd "AllowRspndrOnPublicNet" DWord 0
Set-Reg $lltd "EnableRspndr" DWord 0
Set-Reg $lltd "ProhibitRspndrOnPrivateNet" DWord 0

Set-Reg "HKLM:\Software\Policies\Microsoft\Peernet" "Disabled" DWord 1


# WCN HARDENING


$wcn = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars"

Set-Reg $wcn "EnableRegistrars" DWord 0
Set-Reg $wcn "DisableUPnPRegistrar" DWord 1
Set-Reg $wcn "DisableInBand802DOT11Registrar" DWord 1
Set-Reg $wcn "DisableFlashConfigRegistrar" DWord 1
Set-Reg $wcn "DisableWPDRegistrar" DWord 1

Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WCN\UI" "DisableWcnUi" DWord 1


# NETWORK CONNECTIONS


$nc = "HKLM:\Software\Policies\Microsoft\Windows\Network Connections"

Set-Reg $nc "NC_AllowNetBridge_NLA" DWord 0
Set-Reg $nc "NC_ShowSharedAccessUI" DWord 0
Set-Reg $nc "NC_StdDomainUserSetLocation" DWord 1


# UNC HARDENING


$unc = "HKLM:\Software\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths"

Set-Reg $unc "\\*\NETLOGON" String "RequireMutualAuthentication=1, RequireIntegrity=1"

Set-Reg $unc "\\*\SYSVOL" String "RequireMutualAuthentication=1, RequireIntegrity=1"


# OTHER HARDENING


Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" "EnableFontProviders" DWord 0

Set-Reg "HKLM:\Software\Policies\Microsoft\Windows\LanmanWorkstation" "AllowInsecureGuestAuth" DWord 0

Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Network Protection" "EnableNetworkProtection" DWord 1

Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" "UserAuthentication" DWord 1

Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" "NoCloudApplicationNotification" DWord 1

Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Device Metadata" "PreventDeviceMetadataFromNetwork" DWord 1

Set-Reg "HKLM:\Software\Policies\Microsoft\Windows\System" "DontDisplayNetworkSelectionUI" DWord 1

Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Wpad" "WpadOverride" DWord 1

Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" "EnableAutoProxyResultCache" DWord 0


# POWER SETTINGS


$power = "HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\f15576e8-98b7-4186-b944-eafa664402d9"

Set-Reg $power "DCSettingIndex" DWord 0
Set-Reg $power "ACSettingIndex" DWord 0

# DONE


Write-Host "`n[+] Network Hardening COMPLETE" -ForegroundColor Green

Stop-Transcript
