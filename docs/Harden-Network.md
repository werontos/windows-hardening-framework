# Harden-Network.ps1 — Implementation Documentation

For User Rights Assignment(accesschk) + Security Options type of settings create a folder that you can access easy(in my case its C:\temp\) to write a scripts there.

❕In case you dont want to apply fully automized script to apply all necessary settings whic recommended by:

You can start with:
Exporting current politics
```ps1
secedit /export /cfg "C:\temp\policy.inf" /areas USER_RIGHTS
```
and take a look at the current politics in your comfortable text reader

<img width="1177" height="670" alt="image" src="https://github.com/user-attachments/assets/b41fad0e-56a6-44ab-b20c-f504859d9b95" />

Also you can edit it in your environment if you not familiar with powershell scripts
```
S-1-1-0          = Everyone
S-1-5-32-544     = BUILTIN\Administrators
S-1-5-32-545     = BUILTIN\Users
S-1-5-32-546     = BUILTIN\Guests
S-1-5-19         = LOCAL SERVICE
S-1-5-20         = NETWORK SERVICE
S-1-5-6          = SERVICE
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
