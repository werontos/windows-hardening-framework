# Harden-GPO.ps1 — Implementation Documentation

***Administrative Templates: System	Credentials Delegation: Encryption Oracle Remediation***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\CredSSP\Parameters
RegistryItem:  AllowEncryptionOracle
DefaultValue:      0
RecommendedValue:  0
```
```ps1
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\CredSSP\Parameters" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\CredSSP\Parameters" -Name "AllowEncryptionOracle" -Type DWord -Value 0
```
<img width="1269" height="605" alt="image" src="https://github.com/user-attachments/assets/39fe4df9-1b45-4ed7-b1e2-2392462c387a" />

---
***Administrative Templates: System	Credentials Delegation: Remote host allows delegation of non-exportable credentials***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\CredentialsDelegation
RegistryItem:  AllowProtectedCreds
DefaultValue:      0
RecommendedValue:  1
```
```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CredentialsDelegation" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\CredentialsDelegation" -Name "AllowProtectedCreds" -Type DWord -Value 1
```
<img width="1268" height="604" alt="image" src="https://github.com/user-attachments/assets/35571f3b-c88c-49a1-bcb1-321d7903e4d6" />

---
***Administrative Templates: System	Device Guard: Turn On Virtualization Based Security (Policy)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard
RegistryItem:  EnableVirtualizationBasedSecurity
DefaultValue:      -
RecommendedValue:  1
```
```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" -Name "EnableVirtualizationBasedSecurity" -Type DWord -Value 1
```
<img width="1270" height="604" alt="image" src="https://github.com/user-attachments/assets/bb652929-5387-45bb-842f-513813c97970" />

---
***Administrative Templates: System	Device Guard: Select Platform Security Level (Policy)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard
RegistryItem:  RequirePlatformSecurityFeatures
DefaultValue:      -
RecommendedValue:  3
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" -Name "RequirePlatformSecurityFeatures" -Type DWord -Value 3
```
<img width="1266" height="601" alt="image" src="https://github.com/user-attachments/assets/3e0b516d-9869-4bf6-a19b-56c2ac6e879b" />

---
***Administrative Templates: System	Device Guard: Virtualization Based Protection of Code Integrity (Policy)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard
RegistryItem:  HypervisorEnforcedCodeIntegrity
DefaultValue:      -
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" -Name "HypervisorEnforcedCodeIntegrity" -Type DWord -Value 1
```
<img width="1268" height="604" alt="image" src="https://github.com/user-attachments/assets/0863ede0-edbd-441f-8640-3ad5ddaee351" />

---
***Administrative Templates: System	Device Guard: Require UEFI Memory Attributes Table (Policy)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard
RegistryItem:  HVCIMATRequired
DefaultValue:      -
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" -Name "HVCIMATRequired" -Type DWord -Value 1
```
<img width="1264" height="603" alt="image" src="https://github.com/user-attachments/assets/71d46ffb-4f72-462f-9fcc-bf23c9ff014d" />

---
***Administrative Templates: System	Device Guard: Credential Guard Configuration (DC)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard
RegistryItem:  LsaCfgFlags
DefaultValue:      -
RecommendedValue:  0
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" -Name "LsaCfgFlags" -Type DWord -Value 0
```
<img width="1270" height="592" alt="image" src="https://github.com/user-attachments/assets/9a1ad61c-4e48-4594-b4c5-e2e2ee1be04f" />

---
***MS Security Guide    Credential Guard / LSA: Enable Virtualization Based Security***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SYSTEM\CurrentControlSet\Control\Lsa
RegistryItem:  LsaCfgFlags
DefaultValue:      0
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -Name "LsaCfgFlags" -Type DWord -Value 1
```
<img width="1266" height="596" alt="image" src="https://github.com/user-attachments/assets/9601613f-b7c9-4b5d-92f1-e76f1148769a" />

---
***Administrative Templates: System	Device Guard: Secure Launch Configuration (Policy)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard
RegistryItem:  ConfigureSystemGuardLaunch
DefaultValue:      0
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" -Name "ConfigureSystemGuardLaunch" -Type DWord -Value 1
```
<img width="1267" height="600" alt="image" src="https://github.com/user-attachments/assets/234d1d90-9dab-4fea-bdd4-6f998b442054" />

---
***Administrative Templates: System	Device Installation: Device Installation Restrictions: Prevent device metadata retrieval from the Internet***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows\Device Metadata
RegistryItem:  PreventDeviceMetadataFromNetwork
DefaultValue:      -
RecommendedValue:  1
```
```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Device Metadata" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Device Metadata" -Name "PreventDeviceMetadataFromNetwork" -Type DWord -Value 1
```
<img width="1266" height="601" alt="image" src="https://github.com/user-attachments/assets/126994c6-d8f7-4098-9237-d614a8b7e930" />

---
***Administrative Templates: System	Early Launch Antimalware: Boot-Start Driver Initialization Policy***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\System\CurrentControlSet\Policies\EarlyLaunch
RegistryItem:  DriverLoadPolicy
DefaultValue:      0
RecommendedValue:  3
```
```ps1
New-Item -Path "HKLM:\System\CurrentControlSet\Policies\EarlyLaunch" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Policies\EarlyLaunch" -Name "DriverLoadPolicy" -Type DWord -Value 3
```
<img width="1267" height="603" alt="image" src="https://github.com/user-attachments/assets/d62c4261-d414-461e-81cb-e55700314153" />

---
***Administrative Templates: System	Group Policy: Do not apply during periodic background processing***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}
RegistryItem:  NoGPOListChanges
DefaultValue:      0
RecommendedValue:  0
```
```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}" -Name "NoGPOListChanges" -Type DWord -Value 0
```
<img width="1269" height="600" alt="image" src="https://github.com/user-attachments/assets/958e531d-4957-48f2-8a2d-ed4d324968a3" />

---
***Administrative Templates: System	Group Policy: Process even if the Group Policy objects have not changed***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}
RegistryItem:  NoBackgroundPolicy
DefaultValue:      1
RecommendedValue:  0
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}" -Name "NoBackgroundPolicy" -Type DWord -Value 0
```
<img width="1266" height="602" alt="image" src="https://github.com/user-attachments/assets/189bfd0b-6717-4c8d-ac40-e077a0a40f87" />

---
***Administrative Templates: System	Group Policy: Continue experiences on this device***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows\System
RegistryItem:  EnableCdp
DefaultValue:      1
RecommendedValue:  0
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "EnableCdp" -Type DWord -Value 0
```
<img width="1267" height="597" alt="image" src="https://github.com/user-attachments/assets/5851c8e7-6fe8-4891-b1eb-21a234b00c73" />

---
***Administrative Templates: System	Group Policy: Turn off background refresh of Group Policy***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System
RegistryItem:  DisableBkGndGroupPolicy
DefaultValue:      0
RecommendedValue:  0
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "DisableBkGndGroupPolicy" -Type DWord -Value 0
```
<img width="1250" height="598" alt="image" src="https://github.com/user-attachments/assets/94b6b2e6-1eca-432a-b168-56a003e9d01a" />

---
***Administrative Templates: System	Internet Communication Management: Internet Communication settings: Turn off downloading of print drivers over HTTP***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows NT\Printers
RegistryItem:  DisableWebPnPDownload
DefaultValue:      0
RecommendedValue:  1
```
```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows NT\Printers" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows NT\Printers" -Name "DisableWebPnPDownload" -Type DWord -Value 1
```
<img width="1267" height="598" alt="image" src="https://github.com/user-attachments/assets/be898e5c-8ed0-422e-878e-010ecd9c8766" />

---
***Administrative Templates: System	Internet Communication Management: Internet Communication settings: Turn off handwriting personalization data sharing***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows\TabletPC
RegistryItem:  PreventHandwritingDataSharing
DefaultValue:      0
RecommendedValue:  1
```
```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\TabletPC" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\TabletPC" -Name "PreventHandwritingDataSharing" -Type DWord -Value 1
```
<img width="1268" height="604" alt="image" src="https://github.com/user-attachments/assets/3c93be3b-3051-4097-b294-ac2643c0a094" />

---
***Administrative Templates: System	Internet Communication Management: Internet Communication settings: Turn off handwriting recognition error reporting***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports
RegistryItem:  PreventHandwritingErrorReports
DefaultValue:      0
RecommendedValue:  1
```
```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports" -Name "PreventHandwritingErrorReports" -Type DWord -Value 1
```
<img width="1269" height="600" alt="image" src="https://github.com/user-attachments/assets/c3b4ddf1-7b57-4a73-bb66-a4c51ad583b8" />

---
***Administrative Templates: System	Internet Communication Management: Internet Communication settings: Turn off Internet Connection Wizard if URL connection is referring to Microsoft.com***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows\Internet Connection Wizard
RegistryItem:  ExitOnMSICW
DefaultValue:      0
RecommendedValue:  1
```
```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Internet Connection Wizard" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Internet Connection Wizard" -Name "ExitOnMSICW" -Type DWord -Value 1
```
<img width="1149" height="599" alt="image" src="https://github.com/user-attachments/assets/b5a17c77-a765-425d-83c0-8aaa71cbb1bc" />

---
***Administrative Templates: System	Internet Communication Management: Internet Communication settings: Turn off Internet download for Web publishing and online ordering wizards***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer
RegistryItem:  NoWebServices
DefaultValue:      0
RecommendedValue:  1
```
```ps1
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "NoWebServices" -Type DWord -Value 1
```
<img width="1145" height="601" alt="image" src="https://github.com/user-attachments/assets/8c025ede-6e4f-4588-bea3-7081cace9107" />

---
***Administrative Templates: System	Internet Communication Management: Internet Communication settings: Turn off printing over HTTP***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers
RegistryItem:  DisableHTTPPrinting
DefaultValue:      0
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers" -Name "DisableHTTPPrinting" -Type DWord -Value 1
```
<img width="1150" height="604" alt="image" src="https://github.com/user-attachments/assets/6aab17b5-76c8-4dbd-8f32-597280914992" />

---
***Administrative Templates: System	Internet Communication Management: Internet Communication settings: Turn off Registration if URL connection is referring to Microsoft.com***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows\Registration Wizard Control
RegistryItem:  NoRegistration
DefaultValue:      0
RecommendedValue:  1
```
```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Registration Wizard Control" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Registration Wizard Control" -Name "NoRegistration" -Type DWord -Value 1
```
<img width="1151" height="604" alt="image" src="https://github.com/user-attachments/assets/a5870319-fef1-4c83-8cbe-a34def8bb98f" />

---
***Administrative Templates: System	Internet Communication Management: Internet Communication settings: Turn off Search Companion content file updates***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\SearchCompanion
RegistryItem:  DisableContentFileUpdates
DefaultValue:      0
RecommendedValue:  1
```
```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\SearchCompanion" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\SearchCompanion" -Name "DisableContentFileUpdates" -Type DWord -Value 1
```
<img width="1148" height="601" alt="image" src="https://github.com/user-attachments/assets/82d6b6d8-ac79-466c-9257-7f64f3ea1250" />

---
***Administrative Templates: System	Internet Communication Management: Internet Communication settings: Turn off the 'Order Prints' picture task***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer
RegistryItem:  NoOnlinePrintsWizard
DefaultValue:      0
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "NoOnlinePrintsWizard" -Type DWord -Value 1
```
<img width="1145" height="603" alt="image" src="https://github.com/user-attachments/assets/1716f2cf-875d-4369-bf43-28eea457bdf4" />

---
***Administrative Templates: System	Internet Communication Management: Internet Communication settings: Turn off the 'Publish to Web' task for files and folders***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer
RegistryItem:  NoPublishingWizard
DefaultValue:      0
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "NoPublishingWizard" -Type DWord -Value 1
```
<img width="1150" height="600" alt="image" src="https://github.com/user-attachments/assets/ab4db62f-d8e8-4e15-a5cf-9b56bac3b485" />

---
***Internet Communication Management: Internet Communication settings: Turn off the Windows Messenger Customer Experience Improvement Program***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Messenger\Client
RegistryItem:  CEIP
DefaultValue:      0
RecommendedValue:  2
```
```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\Messenger\Client" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Messenger\Client" -Name "CEIP" -Type DWord -Value 2
```
<img width="1146" height="593" alt="image" src="https://github.com/user-attachments/assets/f9068f5e-1fcf-464a-a35d-c6892d445630" />

---
***Administrative Templates: System	Internet Communication Management: Internet Communication settings: Turn off Windows Customer Experience Improvement Program***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\SQMClient\Windows
RegistryItem:  CEIPEnable
DefaultValue:      1
RecommendedValue:  0
```
```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\SQMClient\Windows" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\SQMClient\Windows" -Name "CEIPEnable" -Type DWord -Value 0
```
<img width="1150" height="604" alt="image" src="https://github.com/user-attachments/assets/015c6337-2e6d-415c-a2e2-5a03c1d6486c" />

---
***Administrative Templates: System	Internet Communication Management: Internet Communication settings: Turn off Windows Error Reporting 1***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\PCHealth\ErrorReporting
RegistryItem:  DoReport
DefaultValue:      1
RecommendedValue:  0
```
```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\PCHealth\ErrorReporting" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\PCHealth\ErrorReporting" -Name "DoReport" -Type DWord -Value 0
```
<img width="1142" height="602" alt="image" src="https://github.com/user-attachments/assets/6a409c01-5ead-41bf-b58a-33e0e5137834" />

---
***Administrative Templates: System	Internet Communication Management: Internet Communication settings: Turn off Windows Error Reporting 2***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\Windows Error Reporting
RegistryItem:  Disabled
DefaultValue:      0
RecommendedValue:  1
```
```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\Windows Error Reporting" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\Windows Error Reporting" -Name "Disabled" -Type DWord -Value 1
```
<img width="1079" height="555" alt="image" src="https://github.com/user-attachments/assets/c8481f77-cb80-48c7-aa69-495c333a57fc" />

---
***Administrative Templates: System	Kerberos: Support device authentication using certificate (DevicePKInitBehavior)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\kerberos\parameters
RegistryItem:  DevicePKInitBehavior
DefaultValue:      1
RecommendedValue:  0
```
```ps1
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\kerberos\parameters" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\kerberos\parameters" -Name "DevicePKInitBehavior" -Type DWord -Value 0
```
<img width="1145" height="600" alt="image" src="https://github.com/user-attachments/assets/1f30db44-0f76-48f5-a224-4f2dd1c8687c" />

---
***Administrative Templates: System	Kerberos: Support device authentication using certificate (DevicePKInitEnabled)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\kerberos\parameters
RegistryItem:  DevicePKInitEnabled
DefaultValue:      1
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\kerberos\parameters" -Name "DevicePKInitEnabled" -Type DWord -Value 1
```
<img width="1147" height="601" alt="image" src="https://github.com/user-attachments/assets/d497239e-4ab8-43a3-b3e5-96d932e5d6be" />

---
