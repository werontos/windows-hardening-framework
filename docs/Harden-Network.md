# Harden-Network.ps1 — Implementation Documentation

For User Rights Assignment(accesschk) + Security Options(few) type of settings create a folder that you can access easy(in my case its C:\temp\) to write a scripts there.

❕In case you dont want to apply fully automized script to apply all necessary settings which recommended by:

You can start with:
Exporting current politics
```ps1
secedit /export /cfg "C:\temp\policy.inf" /areas USER_RIGHTS
```
and take a look at the current politics in your comfortable text reader

<img width="1177" height="670" alt="image" src="https://github.com/user-attachments/assets/b41fad0e-56a6-44ab-b20c-f504859d9b95" />

Also you can edit it in your environment if you not familiar with powershell scripts
```
S-1-1-0      = Everyone
S-1-5-9      = ENTERPRISE DOMAIN CONTROLLERS
S-1-5-11     = Authenticated Users
S-1-5-19     = LOCAL SERVICE
S-1-5-20     = NETWORK SERVICE
S-1-5-32-544 = BUILTIN\Administrators
S-1-5-32-545 = BUILTIN\Users
S-1-5-32-546 = BUILTIN\Guests
S-1-5-113    = Local account
S-1-5-114    = Local account and member of Administrators group
```
---
# User Rights Assignment

***User Rights Assignment	Access this computer from the network (DC)***
```
Windows Server 2022 21H2
accesschk:  SeNetworkLogonRight
DefaultValue:      NT AUTHORITY\ENTERPRISE DOMAIN CONTROLLERS;BUILTIN\Pre-Windows 2000 Compatible Access;BUILTIN\Administrators;NT AUTHORITY\Authenticated Users;Everyone
RecommendedValue:  NT AUTHORITY\ENTERPRISE DOMAIN CONTROLLERS;BUILTIN\Administrators;NT AUTHORITY\Authenticated Users
```

```ps1
$inf = @"
[Unicode]
Unicode=yes
[Version]
signature="`$CHICAGO`$"
Revision=1
[Privilege Rights]
SeNetworkLogonRight = *S-1-5-9,*S-1-5-32-544,*S-1-5-11
"@

$inf | Out-File "C:\temp\net.inf" -Encoding Unicode
secedit /configure /db "C:\temp\sec.sdb" /cfg "C:\temp\net.inf" /areas USER_RIGHTS /quiet
```
<img width="775" height="195" alt="image" src="https://github.com/user-attachments/assets/17bb6936-b9b5-443c-872f-ddf02838bf9e" />

---
***User Rights Assignment	Access this computer from the network (Member)***
```
Windows Server 2022 21H2
accesschk:  SeNetworkLogonRight
DefaultValue:      BUILTIN\Pre-Windows 2000 Compatible Access;BUILTIN\Administrators;NT AUTHORITY\Authenticated Users;Everyone
RecommendedValue:  NT AUTHORITY\ENTERPRISE DOMAIN CONTROLLERS;BUILTIN\Administrators;NT AUTHORITY\Authenticated Users
```
⚠️ S-1-5-9 (Enterprise Domain Controllers) — include only if server is domain-joined

```ps1
$inf = @"
[Unicode]
Unicode=yes
[Version]
signature="`$CHICAGO`$"
Revision=1
[Privilege Rights]
SeNetworkLogonRight = *S-1-5-9,*S-1-5-32-544,*S-1-5-11
"@

$inf | Out-File "C:\temp\net.inf" -Encoding Unicode
secedit /configure /db "C:\temp\sec.sdb" /cfg "C:\temp\net.inf" /areas USER_RIGHTS /quiet
```
<img width="773" height="198" alt="image" src="https://github.com/user-attachments/assets/dcbc1bd7-99f1-44d9-8708-7295832b359b" />

---
***User Rights Assignment	Deny access to this computer from the network (Member)****
```
Windows Server 2022 21H2
accesschk:  SeDenyNetworkLogonRight
DefaultValue:      BUILTIN\Guests
RecommendedValue:  BUILTIN\Guests;NT AUTHORITY\Local account and member of Administrators group
```

```ps1
$inf = @"
[Unicode]
Unicode=yes
[Version]
signature="`$CHICAGO`$"
Revision=1
[Privilege Rights]
SeDenyNetworkLogonRight = *S-1-5-32-546,*S-1-5-114
"@

$inf | Out-File "C:\temp\net.inf" -Encoding Unicode
secedit /configure /db "C:\temp\sec.sdb" /cfg "C:\temp\net.inf" /areas USER_RIGHTS /quiet
```
**Before:**
<img width="803" height="37" alt="image" src="https://github.com/user-attachments/assets/e5d8b786-462b-4287-9a03-3a5d8de0a86d" />
**After:**
<img width="814" height="158" alt="image" src="https://github.com/user-attachments/assets/32ae4258-8926-4c26-a48d-8ac20a310728" />

---
# Security Options

***Security Options	Microsoft network client: Digitally sign communications (always)****
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\System\CurrentControlSet\Services\LanmanWorkstation\Parameters
RegistryItem:  RequireSecuritySignature
DefaultValue:      0
RecommendedValue:  1
```

```ps1
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Services\LanmanWorkstation\Parameters" -Name "RequireSecuritySignature" -Type DWord -Value 1
```
<img width="1268" height="592" alt="image" src="https://github.com/user-attachments/assets/fab41c72-bcf7-4b18-bb10-f3865f1ea51a" />

---
***Security Options	Microsoft network server: Digitally sign communications (always)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters
RegistryItem:  RequireSecuritySignature
DefaultValue:      0
RecommendedValue:  1
```

```ps1
New-Item -Path "HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters"
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters" -Name "RequireSecuritySignature" -Type DWord -Value 1
```
<img width="1271" height="597" alt="image" src="https://github.com/user-attachments/assets/35682cd2-c6be-4d88-9c30-ef6da7825e5e" />

---
***Security Options	Microsoft network server: Digitally sign communications (if client agrees)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters
RegistryItem:  EnableSecuritySignature
DefaultValue:      0
RecommendedValue:  1
```

```ps1
New-Item -Path "HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters"
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters" -Name "RequireSecuritySignature" -Type DWord -Value 1
```
<img width="1269" height="597" alt="image" src="https://github.com/user-attachments/assets/dd54b75e-5d29-4105-9cf2-3ccbbb9d70d4" />

---
***Security Options	Microsoft network server: Server SPN target name validation level (Member)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters
RegistryItem:  SMBServerNameHardeningLevel
DefaultValue:      0
RecommendedValue:  1
```

```ps1
New-Item -Path "HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters"
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters" -Name "SMBServerNameHardeningLevel" -Type DWord -Value 1
```
<img width="1268" height="595" alt="image" src="https://github.com/user-attachments/assets/354f6a0f-0fa4-4302-a38b-7ee3ac354241" />

---
***Security Options	Network access: Do not allow anonymous enumeration of SAM accounts and shares (Member)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\System\CurrentControlSet\Control\Lsa
RegistryItem:  RestrictAnonymous
DefaultValue:      0
RecommendedValue:  1
```

```ps1
New-Item -Path "HKLM:\System\CurrentControlSet\Control\Lsa"
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Lsa" -Name "RestrictAnonymous" -Type DWord -Value 1
```
<img width="1269" height="593" alt="image" src="https://github.com/user-attachments/assets/351a77e4-1f3e-410a-b992-4fbe16f02189" />

---
***Security Options	Network access: Do not allow storage of passwords and credentials for network authentication***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\System\CurrentControlSet\Control\Lsa
RegistryItem:  DisableDomainCreds
DefaultValue:      0
RecommendedValue:  1
```

```ps1
New-Item -Path "HKLM:\System\CurrentControlSet\Control\Lsa"
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Lsa" -Name "DisableDomainCreds" -Type DWord -Value 1
```
<img width="1268" height="593" alt="image" src="https://github.com/user-attachments/assets/b1711b0c-d136-4892-94e0-8da1fbf8d569" />

---
***Security Options	Network access: Named Pipes that can be accessed anonymously (DC)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters
RegistryItem:  NullSessionPipes
DefaultValue:      -
RecommendedValue:  netlogon;samr;lsarpc
```

```ps1
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" `
    -Name "NullSessionPipes" `
    -Type MultiString `
    -Value @("netlogon", "samr", "lsarpc")
```
<img width="1270" height="594" alt="image" src="https://github.com/user-attachments/assets/3fbd8b59-a499-4125-a3db-016e2be0553f" />

---
***Security Options	Network access: Restrict anonymous access to Named Pipes and Shares***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters
RegistryItem:  RestrictNullSessAccess
DefaultValue:      1
RecommendedValue:  1
```

```ps1
New-Item -Path "HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters"
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters" -Name "RestrictNullSessAccess" -Type DWord -Value 1
```
<img width="1266" height="594" alt="image" src="https://github.com/user-attachments/assets/66c71112-93d5-4912-9576-e5826d2bcec1" />

---
***Security Options	Network access: Restrict clients allowed to make remote calls to SAM (Member)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\System\CurrentControlSet\Control\Lsa
RegistryItem:  RestrictRemoteSAM
DefaultValue:      -
RecommendedValue:  O:BAG:BAD:(A;;RC;;;BA)
```

```ps1
New-Item -Path "HKLM:\System\CurrentControlSet\Control\Lsa"

Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Lsa" `
    -Name "RestrictRemoteSAM" `
    -Type String `
    -Value "O:BAG:BAD:(A;;RC;;;BA)"
```
<img width="1269" height="590" alt="image" src="https://github.com/user-attachments/assets/67e447f4-7110-449a-9304-5d2b168a5999" />

---
***Security Options	Network security: Allow Local System to use computer identity for NTLM***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\System\CurrentControlSet\Control\Lsa
RegistryItem:  UseMachineId
DefaultValue:      0
RecommendedValue:  1
```

```ps1
New-Item -Path "HKLM:\System\CurrentControlSet\Control\Lsa"
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Lsa" -Name "UseMachineId" -Type DWord -Value 1
```
<img width="1271" height="594" alt="image" src="https://github.com/user-attachments/assets/307281c3-2f14-44bf-a7e3-c296df757c77" />

---
***Security Options	Network security: Allow LocalSystem NULL session fallback***
```
Windows Server 2022 21H2
RegistryPath:  	HKLM:\System\CurrentControlSet\Control\Lsa\MSV1_0
RegistryItem:   allownullsessionfallback
DefaultValue:      0
RecommendedValue:  0
```

```ps1
New-Item -Path "HKLM:\System\CurrentControlSet\Control\Lsa\MSV1_0"
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Lsa\MSV1_0" -Name "allownullsessionfallback" -Type DWord -Value 0
```
<img width="1266" height="595" alt="image" src="https://github.com/user-attachments/assets/914736e4-87fd-41a1-a3d9-db0603b82bb1" />

---
***Security Options	Network security: Allow PKU2U authentication requests to this computer to use online identities***
```
Windows Server 2022 21H2
RegistryPath:  	HKLM:\System\CurrentControlSet\Control\Lsa\pku2u
RegistryItem:   AllowOnlineID
DefaultValue:      -
RecommendedValue:  0
```

```ps1
New-Item -Path "HKLM:\System\CurrentControlSet\Control\Lsa\pku2u" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Lsa\pku2u" -Name "AllowOnlineID" -Type DWord -Value 0
```
<img width="1269" height="595" alt="image" src="https://github.com/user-attachments/assets/931dc07c-0c60-4804-83b8-be995967b63f" />

---
***Security Options	Network security: Configure encryption types allowed for Kerberos***
```
Windows Server 2022 21H2
RegistryPath:  	HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Kerberos\Parameters
RegistryItem:   SupportedEncryptionTypes
DefaultValue:      2147483644
RecommendedValue:  2147483640
```

```ps1
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Kerberos\Parameters" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Kerberos\Parameters" -Name "SupportedEncryptionTypes" -Type DWord -Value 2147483640
```
<img width="1269" height="593" alt="image" src="https://github.com/user-attachments/assets/3350bdf4-bbec-43eb-b48f-69a9c493710c" />

---
***Security Options	Network security: Force logoff when logon hours expires***
```
Windows Server 2022 21H2
secedit:  ForceLogoffWhenHourExpire
Method:   System Access\ForceLogoffWhenHourExpire
DefaultValue:      0
RecommendedValue:  1
```

```ps1
$inf = @"
[Unicode]
Unicode=yes
[Version]
signature="`$CHICAGO`$"
Revision=1
[System Access]
ForceLogoffWhenHourExpire = 1
"@

$inf | Out-File "C:\temp\logoff.inf" -Encoding Unicode
secedit /configure /db "C:\temp\sec.sdb" /cfg "C:\temp\logoff.inf" /areas SECURITYPOLICY /quiet
```
**Before:**
<img width="830" height="176" alt="image" src="https://github.com/user-attachments/assets/95a7cc3b-1b33-47fb-b39a-84557a79654d" />
**After:**
<img width="830" height="181" alt="image" src="https://github.com/user-attachments/assets/2400e829-e822-471c-b53c-89c21ca27aca" />

---
***Security Options	Network security: LAN Manager authentication level***
```
Windows Server 2022 21H2
RegistryPath:  	HKLM:\System\CurrentControlSet\Control\Lsa
RegistryItem:   LmCompatibilityLevel
DefaultValue:      3
RecommendedValue:  5
```

```ps1
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Lsa" -Name "LmCompatibilityLevel" -Type DWord -Value 5
```
<img width="1263" height="592" alt="image" src="https://github.com/user-attachments/assets/619544fc-ba76-478a-933a-b8193b8f0e8a" />

---
***Security Options Network security: Minimum session security for NTLM SSP based clients***
```
Windows Server 2022 21H2
RegistryPath:  	HKLM:\System\CurrentControlSet\Control\Lsa\MSV1_0
RegistryItem:   NTLMMinClientSec
DefaultValue:      536870912
RecommendedValue:  537395200
```

```ps1
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Lsa\MSV1_0" -Name "NTLMMinClientSec" -Type DWord -Value 537395200
```
<img width="1269" height="592" alt="image" src="https://github.com/user-attachments/assets/6985635f-8369-4b6b-9ab9-5a84697af076" />

---
***Security Options	Network security: Minimum session security for NTLM SSP based (including secure RPC) servers***
```
Windows Server 2022 21H2
RegistryPath:  	HKLM:\System\CurrentControlSet\Control\Lsa\MSV1_0
RegistryItem:   NTLMMinServerSec
DefaultValue:      536870912
RecommendedValue:  537395200
```

```ps1
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Lsa\MSV1_0" -Name "NTLMMinServerSec" -Type DWord -Value 537395200
```
<img width="1269" height="598" alt="image" src="https://github.com/user-attachments/assets/2010aec5-b3e9-4b2d-92ff-d1bf3651fc21" />

---
***MS Security Guide Apply UAC restrictions to local accounts on network logons (Member)***
```
Windows Server 2022 21H2
RegistryPath:  	HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System
RegistryItem:   LocalAccountTokenFilterPolicy
DefaultValue:      -
RecommendedValue:  0
```

```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "LocalAccountTokenFilterPolicy" -Type DWord -Value 0
```
<img width="1270" height="594" alt="image" src="https://github.com/user-attachments/assets/7feaffb1-a92e-49b0-a517-fc8f0ce80cce" />

---
***Administrative Templates: Network	DNS Client: Configure DNS over HTTPS (DoH) name resolution***
```
Windows Server 2022 21H2
RegistryPath:  	HKLM:\Software\Policies\Microsoft\Windows NT\DNSClient
RegistryItem:   DoHPolicy
DefaultValue:      -
RecommendedValue:  2
```

```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows NT\DNSClient" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows NT\DNSClient" -Name "DoHPolicy" -Type DWord -Value 2
```
<img width="1271" height="598" alt="image" src="https://github.com/user-attachments/assets/2c854f97-c39f-44e1-8a13-ece31d19ad31" />

---
***Administrative Templates: Network DNS Client: Turn off multicast name resolution (LLMNR)***
```
Windows Server 2022 21H2
RegistryPath:  	HKLM:\Software\Policies\Microsoft\Windows NT\DNSClient
RegistryItem:   EnableMulticast
DefaultValue:      1
RecommendedValue:  0
```

```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows NT\DNSClient" -Name "EnableMulticast" -Type DWord -Value 0
```
<img width="1271" height="594" alt="image" src="https://github.com/user-attachments/assets/17d948f3-7ce9-4c93-ae5a-fd310647614b" />

---
***Administrative Templates: Network Fonts: Enable Font Providers***
```
Windows Server 2022 21H2
RegistryPath:  	HKLM:\SOFTWARE\Policies\Microsoft\Windows\System
RegistryItem:   EnableFontProviders
DefaultValue:      1
RecommendedValue:  0
```

```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "EnableFontProviders" -Type DWord -Value 0
```
<img width="1266" height="595" alt="image" src="https://github.com/user-attachments/assets/3947a09c-e0e1-4f60-a420-836aeaa42ab6" />

---
***Administrative Templates: Network Lanman Workstation: Enable insecure guest logons***
```
Windows Server 2022 21H2
RegistryPath:  	HKLM:\Software\Policies\Microsoft\Windows\LanmanWorkstation
RegistryItem:   AllowInsecureGuestAuth
DefaultValue:      1
RecommendedValue:  0
```

```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\LanmanWorkstation" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\LanmanWorkstation" -Name "AllowInsecureGuestAuth" -Type DWord -Value 0
```
<img width="1269" height="595" alt="image" src="https://github.com/user-attachments/assets/6098fbeb-04b5-43c8-9476-3c21c7c82b4e" />

---
***Administrative Templates: Network Link-Layer Topology Discovery: Turn on Mapper I/O (LLTDIO) driver (AllowLLTDIOOndomain)***
```
Windows Server 2022 21H2
RegistryPath:  	HKLM:\Software\Policies\Microsoft\Windows\LLTD
RegistryItem:   AllowLLTDIOOndomain
DefaultValue:      0
RecommendedValue:  0
```

```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\LLTD" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\LLTD" -Name "AllowLLTDIOOndomain" -Type DWord -Value 0
```
<img width="1270" height="591" alt="image" src="https://github.com/user-attachments/assets/c1fcd7be-b398-4d27-8b66-1462692a1aae" />

---
***Administrative Templates: Network	Link-Layer Topology Discovery: Turn on Mapper I/O (LLTDIO) driver (AllowLLTDIOOnPublicNet)***
```
Windows Server 2022 21H2
RegistryPath:  	HKLM:\Software\Policies\Microsoft\Windows\LLTD
RegistryItem:   AllowLLTDIOOnPublicNet
DefaultValue:      0
RecommendedValue:  0
```

```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\LLTD" -Name "AllowLLTDIOOnPublicNet" -Type DWord -Value 0
```
<img width="1267" height="595" alt="image" src="https://github.com/user-attachments/assets/fa310d68-0dc0-43d0-9cd2-1264a7531fb4" />

---
***Administrative Templates: Network	Link-Layer Topology Discovery: Turn on Mapper I/O (LLTDIO) driver (EnableLLTDIO)***
```
Windows Server 2022 21H2
RegistryPath:  	HKLM:\Software\Policies\Microsoft\Windows\LLTD
RegistryItem:   EnableLLTDIO
DefaultValue:      0
RecommendedValue:  0
```

```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\LLTD" -Name "EnableLLTDIO" -Type DWord -Value 0
```
<img width="1269" height="595" alt="image" src="https://github.com/user-attachments/assets/898760e6-52be-4324-9790-13dc259ae622" />

---
***Administrative Templates: Network	Link-Layer Topology Discovery: Turn on Mapper I/O (LLTDIO) driver (ProhibitLLTDIOOnPrivateNet)***
```
Windows Server 2022 21H2
RegistryPath:  	HKLM:\Software\Policies\Microsoft\Windows\LLTD
RegistryItem:   ProhibitLLTDIOOnPrivateNet
DefaultValue:      0
RecommendedValue:  0
```

```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\LLTD" -Name "ProhibitLLTDIOOnPrivateNet" -Type DWord -Value 0
```
<img width="1266" height="594" alt="image" src="https://github.com/user-attachments/assets/34178bc0-02cc-439a-9580-de77cf12dfe1" />

---
***Administrative Templates: Network	Turn on Responder (RSPNDR) driver (AllowRspndrOnDomain)***
```
Windows Server 2022 21H2
RegistryPath:  	HKLM:\SOFTWARE\Policies\Microsoft\Windows\LLTD
RegistryItem:   AllowRspndrOnDomain
DefaultValue:      0
RecommendedValue:  0
```

```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\LLTD" -Name "AllowRspndrOnDomain" -Type DWord -Value 0
```
<img width="1269" height="595" alt="image" src="https://github.com/user-attachments/assets/27f7f002-0fd9-4b0e-9144-326dfa387937" />

---
***Administrative Templates: Network	Turn on Responder (RSPNDR) driver (AllowRspndrOnPublicNet)***
```
Windows Server 2022 21H2
RegistryPath:  	HKLM:\SOFTWARE\Policies\Microsoft\Windows\LLTD
RegistryItem:   AllowRspndrOnPublicNet
DefaultValue:      0
RecommendedValue:  0
```

```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\LLTD" -Name "AllowRspndrOnPublicNet" -Type DWord -Value 0
```
<img width="1264" height="594" alt="image" src="https://github.com/user-attachments/assets/4694f268-4c85-4f42-93b8-6faef1596b26" />

---
***Administrative Templates: Network	Turn on Responder (RSPNDR) driver (EnableRspndr)***
```
Windows Server 2022 21H2
RegistryPath:  	HKLM:\SOFTWARE\Policies\Microsoft\Windows\LLTD
RegistryItem:   EnableRspndr
DefaultValue:      0
RecommendedValue:  0
```

```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\LLTD" -Name "EnableRspndr" -Type DWord -Value 0
```
<img width="1269" height="591" alt="image" src="https://github.com/user-attachments/assets/be08a1d1-d26f-4fc6-b5c0-79dfe45a20e8" />

---
***Administrative Templates: Network Turn on Responder (RSPNDR) driver (ProhibitRspndrOnPrivateNet)***
```
Windows Server 2022 21H2
RegistryPath:  	HKLM:\SOFTWARE\Policies\Microsoft\Windows\LLTD
RegistryItem:   ProhibitRspndrOnPrivateNet
DefaultValue:      0
RecommendedValue:  0
```

```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\LLTD" -Name "ProhibitRspndrOnPrivateNet" -Type DWord -Value 0
```
<img width="1267" height="592" alt="image" src="https://github.com/user-attachments/assets/e154f4f5-7de6-4510-9ae7-269a13f80930" />

---
***Administrative Templates: Network Turn off Microsoft Peer-to-Peer Networking Services***
```
Windows Server 2022 21H2
RegistryPath:  	HKLM:\Software\policies\Microsoft\Peernet
RegistryItem:   Disabled
DefaultValue:      0
RecommendedValue:  1
```

```ps1
New-Item -Path "HKLM:\Software\policies\Microsoft\Peernet" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\policies\Microsoft\Peernet" -Name "Disabled" -Type DWord -Value 1
```
<img width="1267" height="591" alt="image" src="https://github.com/user-attachments/assets/1ce20751-3956-432c-ba3b-bd90b975b15b" />

---
***Administrative Templates: Network Network Connections: Prohibit installation and configuration of Network Bridge on your DNS domain network***
```
Windows Server 2022 21H2
RegistryPath:  	HKLM:\Software\Policies\Microsoft\Windows\Network Connections
RegistryItem:   NC_AllowNetBridge_NLA
DefaultValue:      0
RecommendedValue:  0
```

```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\Network Connections" -Name "NC_AllowNetBridge_NLA" -Type DWord -Value 0
```
<img width="1267" height="593" alt="image" src="https://github.com/user-attachments/assets/f0e5c0e6-eb5b-46d9-bb0b-05c16c00d407" />

---
***Administrative Templates: Network Network Connections: Prohibit use of Internet Connection Sharing on your DNS domain network***
```
Windows Server 2022 21H2
RegistryPath:  	HKLM:\Software\Policies\Microsoft\Windows\Network Connections
RegistryItem:   NC_ShowSharedAccessUI
DefaultValue:      1
RecommendedValue:  0
```

```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\Network Connections" -Name "NC_ShowSharedAccessUI" -Type DWord -Value 0
```
<img width="1270" height="597" alt="image" src="https://github.com/user-attachments/assets/457c8206-c04f-498f-9ea3-44308528ce24" />

---
***Administrative Templates: Network	Network Connections: Require domain users to elevate when setting a network's location***
```
Windows Server 2022 21H2
RegistryPath:  	HKLM:\Software\Policies\Microsoft\Windows\Network Connections
RegistryItem:   NC_StdDomainUserSetLocation
DefaultValue:      0
RecommendedValue:  1
```

```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\Network Connections" -Name "NC_StdDomainUserSetLocation" -Type DWord -Value 1
```
<img width="1267" height="595" alt="image" src="https://github.com/user-attachments/assets/c42e1782-79bf-4dab-bb9e-5e16b44c5c48" />

---
***Administrative Templates: Network Network Provider: Hardened UNC Paths (NETLOGON)***
```
Windows Server 2022 21H2
RegistryPath:  	HKLM:\Software\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths
RegistryItem:   \\*\NETLOGON
DefaultValue:      -
RecommendedValue:  RequireMutualAuthentication=1, RequireIntegrity=1
```

```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths" `
    -Name "\\*\NETLOGON" `
    -Type String `
    -Value "RequireMutualAuthentication=1, RequireIntegrity=1"
```
<img width="1264" height="590" alt="image" src="https://github.com/user-attachments/assets/2d1e96c6-80ad-4025-90aa-ee89942bb404" />

---
***Administrative Templates: Network	Network Provider: Hardened UNC Paths (SYSVOL)***
```
Windows Server 2022 21H2
RegistryPath:  	HKLM:\Software\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths
RegistryItem:   \\*\SYSVOL
DefaultValue:      -
RecommendedValue:  RequireMutualAuthentication=1, RequireIntegrity=1
```

```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths" `
    -Name "\\*\SYSVOL" `
    -Type String `
    -Value "RequireMutualAuthentication=1, RequireIntegrity=1"
```
<img width="1270" height="597" alt="image" src="https://github.com/user-attachments/assets/961054b4-6a50-4bf6-bbdd-de8bbfb497a4" />

---
***Administrative Templates: Network Disable IPv6***
```
Windows Server 2022 21H2
RegistryPath:  	HKLM:\SYSTEM\CurrentControlSet\Services\TCPIP6\Parameters
RegistryItem:   DisabledComponents
DefaultValue:      0
RecommendedValue:  255
```

```ps1
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\TCPIP6\Parameters" -Name "DisabledComponents" -Type DWord -Value 255
```
<img width="1267" height="595" alt="image" src="https://github.com/user-attachments/assets/5acdd611-f38e-405b-9b08-8c0db8908e89" />

---
***Administrative Templates: Network	Windows Connect Now: Configuration of wireless settings using Windows Connect Now (EnableRegistrars)***
```
Windows Server 2022 21H2
RegistryPath:  	HKLM:\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars
RegistryItem:   EnableRegistrars
DefaultValue:      1
RecommendedValue:  0
```

```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars" -Name "EnableRegistrars" -Type DWord -Value 0
```
<img width="1267" height="600" alt="image" src="https://github.com/user-attachments/assets/685569df-6e49-4de6-9236-ce752df456dd" />

---
***Administrative Templates: Network	Windows Connect Now: Configuration of wireless settings using Windows Connect Now (DisableUPnPRegistrar)***
```
Windows Server 2022 21H2
RegistryPath:  	HKLM:\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars
RegistryItem:   DisableUPnPRegistrar
DefaultValue:      1
RecommendedValue:  0
```

```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars" -Name "DisableUPnPRegistrar" -Type DWord -Value 0
```
<img width="1263" height="601" alt="image" src="https://github.com/user-attachments/assets/4bd8511b-fbff-4bed-92d9-4478be20d62c" />

---
***Administrative Templates: Network	Windows Connect Now: Configuration of wireless settings using Windows Connect Now (DisableInBand802DOT11Registrar)***
```
Windows Server 2022 21H2
RegistryPath:  	HKLM:\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars
RegistryItem:   DisableInBand802DOT11Registrar
DefaultValue:      1
RecommendedValue:  0
```

```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars" -Name "DisableInBand802DOT11Registrar" -Type DWord -Value 0
```
<img width="1267" height="595" alt="image" src="https://github.com/user-attachments/assets/9f1b317a-4874-4b60-b5b8-53ede8af4859" />

---
***Administrative Templates: Network	Windows Connect Now: Configuration of wireless settings using Windows Connect Now (DisableFlashConfigRegistrar)***
```
Windows Server 2022 21H2
RegistryPath:  	HKLM:\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars
RegistryItem:   DisableFlashConfigRegistrar
DefaultValue:      1
RecommendedValue:  0
```

```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars" -Name "DisableFlashConfigRegistrar" -Type DWord -Value 0
```
<img width="1265" height="599" alt="image" src="https://github.com/user-attachments/assets/7f22686c-d748-4082-83e3-158d002f8d34" />

---
***Administrative Templates: Network	Windows Connect Now: Configuration of wireless settings using Windows Connect Now (DisableWPDRegistrar)***
```
Windows Server 2022 21H2
RegistryPath:  	HKLM:\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars
RegistryItem:   DisableWPDRegistrar
DefaultValue:      1
RecommendedValue:  0
```

```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars" -Name "DisableWPDRegistrar" -Type DWord -Value 0
```
<img width="1263" height="591" alt="image" src="https://github.com/user-attachments/assets/bc06c524-4f87-4dd8-87ff-d48d88843615" />

---
***Administrative Templates: Network	Windows Connect Now: Prohibit access of the Windows Connect Now wizards***
```
Windows Server 2022 21H2
RegistryPath:  	HKLM:\SOFTWARE\Policies\Microsoft\Windows\WCN\UI
RegistryItem:   DisableWcnUi
DefaultValue:      0
RecommendedValue:  1
```

```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WCN\UI" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WCN\UI" -Name "DisableWcnUi" -Type DWord -Value 1
```
<img width="1266" height="594" alt="image" src="https://github.com/user-attachments/assets/0ca43659-3864-4bfe-92d2-4e07434ea118" />

---
***Administrative Templates: Network	Windows Connection Manager: Minimize the number of simultaneous connections to the Internet or a Windows Domain***
```
Windows Server 2022 21H2
RegistryPath:  	HKLM:\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\GroupPolicy
RegistryItem:   fMinimizeConnections
DefaultValue:      1
RecommendedValue:  3
```

```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\GroupPolicy" -Name "fMinimizeConnections" -Type DWord -Value 3
```
<img width="1263" height="593" alt="image" src="https://github.com/user-attachments/assets/217f707e-acd6-4e91-a1d7-72fecec03611" />

---
***Windows Connection Manager: Prohibit connection to non-domain networks when connected to domain authenticated network***
```
Windows Server 2022 21H2
RegistryPath:  	HKLM:\Software\Policies\Microsoft\Windows\WcmSvc\GroupPolicy
RegistryItem:   fBlockNonDomain
DefaultValue:      0
RecommendedValue:  1
```

```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\WcmSvc\GroupPolicy" -Name "fBlockNonDomain" -Type DWord -Value 1
```
<img width="1266" height="594" alt="image" src="https://github.com/user-attachments/assets/60887340-a7e1-43f5-b90a-e05e130c441c" />

---
***Administrative Templates: Start Menu and Taskbar	Notifications: Turn off notifications network usage***
```
Windows Server 2022 21H2
RegistryPath:  	HKLM:\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications
RegistryItem:   NoCloudApplicationNotification
DefaultValue:      0
RecommendedValue:  1
```

```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" -Name "NoCloudApplicationNotification" -Type DWord -Value 1
```
<img width="1265" height="596" alt="image" src="https://github.com/user-attachments/assets/a15e9494-cfe1-4251-a953-bbf32db04190" />

---
***Device Installation: Device Installation Restrictions: Prevent device metadata retrieval from the Internet***
```
Windows Server 2022 21H2
RegistryPath:  	HKLM:\SOFTWARE\Policies\Microsoft\Windows\Device Metadata
RegistryItem:   PreventDeviceMetadataFromNetwork
DefaultValue:      -
RecommendedValue:  1
```

```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Device Metadata" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Device Metadata" -Name "PreventDeviceMetadataFromNetwork" -Type DWord -Value 1
```
<img width="1265" height="586" alt="image" src="https://github.com/user-attachments/assets/77b5f903-a6da-4574-a711-7fa081df2701" />

---
***Administrative Templates: System	Logon: Do not display network selection UI***
```
Windows Server 2022 21H2
RegistryPath:  	HKLM:\Software\Policies\Microsoft\Windows\System
RegistryItem:   DontDisplayNetworkSelectionUI
DefaultValue:      0
RecommendedValue:  1
```

```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\System" -Name "DontDisplayNetworkSelectionUI" -Type DWord -Value 1
```
<img width="1268" height="592" alt="image" src="https://github.com/user-attachments/assets/593f3a78-8860-481d-a8e0-4b03be50b7c6" />

---
***Administrative Templates: System	Sleep Settings: Allow network connectivity during connected-standby (on battery)***
```
Windows Server 2022 21H2
RegistryPath:  	HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\f15576e8-98b7-4186-b944-eafa664402d9
RegistryItem:   DCSettingIndex
DefaultValue:      1
RecommendedValue:  0
```

```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\f15576e8-98b7-4186-b944-eafa664402d9" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\f15576e8-98b7-4186-b944-eafa664402d9" -Name "DCSettingIndex" -Type DWord -Value 0
```
<img width="1267" height="592" alt="image" src="https://github.com/user-attachments/assets/978c30df-4b47-467d-9165-1c89f6630dee" />

---
***Administrative Templates: System	Sleep Settings: Allow network connectivity during connected-standby (plugged in)***
```
Windows Server 2022 21H2
RegistryPath:  	HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\f15576e8-98b7-4186-b944-eafa664402d9
RegistryItem:   ACSettingIndex
DefaultValue:      1
RecommendedValue:  0
```

```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\f15576e8-98b7-4186-b944-eafa664402d9" -Name "ACSettingIndex" -Type DWord -Value 0
```
<img width="1268" height="598" alt="image" src="https://github.com/user-attachments/assets/10049abe-a924-4c01-bf94-cc4390c6098f" />


---
***Microsoft Defender Exploit Guard	Network Protection: Prevent users and apps from accessing dangerous websites***
```
Windows Server 2022 21H2
RegistryPath:  	HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Network Protection
RegistryItem:   EnableNetworkProtection
DefaultValue:      -
RecommendedValue:  1
```

```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Network Protection" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Network Protection" -Name "EnableNetworkProtection" -Type DWord -Value 1
```
<img width="1264" height="590" alt="image" src="https://github.com/user-attachments/assets/9aa41d85-2d3c-4b27-83da-51a0cda69b00" />

---
***Administrative Templates: Windows Components	Remote Desktop Session Host: Security: Require user authentication for remote connections by using Network Level Authentication***
```
Windows Server 2022 21H2
RegistryPath:  	HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services
RegistryItem:   UserAuthentication
DefaultValue:      0
RecommendedValue:  1
```

```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name "UserAuthentication" -Type DWord -Value 1
```
<img width="1268" height="592" alt="image" src="https://github.com/user-attachments/assets/69f2b738-d6a2-4803-afe3-bb0370427bf9" />
