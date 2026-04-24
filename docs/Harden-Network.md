# Harden-Network.ps1 — Implementation Documentation

```
Windows Server 2022 21H2
User Rights Assignment	Access this computer from the network 
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
