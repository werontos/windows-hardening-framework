$tempPath = "C:\temp"
if (!(Test-Path $tempPath)) {
    New-Item -Path $tempPath -ItemType Directory -Force | Out-Null
}

function Ensure-RegistryPath {
    param ([string]$path)

    if (!(Test-Path $path)) {
        New-Item -Path $path -Force | Out-Null
        Write-Host "[CREATED] $path"
    }
}

function Set-Reg {
    param (
        [string]$path,
        [string]$name,
        [string]$type,
        $value
    )

    Ensure-RegistryPath $path

    try {
        switch ($type) {
            "DWord" {
                Set-ItemProperty -Path $path -Name $name -Type DWord -Value $value
            }
            "String" {
                Set-ItemProperty -Path $path -Name $name -Type String -Value $value
            }
            "MultiString" {
                Set-ItemProperty -Path $path -Name $name -Value $value
            }
        }

        Write-Host "[OK] $path -> $name = $value"
    }
    catch {
        Write-Host "[ERROR] $path -> $name FAILED: $_"
    }
}

# USER RIGHTS ASSIGNMENT

$inf = @"
[Unicode]
Unicode=yes
[Version]
signature="`$CHICAGO`$"
Revision=1
[Privilege Rights]
SeNetworkLogonRight = *S-1-5-9,*S-1-5-32-544,*S-1-5-11
"@

$inf | Out-File "$tempPath\net.inf" -Encoding Unicode
secedit /configure /db "$tempPath\sec.sdb" /cfg "$tempPath\net.inf" /areas USER_RIGHTS /quiet

$inf = @"
[Unicode]
Unicode=yes
[Version]
signature="`$CHICAGO`$"
Revision=1
[Privilege Rights]
SeDenyNetworkLogonRight = *S-1-5-32-546,*S-1-5-114
"@

$inf | Out-File "$tempPath\net.inf" -Encoding Unicode
secedit /configure /db "$tempPath\sec.sdb" /cfg "$tempPath\net.inf" /areas USER_RIGHTS /quiet

$inf = @"
[Unicode]
Unicode=yes
[Version]
signature="`$CHICAGO`$"
Revision=1
[System Access]
ForceLogoffWhenHourExpire = 1
"@

$inf | Out-File "$tempPath\logoff.inf" -Encoding Unicode
secedit /configure /db "$tempPath\sec.sdb" /cfg "$tempPath\logoff.inf" /areas SECURITYPOLICY /quiet

# REGISTRY

Set-Reg "HKLM:\System\CurrentControlSet\Services\LanmanWorkstation\Parameters" "RequireSecuritySignature" DWord 1
Set-Reg "HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters" "RequireSecuritySignature" DWord 1
Set-Reg "HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters" "EnableSecuritySignature" DWord 1
Set-Reg "HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters" "SMBServerNameHardeningLevel" DWord 1
Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" "NullSessionPipes" MultiString @("netlogon","samr","lsarpc")
Set-Reg "HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters" "RestrictNullSessAccess" DWord 1
Set-Reg "HKLM:\System\CurrentControlSet\Control\Lsa" "RestrictAnonymous" DWord 1
Set-Reg "HKLM:\System\CurrentControlSet\Control\Lsa" "DisableDomainCreds" DWord 1
Set-Reg "HKLM:\System\CurrentControlSet\Control\Lsa" "RestrictRemoteSAM" String "O:BAG:BAD:(A;;RC;;;BA)"
Set-Reg "HKLM:\System\CurrentControlSet\Control\Lsa" "UseMachineId" DWord 1
Set-Reg "HKLM:\System\CurrentControlSet\Control\Lsa" "LmCompatibilityLevel" DWord 5
Set-Reg "HKLM:\System\CurrentControlSet\Control\Lsa\MSV1_0" "allownullsessionfallback" DWord 0
Set-Reg "HKLM:\System\CurrentControlSet\Control\Lsa\MSV1_0" "NTLMMinClientSec" DWord 537395200
Set-Reg "HKLM:\System\CurrentControlSet\Control\Lsa\MSV1_0" "NTLMMinServerSec" DWord 537395200
Set-Reg "HKLM:\System\CurrentControlSet\Control\Lsa\pku2u" "AllowOnlineID" DWord 0
Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Kerberos\Parameters" "SupportedEncryptionTypes" DWord 2147483640
Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" "LocalAccountTokenFilterPolicy" DWord 0
Set-Reg "HKLM:\Software\Policies\Microsoft\Windows NT\DNSClient" "DoHPolicy" DWord 2
Set-Reg "HKLM:\Software\Policies\Microsoft\Windows NT\DNSClient" "EnableMulticast" DWord 0
Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" "EnableFontProviders" DWord 0
Set-Reg "HKLM:\Software\Policies\Microsoft\Windows\LanmanWorkstation" "AllowInsecureGuestAuth" DWord 0
$lltd = "HKLM:\Software\Policies\Microsoft\Windows\LLTD"
Set-Reg $lltd "AllowLLTDIOOndomain" DWord 0
Set-Reg $lltd "AllowLLTDIOOnPublicNet" DWord 0
Set-Reg $lltd "EnableLLTDIO" DWord 0
Set-Reg $lltd "ProhibitLLTDIOOnPrivateNet" DWord 0
Set-Reg $lltd "AllowRspndrOnDomain" DWord 0
Set-Reg $lltd "AllowRspndrOnPublicNet" DWord 0
Set-Reg $lltd "EnableRspndr" DWord 0
Set-Reg $lltd "ProhibitRspndrOnPrivateNet" DWord 0
Set-Reg "HKLM:\Software\policies\Microsoft\Peernet" "Disabled" DWord 1
$nc = "HKLM:\Software\Policies\Microsoft\Windows\Network Connections"
Set-Reg $nc "NC_AllowNetBridge_NLA" DWord 0
Set-Reg $nc "NC_ShowSharedAccessUI" DWord 0
Set-Reg $nc "NC_StdDomainUserSetLocation" DWord 1
$unc = "HKLM:\Software\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths"
Set-Reg $unc "\\*\NETLOGON" String "RequireMutualAuthentication=1, RequireIntegrity=1"
Set-Reg $unc "\\*\SYSVOL" String "RequireMutualAuthentication=1, RequireIntegrity=1"
Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Services\TCPIP6\Parameters" "DisabledComponents" DWord 255
$wcn = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars"
Set-Reg $wcn "EnableRegistrars" DWord 0
Set-Reg $wcn "DisableUPnPRegistrar" DWord 0
Set-Reg $wcn "DisableInBand802DOT11Registrar" DWord 0
Set-Reg $wcn "DisableFlashConfigRegistrar" DWord 0
Set-Reg $wcn "DisableWPDRegistrar" DWord 0
Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WCN\UI" "DisableWcnUi" DWord 1
$wcm = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\GroupPolicy"
Set-Reg $wcm "fMinimizeConnections" DWord 3
Set-Reg $wcm "fBlockNonDomain" DWord 1
Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" "NoCloudApplicationNotification" DWord 1
Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Device Metadata" "PreventDeviceMetadataFromNetwork" DWord 1
Set-Reg "HKLM:\Software\Policies\Microsoft\Windows\System" "DontDisplayNetworkSelectionUI" DWord 1
$power = "HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\f15576e8-98b7-4186-b944-eafa664402d9"
Set-Reg $power "DCSettingIndex" DWord 0
Set-Reg $power "ACSettingIndex" DWord 0
Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Network Protection" "EnableNetworkProtection" DWord 1
Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" "UserAuthentication" DWord 1
Write-Host "`nNetwork-Hardening DONE" -ForegroundColor Green
