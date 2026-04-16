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
