# windows-hardening-framework

Harden-Logging.ps1
FireWall and Powershell

```
File ......machine
Windows Firewall Log size limit (Domain Profile, Policy) 
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging
RegistryItem:  LogFileSize
DefaultValue:      4096
RecommendedValue:  16384
```

```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging" -Name "LogFileSize" -Type DWord -Value 16384
```

<img width="1185" height="686" alt="image" src="https://github.com/user-attachments/assets/78d0610e-312a-4f0a-b3ee-825e2b0ef760" />

```
File ......machine
Windows Firewall Log size limit (Domain Profile, Policy) 
RegistryPath:  HKLM:\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile\Logging
RegistryItem:      LogFileSize
DefaultValue:      4096
RecommendedValue:  16384
```

```ps1
New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile\Logging" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile\Logging" -Name "LogFileSize" -Type DWord -Value 16384
```

<img width="1186" height="689" alt="image" src="https://github.com/user-attachments/assets/03f2cfb8-3ebd-4b7a-8c1e-80b821b56ac7" />

```
File ......machine
Windows Firewall    Log dropped packets (Domain Profile, Policy)
RegistryPath:      HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging
RegistryItem:      LogDroppedPackets
DefaultValue:      0
RecommendedValue:  1
```

```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging" -Name "LogDroppedPackets" -Type DWord -Value 1
```

<img width="1191" height="690" alt="image" src="https://github.com/user-attachments/assets/345f37fa-2015-411d-a90a-cbfab4ab847b" />

```
File ......machine
Windows Firewall    Log dropped packets (Domain Profile)
RegistryPath:      HKLM:\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile\Logging
RegistryItem:      LogDroppedPackets
DefaultValue:      0
RecommendedValue:  1
```

```ps1
New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile\Logging" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile\Logging" -Name "LogDroppedPackets" -Type DWord -Value 1
```

<img width="1186" height="686" alt="image" src="https://github.com/user-attachments/assets/5f001b35-2189-496d-bccc-1f4e2d149145" />

```
File ......machine
Windows Firewall    Log successful connections (Domain Profile, Policy)
RegistryPath:      HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging
RegistryItem:      LogSuccessfulConnections
DefaultValue:      0
RecommendedValue:  1
```

```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging" -Name "LogSuccessfulConnections" -Type DWord -Value 1
```

<img width="1190" height="690" alt="image" src="https://github.com/user-attachments/assets/43a44e4d-b033-49ee-a430-c505ce09bca7" />

```
File ......machine
Windows Firewall    Log successful connections (Domain Profile)
RegistryPath:      HKLM:\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile\Logging
RegistryItem:      LogSuccessfulConnections
DefaultValue:      0
RecommendedValue:  1
```

```ps1
New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile\Logging" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile\Logging" -Name "LogSuccessfulConnections" -Type DWord -Value 1
```

<img width="1190" height="687" alt="image" src="https://github.com/user-attachments/assets/f168a241-644e-4a1f-9a97-d254d4561059" />

```
File ......machine
Windows Firewall    Log size limit (Private Profile, Policy)
RegistryPath:      HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging
RegistryItem:      LogFileSize
DefaultValue:      4096
RecommendedValue:  16384
```

```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging" -Name "LogFileSize" -Type DWord -Value 16384
```

<img width="1188" height="691" alt="image" src="https://github.com/user-attachments/assets/36db0166-93b4-46d6-9eb3-9d87f00cceac" />

```
File ......machine
Windows Firewall    Log size limit (Private Profile)
RegistryPath:      HKLM:\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\Logging
RegistryItem:      LogFileSize
DefaultValue:      4096
RecommendedValue:  16384
```

```ps1
New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\Logging" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\Logging" -Name "LogFileSize" -Type DWord -Value 16384
```

<img width="1191" height="685" alt="image" src="https://github.com/user-attachments/assets/257e86da-dbee-42c7-8c24-e90c71ec36f4" />

```
File ......machine
Windows Firewall    Log dropped packets (Private Profile, Policy)
RegistryPath:      HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging
RegistryItem:      LogDroppedPackets
DefaultValue:      0
RecommendedValue:  1
```

```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging" -Name "LogDroppedPackets" -Type DWord -Value 1
```

<img width="1189" height="684" alt="image" src="https://github.com/user-attachments/assets/11c19c6f-5218-48aa-a841-d64d3c32577d" />

```
File ......machine
Windows Firewall    Log dropped packets (Private Profile)
RegistryPath:      HKLM:\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\Logging
RegistryItem:      LogDroppedPackets
DefaultValue:      0
RecommendedValue:  1
```

```ps1
New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\Logging" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\Logging" -Name "LogDroppedPackets" -Type DWord -Value 1
```

<img width="1190" height="686" alt="image" src="https://github.com/user-attachments/assets/48dffecc-9bfb-4c8b-bb8c-314bd593a09e" />

```
File ......machine
Windows Firewall    Log successful connections (Private Profile, Policy)
RegistryPath:      HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging
RegistryItem:      LogSuccessfulConnections
DefaultValue:      0
RecommendedValue:  1
```

```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging" -Name "LogSuccessfulConnections" -Type DWord -Value 1
```

<img width="1190" height="687" alt="image" src="https://github.com/user-attachments/assets/b0e8300c-b64c-4278-99b7-619578d37cef" />

```
File ......machine
Windows Firewall    Log successful connections (Private Profile)
RegistryPath:      HKLM:\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\Logging
RegistryItem:      LogSuccessfulConnections
DefaultValue:      0
RecommendedValue:  1
```

```ps1
New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\Logging" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\Logging" -Name "LogSuccessfulConnections" -Type DWord -Value 1
```

<img width="1190" height="687" alt="image" src="https://github.com/user-attachments/assets/70d521d5-f5a9-4e70-a85e-92565590baed" />

```
File ......machine
Windows Firewall    Log size limit (Public Profile, Policy)
RegistryPath:      HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging
RegistryItem:      LogFileSize
DefaultValue:      4096
RecommendedValue:  16384
```

```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging" -Name "LogFileSize" -Type DWord -Value 16384
```

<img width="1191" height="687" alt="image" src="https://github.com/user-attachments/assets/24601739-6907-424d-b8fe-62c932d0aab4" />

```
File ......machine
Windows Firewall    Log size limit (Public Profile)
RegistryPath:      HKLM:\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile\Logging
RegistryItem:      LogFileSize
DefaultValue:      4096
RecommendedValue:  16384
```

```ps1
New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile\Logging" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile\Logging" -Name "LogFileSize" -Type DWord -Value 16384
```

<img width="1188" height="686" alt="image" src="https://github.com/user-attachments/assets/522a7558-86a6-490c-b99c-971b11bb6ff7" />

```
File ......machine
Windows Firewall    Log dropped packets (Public Profile, Policy)
RegistryPath:      HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging
RegistryItem:      LogDroppedPackets
DefaultValue:      0
RecommendedValue:  1
```

```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging" -Name "LogDroppedPackets" -Type DWord -Value 1
```

<img width="1189" height="692" alt="image" src="https://github.com/user-attachments/assets/389901c8-499b-4d14-8923-4a719d1a2b80" />

```
File ......machine
Windows Firewall    Log dropped packets (Public Profile)
RegistryPath:      HKLM:\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile\Logging
RegistryItem:      LogDroppedPackets
DefaultValue:      0
RecommendedValue:  1
```

```ps1
New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile\Logging" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile\Logging" -Name "LogDroppedPackets" -Type DWord -Value 1
```

<img width="1190" height="688" alt="image" src="https://github.com/user-attachments/assets/3e7121eb-9d3b-4432-8059-7f8e1e660119" />

```
File ......machine
Windows Firewall    Log successful connections (Public Profile, Policy)
RegistryPath:      HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging
RegistryItem:      LogSuccessfulConnections
DefaultValue:      0
RecommendedValue:  1
```

```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging" -Name "LogSuccessfulConnections" -Type DWord -Value 1
```

<img width="1192" height="687" alt="image" src="https://github.com/user-attachments/assets/952c9a66-ac52-4c63-b3a9-c310e51382e2" />

```
File ......machine
Windows Firewall    Log successful connections (Public Profile)
RegistryPath:      HKLM:\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile\Logging
RegistryItem:      LogSuccessfulConnections
DefaultValue:      0
RecommendedValue:  1
```

```ps1
New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile\Logging" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile\Logging" -Name "LogSuccessfulConnections" -Type DWord -Value 1
```

<img width="1193" height="689" alt="image" src="https://github.com/user-attachments/assets/f7360323-fd11-4673-aa2c-08cb17326bd8" />

```
File ......machine
PowerShell    Turn on PowerShell Module Logging
RegistryPath:      HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ModuleLogging
RegistryItem:      EnableModuleLogging
DefaultValue:      0
RecommendedValue:  1
```

```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ModuleLogging" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ModuleLogging" -Name "EnableModuleLogging" -Type DWord -Value 1
```

<img width="1186" height="687" alt="image" src="https://github.com/user-attachments/assets/7df93850-b8ae-4847-8f12-441c841d9947" />

```
File ......machine
Turn on PowerShell Script Block Logging
RegistryPath:      HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging
RegistryItem:      EnableScriptBlockLogging
DefaultValue:      0
RecommendedValue:  1
```

```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" -Name "EnableScriptBlockLogging" -Type DWord -Value 1
```

<img width="1191" height="689" alt="image" src="https://github.com/user-attachments/assets/07c1e7f0-6a44-4427-b56a-0db7c6ae237d" />

```
File ......machine
Turn on PowerShell Script Block Logging (Invocation)
RegistryPath:      HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging
RegistryItem:      EnableScriptBlockInvocationLogging
DefaultValue:      0
RecommendedValue:  1
```

```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" -Name "EnableScriptBlockInvocationLogging" -Type DWord -Value 1
```

<img width="1191" height="689" alt="image" src="https://github.com/user-attachments/assets/b1408229-7900-47b2-96a0-7c7ded8b5bbe" />

```
File ......machine
Administrative Templates: PowerShellCore    Turn on PowerShell Module Logging
RegistryPath:      HKLM:\Software\Policies\Microsoft\PowerShellCore\ModuleLogging
RegistryItem:      EnableModuleLogging
DefaultValue:      0
RecommendedValue:  1
```

```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\PowerShellCore\ModuleLogging" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\PowerShellCore\ModuleLogging" -Name "EnableModuleLogging" -Type DWord -Value 1
```

<img width="1187" height="688" alt="image" src="https://github.com/user-attachments/assets/96244e0b-a72b-4dee-a1d6-dcafaf560e7a" />

```
File ......machine
Administrative Templates: PowerShellCore    Turn on PowerShell Module Logging (PowerShell Policy)
RegistryPath:      HKLM:\Software\Policies\Microsoft\PowerShellCore\ModuleLogging
RegistryItem:      UseWindowsPowerShellPolicySetting
DefaultValue:      0
RecommendedValue:  1
```

```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\PowerShellCore\ModuleLogging" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\PowerShellCore\ModuleLogging" -Name "UseWindowsPowerShellPolicySetting" -Type DWord -Value 1
```

<img width="1187" height="686" alt="image" src="https://github.com/user-attachments/assets/190f55a8-4d9f-4c1c-9fc4-b671ff1212e9" />

```
File ......machine
Administrative Templates: PowerShellCore    Turn on PowerShell Script Block Logging
RegistryPath:      HKLM:\Software\Policies\Microsoft\PowerShellCore\ScriptBlockLogging
RegistryItem:      EnableScriptBlockLogging
DefaultValue:      0
RecommendedValue:  1
```

```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\PowerShellCore\ScriptBlockLogging" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\PowerShellCore\ScriptBlockLogging" -Name "EnableScriptBlockLogging" -Type DWord -Value 1
```

<img width="1192" height="686" alt="image" src="https://github.com/user-attachments/assets/d649f830-4e34-4b36-8f83-b39fe490a23e" />

```
File ......machine
Administrative Templates: PowerShellCore    Turn on PowerShell Script Block Logging
RegistryPath:      HKLM:\Software\Policies\Microsoft\PowerShellCore\ScriptBlockLogging
RegistryItem:      EnableScriptBlockInvocationLogging
DefaultValue:      0
RecommendedValue:  1
```

```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\PowerShellCore\ScriptBlockLogging" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\PowerShellCore\ScriptBlockLogging" -Name "EnableScriptBlockInvocationLogging" -Type DWord -Value 1
```

<img width="1187" height="686" alt="image" src="https://github.com/user-attachments/assets/f9d554b1-cdf4-4452-864c-5263cad3606d" />

```
File ......machine
Administrative Templates: PowerShellCore    Turn on PowerShell Script Block Logging
RegistryPath:      HKLM:\Software\Policies\Microsoft\PowerShellCore\ScriptBlockLogging
RegistryItem:      UseWindowsPowerShellPolicySetting
DefaultValue:      0
RecommendedValue:  1
```

```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\PowerShellCore\ScriptBlockLogging" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\PowerShellCore\ScriptBlockLogging" -Name "UseWindowsPowerShellPolicySetting" -Type DWord -Value 1
```

<img width="1192" height="687" alt="image" src="https://github.com/user-attachments/assets/c03257f0-e6e2-46a6-a4d8-c774100bd2de" />

# Audit

```
File ......machine
Security Options	Audit: Force audit policy subcategory settings to override audit policy category settings
RegistryPath:      HKLM:\System\CurrentControlSet\Control\Lsa
RegistryItem:      SCENoApplyLegacyAuditPolicy
DefaultValue:      1
RecommendedValue:  1
```

```ps1
New-Item -Path "HKLM:\System\CurrentControlSet\Control\Lsa" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Lsa" -Name "SCENoApplyLegacyAuditPolicy" -Type DWord -Value 1
```

<img width="1219" height="698" alt="image" src="https://github.com/user-attachments/assets/0025c784-4269-4c6d-89d3-52e5f3f1e6df" />

```
File ......machine
Security Options	Network security: Restrict NTLM: Audit Incoming NTLM Traffic
RegistryPath:      HKLM:\System\CurrentControlSet\Control\Lsa\MSV1_0
RegistryItem:      AuditReceivingNTLMTraffic
DefaultValue:      0
RecommendedValue:  2
```

```ps1
New-Item -Path "HKLM:\System\CurrentControlSet\Control\Lsa\MSV1_0" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Lsa\MSV1_0" -Name "AuditReceivingNTLMTraffic" -Type DWord -Value 2
```

<img width="1220" height="699" alt="image" src="https://github.com/user-attachments/assets/db5e80fc-d634-4844-843c-52614afd776d" />

```
File ......machine
Security Options	Network security: Restrict NTLM: Audit NTLM authentication in this domain
RegistryPath:      HKLM:\System\CurrentControlSet\Services\Netlogon\Parameters
RegistryItem:      AuditNTLMInDomain
DefaultValue:      0
RecommendedValue:  7
```

```ps1
New-Item -Path "HKLM:\System\CurrentControlSet\Services\Netlogon\Parameters" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Services\Netlogon\Parameters" -Name "AuditNTLMInDomain" -Type DWord -Value 7
```

<img width="1220" height="696" alt="image" src="https://github.com/user-attachments/assets/4fbf02e9-2414-4d4d-b819-83a6f8df1e5a" />

```
File ......machine
Advanced Audit Policy Configuration	Credential Validation
MethodArgument:    {0CCE923F-69AE-11D9-BED3-505054503030}
DefaultValue:      No Auditing
RecommendedValue:  Success and Failure	
```

```ps1
auditpol /set /subcategory:"{0CCE923F-69AE-11D9-BED3-505054503030}" /success:enable /failure:enable
```

<img width="958" height="128" alt="image" src="https://github.com/user-attachments/assets/5448cae7-a860-4436-95b3-3a01f7b65948" />

```
File ......machine
Advanced Audit Policy Configuration	Security Group Management
MethodArgument:    {0CCE9237-69AE-11D9-BED3-505054503030}
DefaultValue:      Success
RecommendedValue:  Success	
```

```ps1
auditpol /set /subcategory:"{0CCE9237-69AE-11D9-BED3-505054503030}" /success:enable /failure:enable
```

<img width="888" height="114" alt="image" src="https://github.com/user-attachments/assets/64aa189e-890f-4980-aa02-5b755dd7b5ed" />

```
File ......machine
Advanced Audit Policy Configuration	User Account Management
MethodArgument:    {0CCE9235-69AE-11D9-BED3-505054503030}
DefaultValue:      Success
RecommendedValue:  Success and Failure
```

```ps1
auditpol /set /subcategory:"{0CCE9235-69AE-11D9-BED3-505054503030}" /success:enable /failure:enable
```

<img width="961" height="131" alt="image" src="https://github.com/user-attachments/assets/a90748b1-7e37-4408-8088-741817af42d4" />

```
File ......machine
Advanced Audit Policy Configuration	DPAPI Activity
MethodArgument:    {0CCE922D-69AE-11D9-BED3-505054503030}
DefaultValue:      No Auditing
RecommendedValue:  Success and Failure
```

```ps1
auditpol /set /subcategory:"{0CCE922D-69AE-11D9-BED3-505054503030}" /success:enable /failure:enable
```

<img width="959" height="127" alt="image" src="https://github.com/user-attachments/assets/cc9079c0-29e5-4369-9bce-31e52a0c80c5" />


```
File ......machine
Advanced Audit Policy Configuration	Plug and Play Events
MethodArgument:    {0CCE9248-69AE-11D9-BED3-505054503030}
DefaultValue:      No Auditing
RecommendedValue:  Success
```

```ps1
auditpol /set /subcategory:"{0CCE9248-69AE-11D9-BED3-505054503030}" /success:enable /failure:disable
```

<img width="960" height="130" alt="image" src="https://github.com/user-attachments/assets/0450f8e0-1db2-44a4-a0cb-368fa44a283c" />

```
File ......machine
Advanced Audit Policy Configuration	Process Creation
MethodArgument:    {0CCE922B-69AE-11D9-BED3-505054503030}
DefaultValue:      No Auditing
RecommendedValue:  Success
```

```ps1
auditpol /set /subcategory:"{0CCE922B-69AE-11D9-BED3-505054503030}" /success:enable /failure:enable
```

<img width="960" height="161" alt="image" src="https://github.com/user-attachments/assets/81f7ab59-3700-4452-abf3-1099b42de3fb" />

```
File ......machine
Advanced Audit Policy Configuration	Account Lockout
MethodArgument:    {0CCE9217-69AE-11D9-BED3-505054503030}
DefaultValue:      Success
RecommendedValue:  Failure
```

```ps1
auditpol /set /subcategory:"{0CCE9217-69AE-11D9-BED3-505054503030}" /success:disable /failure:enable
```

<img width="957" height="127" alt="image" src="https://github.com/user-attachments/assets/fd9ea45e-a9ef-4f18-91c6-8bb8cdf64431" />

```
File ......machine
Advanced Audit Policy Configuration	Group Membership
MethodArgument:    {0CCE9249-69AE-11D9-BED3-505054503030}
DefaultValue:      No Auditing
RecommendedValue:  Success
```

```ps1
auditpol /set /subcategory:"{0CCE9249-69AE-11D9-BED3-505054503030}" /success:enable /failure:disable
```

<img width="961" height="130" alt="image" src="https://github.com/user-attachments/assets/9a82c0a4-8d3b-42e9-b151-c8ffd4abbe75" />

```
File ......machine
Advanced Audit Policy Configuration	Logon
MethodArgument:    {0CCE9215-69AE-11D9-BED3-505054503030}
DefaultValue:      Success and Failure
RecommendedValue:  Success and Failure
```

```ps1
auditpol /set /subcategory:"{0CCE9215-69AE-11D9-BED3-505054503030}" /success:enable /failure:enable
```

<img width="960" height="143" alt="image" src="https://github.com/user-attachments/assets/1ba64a23-ee31-4f1d-ab2d-da7cff8addd3" />

```
File ......machine
Advanced Audit Policy Configuration	Other Logon/Logoff Events
MethodArgument:    {0CCE921C-69AE-11D9-BED3-505054503030}
DefaultValue:      No Auditing
RecommendedValue:  Success and Failure
```

```ps1
auditpol /set /subcategory:"{0CCE921C-69AE-11D9-BED3-505054503030}" /success:enable /failure:enable
```

<img width="959" height="126" alt="image" src="https://github.com/user-attachments/assets/1030ce85-4e6e-4043-9d67-7966159e13c3" />

```
File ......machine
Advanced Audit Policy Configuration	Special Logon
MethodArgument:    {0CCE921B-69AE-11D9-BED3-505054503030}
DefaultValue:      No Auditing
RecommendedValue:  Success
```

```ps1
auditpol /set /subcategory:"{0CCE921B-69AE-11D9-BED3-505054503030}" /success:enable /failure:disable
```

<img width="960" height="126" alt="image" src="https://github.com/user-attachments/assets/935f02e7-8488-48c8-ba96-68f440ff5278" />

```
File ......machine
Advanced Audit Policy Configuration	Detailed File Share
MethodArgument:    {0CCE9244-69AE-11D9-BED3-505054503030}
DefaultValue:      No Auditing
RecommendedValue:  Success
```

```ps1
auditpol /set /subcategory:"{0CCE9244-69AE-11D9-BED3-505054503030}" /success:enable /failure:disable
```

<img width="958" height="129" alt="image" src="https://github.com/user-attachments/assets/502676bb-cb4c-4dd9-a247-74d9c7b04840" />

```
File ......machine
Advanced Audit Policy Configuration	Kernel Object
MethodArgument:    {0CCE921F-69AE-11D9-BED3-505054503030}
DefaultValue:      No Auditing
RecommendedValue:  Success and Failure
```

```ps1
auditpol /set /subcategory:"{0CCE921F-69AE-11D9-BED3-505054503030}" /success:enable /failure:enable
```

<img width="962" height="146" alt="image" src="https://github.com/user-attachments/assets/1458673b-3561-442e-b3f4-8bbb520be003" />

```
File ......machine
Advanced Audit Policy Configuration	Other Object Access Events
MethodArgument:    {0CCE9227-69AE-11D9-BED3-505054503030}
DefaultValue:      No Auditing
RecommendedValue:  Success and Failure
```

```ps1
auditpol /set /subcategory:"{0CCE9227-69AE-11D9-BED3-505054503030}" /success:enable /failure:enable
```

<img width="960" height="141" alt="image" src="https://github.com/user-attachments/assets/ffb73054-70e1-4ca0-b70d-f2e6dc1ae390" />

```
File ......machine
Advanced Audit Policy Configuration	Removable Storage
MethodArgument:    {0CCE9245-69AE-11D9-BED3-505054503030}
DefaultValue:      No Auditing
RecommendedValue:  Success and Failure
```

```ps1
auditpol /set /subcategory:"{0CCE9245-69AE-11D9-BED3-505054503030}" /success:enable /failure:enable
```

<img width="959" height="143" alt="image" src="https://github.com/user-attachments/assets/0cd4392f-41d9-46df-a6a5-1f98fe1a1a3d" />

```
File ......machine
Advanced Audit Policy Configuration	SAM
MethodArgument:    {0CCE9220-69AE-11D9-BED3-505054503030}
DefaultValue:      No Auditing
RecommendedValue:  Success and Failure
```

```ps1
auditpol /set /subcategory:"{0CCE9220-69AE-11D9-BED3-505054503030}" /success:enable /failure:enable
```

<img width="963" height="143" alt="image" src="https://github.com/user-attachments/assets/fec4137e-0086-4137-a1d9-e43fc0f57f80" />

```
File ......machine
Advanced Audit Policy Configuration	Audit Policy Change
MethodArgument:    {0CCE922F-69AE-11D9-BED3-505054503030}
DefaultValue:      Success
RecommendedValue:  Success
```

```ps1
auditpol /set /subcategory:"{0CCE922F-69AE-11D9-BED3-505054503030}" /success:enable /failure:disable
```

<img width="957" height="141" alt="image" src="https://github.com/user-attachments/assets/90329b52-df50-4b5d-ae56-7a56a05ba04a" />

```
File ......machine
Advanced Audit Policy Configuration	Authentication Policy Change
MethodArgument:    {0CCE9230-69AE-11D9-BED3-505054503030}
DefaultValue:      Success
RecommendedValue:  Success
```

```ps1
auditpol /set /subcategory:"{0CCE9230-69AE-11D9-BED3-505054503030}" /success:enable /failure:disable
```

<img width="959" height="145" alt="image" src="https://github.com/user-attachments/assets/b0a5e1e1-0a6a-490b-932d-0fddf1a0b876" />

```
File ......machine
Advanced Audit Policy Configuration	MPSSVC Rule-Level Policy Change
MethodArgument:    {0CCE9232-69AE-11D9-BED3-505054503030}
DefaultValue:      No Auditing
RecommendedValue:  Success and Failure
```

```ps1
auditpol /set /subcategory:"{0CCE9232-69AE-11D9-BED3-505054503030}" /success:enable /failure:enable
```

<img width="958" height="144" alt="image" src="https://github.com/user-attachments/assets/1598462d-f64b-4078-a800-0bdc4f5bf0de" />

```
File ......machine
Advanced Audit Policy Configuration	Other Policy Change Events
MethodArgument:    {0CCE9234-69AE-11D9-BED3-505054503030}
DefaultValue:      No Auditing
RecommendedValue:  Failure
```

```ps1
auditpol /set /subcategory:"{0CCE9234-69AE-11D9-BED3-505054503030}" /success:disable /failure:enable
```

<img width="962" height="143" alt="image" src="https://github.com/user-attachments/assets/84a27811-ab6d-4f1c-9172-226d7cb427a5" />

```
File ......machine
Advanced Audit Policy Configuration	Sensitive Privilege Use
MethodArgument:    {0CCE9228-69AE-11D9-BED3-505054503030}
DefaultValue:      No Auditing
RecommendedValue:  Success and Failure
```

```ps1
auditpol /set /subcategory:"{0CCE9228-69AE-11D9-BED3-505054503030}" /success:enable /failure:enable
```

<img width="959" height="146" alt="image" src="https://github.com/user-attachments/assets/ad6b35fe-b37c-444b-af29-aa6058adfe29" />

```
File ......machine
Advanced Audit Policy Configuration	Other System Events
MethodArgument:    {0CCE9214-69AE-11D9-BED3-505054503030}
DefaultValue:      Success and Failure
RecommendedValue:  Success and Failure
```

```ps1
auditpol /set /subcategory:"{0CCE9214-69AE-11D9-BED3-505054503030}" /success:enable /failure:enable
```

<img width="956" height="146" alt="image" src="https://github.com/user-attachments/assets/a0b0fd44-5a43-488f-a34b-220be5493def" />

```
File ......machine
Advanced Audit Policy Configuration	Security State Change
MethodArgument:    {0CCE9210-69AE-11D9-BED3-505054503030}
DefaultValue:      Success
RecommendedValue:  Success
```

```ps1
auditpol /set /subcategory:"{0CCE9210-69AE-11D9-BED3-505054503030}" /success:enable /failure:disable
```

<img width="960" height="148" alt="image" src="https://github.com/user-attachments/assets/6c8a2f40-1a68-436c-a5c8-41f717501ed8" />

```
File ......machine
Advanced Audit Policy Configuration	Security System Extension
MethodArgument:    {0CCE9211-69AE-11D9-BED3-505054503030}
DefaultValue:      No Auditing
RecommendedValue:  Success
```

```ps1
auditpol /set /subcategory:"{0CCE9211-69AE-11D9-BED3-505054503030}" /success:enable /failure:disable
```

<img width="959" height="142" alt="image" src="https://github.com/user-attachments/assets/bcbca4d5-f766-40c7-a25f-2050e8d6d991" />

```
File ......machine
Advanced Audit Policy Configuration	System Integrity
MethodArgument:    {0CCE9212-69AE-11D9-BED3-505054503030}
DefaultValue:      Success and Failure
RecommendedValue:  Success and Failure
```

```ps1
auditpol /set /subcategory:"{0CCE9212-69AE-11D9-BED3-505054503030}" /success:enable /failure:enable
```

<img width="960" height="143" alt="image" src="https://github.com/user-attachments/assets/7230c90d-791e-4ed9-aa66-8a454b043535" />

```
File ......machine
Security Options	Network security: Restrict NTLM: Audit NTLM authentication in this domain
RegistryPath:      HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\LSASS.exe
RegistryItem:      AuditLevel
DefaultValue:      -
RecommendedValue:  8
```

```ps1
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\LSASS.exe" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\LSASS.exe" -Name "AuditLevel" -Type DWord -Value 8
```

<img width="1223" height="703" alt="image" src="https://github.com/user-attachments/assets/9bca3e57-ef7d-4601-a10b-d68360fe772e" />
