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
New-Item -Path "HKLM:\System\CurrentControlSet\Services\LanmanWorkstation\Parameters"
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
New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" -Force | Out-Null

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
***	Security Options	Network security: Minimum session security for NTLM SSP based clients***
```
Windows Server 2022 21H2
RegistryPath:  	HKLM:\System\CurrentControlSet\Control\Lsa\MSV1_0
RegistryItem:   LmCompatibilityLevel
DefaultValue:      536870912
RecommendedValue:  537395200
```

```ps1
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Lsa\MSV1_0" -Name "NTLMMinClientSec" -Type DWord -Value 537395200
```
<img width="1269" height="592" alt="image" src="https://github.com/user-attachments/assets/6985635f-8369-4b6b-9ab9-5a84697af076" />

---
***	Security Options	Network security: Minimum session security for NTLM SSP based clients***
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
