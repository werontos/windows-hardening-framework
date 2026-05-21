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
***Administrative Templates: System	Kernel DMA Protection: Enumeration policy for external devices incompatible with Kernel DMA Protection***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows\Kernel DMA Protection
RegistryItem:  DeviceEnumerationPolicy
DefaultValue:      2
RecommendedValue:  0
```
```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Kernel DMA Protection" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Kernel DMA Protection" -Name "DeviceEnumerationPolicy" -Type DWord -Value 0
```
<img width="1141" height="601" alt="image" src="https://github.com/user-attachments/assets/48f4c2b2-3f95-4854-8985-3a13d456e764" />

---
***Administrative Templates: System	Locale Services: Disallow copying of user input methods to the system account for sign-in***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Control Panel\International
RegistryItem:  BlockUserInputMethodsForSignIn
DefaultValue:      0
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Control Panel\International" -Name "BlockUserInputMethodsForSignIn" -Type DWord -Value 1
```
<img width="1146" height="600" alt="image" src="https://github.com/user-attachments/assets/7159c6af-9d1e-4d53-9e10-b64de33db0d6" />

---
***Administrative Templates: System	Logon: Block user from showing account details on sign-in***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows\System
RegistryItem:  BlockUserFromShowingAccountDetailsOnSignin
DefaultValue:      0
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Control Panel\International" -Name "BlockUserFromShowingAccountDetailsOnSignin" -Type DWord -Value 1
```
<img width="1144" height="600" alt="image" src="https://github.com/user-attachments/assets/3a0c6674-6dac-4b9f-95e2-3ca3ee80953a" />

---
***Administrative Templates: System	Logon: Do not display network selection UI***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\System
RegistryItem:  DontDisplayNetworkSelectionUI
DefaultValue:      0
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\System" -Name "DontDisplayNetworkSelectionUI" -Type DWord -Value 1
```
<img width="1145" height="600" alt="image" src="https://github.com/user-attachments/assets/dd83e9e8-b633-4f9a-81f7-d276d0098ff0" />

---
***Administrative Templates: System	Logon: Do not enumerate connected users on domain-joined computers***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\System
RegistryItem:  DontEnumerateConnectedUsers
DefaultValue:      0
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\System" -Name "DontEnumerateConnectedUsers" -Type DWord -Value 1
```
<img width="1147" height="603" alt="image" src="https://github.com/user-attachments/assets/e5266dd2-e7a7-40b2-a7a8-bd08ce78a5b7" />

---
***Administrative Templates: System	Logon: Enumerate local users on domain-joined computers (Member)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\System
RegistryItem:  EnumerateLocalUsers
DefaultValue:      0
RecommendedValue:  0
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\System" -Name "EnumerateLocalUsers" -Type DWord -Value 0
```
<img width="1147" height="601" alt="image" src="https://github.com/user-attachments/assets/376a72fb-33dc-4885-87d8-fd20fac4dfb7" />

---
***Administrative Templates: System	Logon: Turn off app notifications on the lock screen***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\System
RegistryItem:  DisableLockScreenAppNotifications
DefaultValue:      0
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\System" -Name "DisableLockScreenAppNotifications" -Type DWord -Value 1
```
<img width="1141" height="595" alt="image" src="https://github.com/user-attachments/assets/f16077d9-e111-4535-ba3d-c258911a28d3" />

---
***Administrative Templates: System	Logon: Turn off picture password sign-in***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\System
RegistryItem:  BlockDomainPicturePassword
DefaultValue:      0
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\System" -Name "BlockDomainPicturePassword" -Type DWord -Value 1
```
<img width="1143" height="601" alt="image" src="https://github.com/user-attachments/assets/d4f2d17f-25ab-402f-9c81-5b3da0f809a9" />

---
***Administrative Templates: System	Logon: Turn on convenience PIN sign-in***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\System
RegistryItem:  AllowDomainPINLogon
DefaultValue:      1
RecommendedValue:  0
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\System" -Name "AllowDomainPINLogon" -Type DWord -Value 0
```
<img width="1144" height="598" alt="image" src="https://github.com/user-attachments/assets/aca22962-d0b4-421f-8571-46755f3d9e66" />

---
***Administrative Templates: System	OS Policies: Allow Clipboard synchronization across devices***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\System
RegistryItem:  AllowCrossDeviceClipboard
DefaultValue:      1
RecommendedValue:  0
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\System" -Name "AllowCrossDeviceClipboard" -Type DWord -Value 0
```
<img width="1146" height="605" alt="image" src="https://github.com/user-attachments/assets/2ba68f28-6343-4c8f-8a95-a9fcd0c1b7f3" />

---
***OS Policies: Allow upload of User Activities***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\System
RegistryItem:  UploadUserActivities
DefaultValue:      1
RecommendedValue:  0
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\System" -Name "UploadUserActivities" -Type DWord -Value 0
```
<img width="1144" height="600" alt="image" src="https://github.com/user-attachments/assets/c1754cee-f41a-4efa-b0ff-81ec3a64f2c7" />

---
***Administrative Templates: System	Sleep Settings: Allow network connectivity during connected-standby (on battery)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\f15576e8-98b7-4186-b944-eafa664402d9
RegistryItem:  DCSettingIndex
DefaultValue:      1
RecommendedValue:  0
```
```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\f15576e8-98b7-4186-b944-eafa664402d9" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\f15576e8-98b7-4186-b944-eafa664402d9" -Name "DCSettingIndex" -Type DWord -Value 0
```
<img width="1146" height="600" alt="image" src="https://github.com/user-attachments/assets/1fb37845-7431-40b3-8cf1-7c1a33765207" />

---
***Administrative Templates: System	Sleep Settings: Allow network connectivity during connected-standby (plugged in)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\f15576e8-98b7-4186-b944-eafa664402d9
RegistryItem:  ACSettingIndex
DefaultValue:      1
RecommendedValue:  0
```
```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\f15576e8-98b7-4186-b944-eafa664402d9" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\f15576e8-98b7-4186-b944-eafa664402d9" -Name "ACSettingIndex" -Type DWord -Value 0
```
<img width="1145" height="599" alt="image" src="https://github.com/user-attachments/assets/4f7359f4-709a-4387-8dd6-5546323d8b62" />

---
***Administrative Templates: System	Remote Assistance: Configure Offer Remote Assistance***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\policies\Microsoft\Windows NT\Terminal Services
RegistryItem:  fAllowUnsolicited
DefaultValue:      1
RecommendedValue:  0
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\policies\Microsoft\Windows NT\Terminal Services" -Name "fAllowUnsolicited" -Type DWord -Value 0
```
<img width="1146" height="600" alt="image" src="https://github.com/user-attachments/assets/d452fc1e-f67c-4fc5-9e1a-314a55ffd802" />

---
***Administrative Templates: System	Remote Assistance: Configure Solicited Remote Assistance***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\policies\Microsoft\Windows NT\Terminal Services
RegistryItem:  fAllowToGetHelp
DefaultValue:      1
RecommendedValue:  0
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\policies\Microsoft\Windows NT\Terminal Services" -Name "fAllowToGetHelp" -Type DWord -Value 0
```
<img width="1148" height="600" alt="image" src="https://github.com/user-attachments/assets/a5ed4749-919b-4587-bf6f-834662fb2ab5" />

---
***Administrative Templates: System	Remote Procedure Call: Enable RPC Endpoint Mapper Client Authentication (Member)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows NT\Rpc
RegistryItem:  EnableAuthEpResolution
DefaultValue:      0
RecommendedValue:  1
```
```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows NT\Rpc" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows NT\Rpc" -Name "EnableAuthEpResolution" -Type DWord -Value 1
```
<img width="1144" height="603" alt="image" src="https://github.com/user-attachments/assets/a1e39b93-2eae-4723-b40c-5b4a2600e5c3" />

---
***Remote Procedure Call: Restrict Unauthenticated RPC clients (Member)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows NT\Rpc
RegistryItem:  RestrictRemoteClients
DefaultValue:      0
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows NT\Rpc" -Name "RestrictRemoteClients" -Type DWord -Value 1
```
<img width="1145" height="600" alt="image" src="https://github.com/user-attachments/assets/e64ef4f8-83cc-4a2f-b5b9-128026bc4194" />

---
***Administrative Templates: System	Security Account Manager: Configure validation of ROCA-vulnerable WHfB keys during authentication (DC only)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System\SAM
RegistryItem:  SamNGCKeyROCAValidation
DefaultValue:      -
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System\SAM" -Name "SamNGCKeyROCAValidation" -Type DWord -Value 1
```
<img width="1149" height="602" alt="image" src="https://github.com/user-attachments/assets/b6ff282f-fb77-44d6-ba87-e07e7aa61291" />

---
***Administrative Templates: System	Troubleshooting and Diagnostics: Microsoft Support Diagnostic Tool: Turn on MSDT interactive communication with support provider***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows\ScriptedDiagnosticsProvider\Policy
RegistryItem:  DisableQueryRemoteServer
DefaultValue:      1
RecommendedValue:  0
```
```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\ScriptedDiagnosticsProvider\Policy" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\ScriptedDiagnosticsProvider\Policy" -Name "DisableQueryRemoteServer" -Type DWord -Value 0
```
<img width="1146" height="599" alt="image" src="https://github.com/user-attachments/assets/a47a6d2c-0be0-4107-9721-600aed12b661" />

---
***Administrative Templates: System	Windows Performance PerfTrack: Enable/Disable PerfTrack***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows\WDI\{9c5a40da-b965-4fc3-8781-88dd50a6299d}
RegistryItem:  ScenarioExecutionEnabled
DefaultValue:      1
RecommendedValue:  0
```
```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WDI\{9c5a40da-b965-4fc3-8781-88dd50a6299d}" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WDI\{9c5a40da-b965-4fc3-8781-88dd50a6299d}" -Name "ScenarioExecutionEnabled" -Type DWord -Value 0
```
<img width="1148" height="601" alt="image" src="https://github.com/user-attachments/assets/2a27ef14-f3fa-45f4-bf73-4a22521ae314" />

---
***Administrative Templates: System	User Profiles: Turn off the advertising ID***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo
RegistryItem:  DisabledByGroupPolicy
DefaultValue:      0
RecommendedValue:  1
```
```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" -Name "DisabledByGroupPolicy" -Type DWord -Value 1
```
<img width="1144" height="600" alt="image" src="https://github.com/user-attachments/assets/63ae3344-0ed0-4ae7-9b80-8c82ab3f6534" />

---
***Administrative Templates: System	Time Providers: Enable Windows NTP Client***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\W32time\TimeProviders\NtpClient
RegistryItem:  Enabled
DefaultValue:      0
RecommendedValue:  1
```
```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\W32time\TimeProviders\NtpClient" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\W32time\TimeProviders\NtpClient" -Name "Enabled" -Type DWord -Value 1
```
<img width="1144" height="608" alt="image" src="https://github.com/user-attachments/assets/67efd719-0b6b-46de-bd62-e53a3ff4ba63" />

---
***Administrative Templates: System	Time Providers: Enable Windows NTP Server (Member)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\W32time\TimeProviders\NtpServer
RegistryItem:  Enabled
DefaultValue:      0
RecommendedValue:  0
```
```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\W32time\TimeProviders\NtpServer" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\W32time\TimeProviders\NtpServer" -Name "Enabled" -Type DWord -Value 0
```
<img width="1149" height="605" alt="image" src="https://github.com/user-attachments/assets/52350620-7883-45a2-8951-b3247915de6a" />

---
***Administrative Templates: Windows Components: App Package Deployment: Allow a Windows app to share application data between users***
```
Windows Server 2022 21H2

RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\AppModel\StateManager  
RegistryItem:  AllowSharedLocalAppData  
DefaultValue:  1
RecommendedValue:  0  
```
```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\AppModel\StateManager" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\AppModel\StateManager" -Name "AllowSharedLocalAppData" -Type DWord -Value 0
```
<img width="1147" height="602" alt="image" src="https://github.com/user-attachments/assets/dc13e457-bf8e-44d0-88f3-a2f89a5790b8" />

---
***Administrative Templates: Windows Components: App runtime: Allow Microsoft accounts to be optional***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System  
RegistryItem:  MSAOptional  
DefaultValue:  0  
RecommendedValue:  1  
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "MSAOptional" -Type DWord -Value 1
```
<img width="1131" height="599" alt="image" src="https://github.com/user-attachments/assets/87cd0dd1-b597-4788-b019-960af85f1f26" />

---
***Administrative Templates: Windows Components: AutoPlay Policies: Disallow Autoplay for non-volume devices***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\Explorer  
RegistryItem:  NoAutoplayfornonVolume  
DefaultValue:  0  
RecommendedValue:  1  
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\Explorer" -Name "NoAutoplayfornonVolume" -Type DWord -Value 1
```
<img width="1147" height="599" alt="image" src="https://github.com/user-attachments/assets/8cc459d6-4126-469f-934a-c59658bbda87" />

---
***Administrative Templates: Windows Components: AutoPlay Policies: Set the default behavior for AutoRun***
```
Windows Server 2022 21H2

RegistryPath:  HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer  
RegistryItem:  NoAutorun  
DefaultValue:  0  
RecommendedValue:  1  
```
```ps1
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "NoAutorun" -Type DWord -Value 1
```
<img width="1145" height="600" alt="image" src="https://github.com/user-attachments/assets/23b614ab-a5b6-40cc-8f52-a46dbdb2ac85" />

---
***Administrative Templates: Windows Components: AutoPlay Policies: Turn off Autoplay***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer  
RegistryItem:  NoDriveTypeAutoRun  
DefaultValue:  0  
RecommendedValue:  255  
```
```ps1
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "NoDriveTypeAutoRun" -Type DWord -Value 255
```
<img width="1148" height="597" alt="image" src="https://github.com/user-attachments/assets/9c247785-c448-49fc-89c4-82268cb2cfba" />

---
***Administrative Templates: Windows Components: Biometrics: Facial Features: Configure enhanced anti-spoofing***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Biometrics\FacialFeatures  
RegistryItem:  EnhancedAntiSpoofing  
RecommendedValue:  1  
```
```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Biometrics\FacialFeatures" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Biometrics\FacialFeatures" -Name "EnhancedAntiSpoofing" -Type DWord -Value 1
```
<img width="1148" height="603" alt="image" src="https://github.com/user-attachments/assets/762e4feb-f90e-4fe4-8548-237320f35d6b" />

---
***Administrative Templates: Windows Components: Camera: Allow Use of Camera***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Camera  
RegistryItem:  AllowCamera  
DefaultValue:  1  
RecommendedValue:  0  
```
```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Camera" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Camera" -Name "AllowCamera" -Type DWord -Value 0
```
<img width="1150" height="602" alt="image" src="https://github.com/user-attachments/assets/d4f49876-f583-4df5-aa1d-809a35b27386" />

---
***Administrative Templates: Windows Components: Cloud Content: Turn off cloud consumer account state content***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\CloudContent  
RegistryItem:  DisableConsumerAccountStateContent  
RecommendedValue:  1  
```
```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CloudContent" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\CloudContent" -Name "DisableConsumerAccountStateContent" -Type DWord -Value 1
```
<img width="1147" height="604" alt="image" src="https://github.com/user-attachments/assets/bfb687ca-6b75-4145-8a5e-b95ffcc850cd" />

---
***Administrative Templates: Windows Components: Cloud Content: Turn off Microsoft consumer experiences***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\CloudContent  
RegistryItem:  DisableWindowsConsumerFeatures  
DefaultValue:  0  
RecommendedValue:  1  
```
```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CloudContent" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\CloudContent" -Name "DisableWindowsConsumerFeatures" -Type DWord -Value 1
```
<img width="1146" height="599" alt="image" src="https://github.com/user-attachments/assets/a9c86eec-f925-4d7e-9e48-1430dae7177c" />

---
***Administrative Templates: Windows Components: Connect: Require pin for pairing***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows\Connect  
RegistryItem:  RequirePinForPairing  
DefaultValue:  0  
RecommendedValue:  1  
```
```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Connect" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Connect" -Name "RequirePinForPairing" -Type DWord -Value 1
```
<img width="1145" height="605" alt="image" src="https://github.com/user-attachments/assets/d60b92a2-eff3-4ced-9324-ca81ed0ba7eb" />

---
***Administrative Templates: Windows Components: Credential User Interface: Do not display the password reveal button***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\CredUI  
RegistryItem:  DisablePasswordReveal  
DefaultValue:  0  
RecommendedValue:  1  
```
```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CredUI" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\CredUI" -Name "DisablePasswordReveal" -Type DWord -Value 1
```
<img width="1148" height="602" alt="image" src="https://github.com/user-attachments/assets/1310758f-1967-4504-835f-d641443c4dfd" />

---
***Administrative Templates: Windows Components: Credential User Interface: Enumerate administrator accounts on elevation***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\CredUI  
RegistryItem:  EnumerateAdministrators  
DefaultValue:  1  
RecommendedValue:  0  
```
```ps1
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\CredUI" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\CredUI" -Name "EnumerateAdministrators" -Type DWord -Value 0
```
<img width="1144" height="598" alt="image" src="https://github.com/user-attachments/assets/bc78a978-dd4b-40dc-afab-aee9302e8052" />

---
***Administrative Templates: Windows Components: Data Collection and Preview Builds: Allow Diagnostic Data***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\DataCollection  
RegistryItem:  AllowTelemetry  
DefaultValue:  2  
RecommendedValue:  1  
```
```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\DataCollection" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Type DWord -Value 1
```
<img width="1144" height="596" alt="image" src="https://github.com/user-attachments/assets/5bec3373-6049-4b1c-bffe-5ad6f4ae0ff1" />

---
***Administrative Templates: Windows Components: Data Collection and Preview Builds: Configure Authenticated Proxy usage for the Connected User Experience and Telemetry service***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\DataCollection  
RegistryItem:  DisableEnterpriseAuthProxy  
DefaultValue:  0  
RecommendedValue:  1  
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\DataCollection" -Name "DisableEnterpriseAuthProxy" -Type DWord -Value 1
```
<img width="1147" height="598" alt="image" src="https://github.com/user-attachments/assets/5571be4f-988a-4b3b-b4cf-88d6adb83136" />

---
***Administrative Templates: Windows Components: Data Collection and Preview Builds: Disable OneSettings Downloads***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\DataCollection  
RegistryItem:  DisableOneSettingsDownloads  
RecommendedValue:  1  
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\DataCollection" -Name "DisableOneSettingsDownloads" -Type DWord -Value 1
```
<img width="1143" height="602" alt="image" src="https://github.com/user-attachments/assets/159fb167-e4f3-4d92-85ba-d755a3ca18c5" />

---
***Administrative Templates: Windows Components: Data Collection and Preview Builds: Do not show feedback notifications***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\DataCollection  
RegistryItem:  DoNotShowFeedbackNotifications  
DefaultValue:  0  
RecommendedValue:  1  
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\DataCollection" -Name "DoNotShowFeedbackNotifications" -Type DWord -Value 1
```
<img width="1141" height="598" alt="image" src="https://github.com/user-attachments/assets/9440e29d-0305-4610-bc4d-c5fe80d332e9" />

---
***Administrative Templates: Windows Components: Data Collection and Preview Builds: Enable OneSettings Auditing***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\DataCollection  
RegistryItem:  EnableOneSettingsAuditing  
RecommendedValue:  1  
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\DataCollection" -Name "EnableOneSettingsAuditing" -Type DWord -Value 1
```
<img width="1145" height="595" alt="image" src="https://github.com/user-attachments/assets/0e039471-7ad7-4941-80d3-02aca07c6078" />

---
***Administrative Templates: Windows Components: Data Collection and Preview Builds: Limit Diagnostic Log Collection***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\DataCollection  
RegistryItem:  LimitDiagnosticLogCollection  
RecommendedValue:  1  
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\DataCollection" -Name "LimitDiagnosticLogCollection" -Type DWord -Value 1
```
<img width="1143" height="599" alt="image" src="https://github.com/user-attachments/assets/7ae07afa-44ad-4252-a5e1-7ec80e6eb586" />

---
***Administrative Templates: Windows Components: Data Collection and Preview Builds: Limit Dump Collection***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\DataCollection  
RegistryItem:  LimitDumpCollection  
RecommendedValue:  1  
```
```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\DataCollection" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\DataCollection" -Name "LimitDumpCollection" -Type DWord -Value 1
```
<img width="1140" height="599" alt="image" src="https://github.com/user-attachments/assets/501fa0db-2656-4beb-969e-3dd9cfc9421d" />

---
***Administrative Templates: Windows Components: Data Collection and Preview Builds: Toggle user control over Insider builds***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds  
RegistryItem:  AllowBuildPreview  
DefaultValue:  1  
RecommendedValue:  0  
```
```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds" -Name "AllowBuildPreview" -Type DWord -Value 0
```
<img width="1141" height="603" alt="image" src="https://github.com/user-attachments/assets/7c5cb5c2-06d2-48d9-ba5c-4c565f343d56" />

---
***Administrative Templates: Windows Components: Event Log Service: Application: Control Event Log behavior when the log file reaches its maximum size***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\EventLog\Application  
RegistryItem:  Retention  
DefaultValue:  0  
RecommendedValue:  0  
```
```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\EventLog\Application" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\EventLog\Application" -Name "Retention" -Type DWord -Value 0
```
<img width="1150" height="593" alt="image" src="https://github.com/user-attachments/assets/130fc062-0c6b-498a-9de1-2c51d056faa0" />

---
***Administrative Templates: Windows Components: Event Log Service: Application: Specify the maximum log file size (KB)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\EventLog\Application  
RegistryItem:  MaxSize  
DefaultValue:  4096  
RecommendedValue:  32768  
```
```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\EventLog\Application" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\EventLog\Application" -Name "MaxSize" -Type DWord -Value 32768
```
<img width="1143" height="601" alt="image" src="https://github.com/user-attachments/assets/e9fa40fe-f14c-48d1-a4d5-27f50b8033de" />

---
***Administrative Templates: Windows Components: Event Log Service: Security: Control Event Log behavior when the log file reaches its maximum size***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\EventLog\Security  
RegistryItem:  Retention  
DefaultValue:  0  
RecommendedValue:  0  
```
```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\EventLog\Security" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\EventLog\Security" -Name "Retention" -Type DWord -Value 0
```
<img width="1145" height="600" alt="image" src="https://github.com/user-attachments/assets/87e8b014-89f2-495a-b9bb-5bad8af143ae" />

---
***Administrative Templates: Windows Components: Event Log Service: Security: Specify the maximum log file size (KB)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\EventLog\Security  
RegistryItem:  MaxSize  
DefaultValue:  4096  
RecommendedValue:  196608  
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\EventLog\Security" -Name "MaxSize" -Type DWord -Value 196608
```
<img width="1144" height="598" alt="image" src="https://github.com/user-attachments/assets/be117d3c-f8e4-4c79-84c2-5feb10256dff" />

---
***Administrative Templates: Windows Components: Event Log Service: Setup: Control Event Log behavior when the log file reaches its maximum size***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\EventLog\Setup  
RegistryItem:  Retention  
DefaultValue:  0  
RecommendedValue:  0  
```
```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\EventLog\Setup" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\EventLog\Setup" -Name "Retention" -Type DWord -Value 0
```
<img width="1144" height="604" alt="image" src="https://github.com/user-attachments/assets/f261030a-1056-47e0-8e87-c524f0d198db" />

---
***Administrative Templates: Windows Components: Event Log Service: Setup: Specify the maximum log file size (KB)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\EventLog\Setup  
RegistryItem:  MaxSize  
DefaultValue:  4096  
RecommendedValue:  32768  
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\EventLog\Setup" -Name "MaxSize" -Type DWord -Value 32768
```
<img width="1141" height="598" alt="image" src="https://github.com/user-attachments/assets/181a192f-2a04-4e54-8e80-af885808d3ee" />

---
***Administrative Templates: Windows Components: Event Log Service: System: Control Event Log behavior when the log file reaches its maximum size***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\EventLog\System  
RegistryItem:  Retention  
DefaultValue:  0  
RecommendedValue:  0  
```
```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\EventLog\System" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\EventLog\System" -Name "Retention" -Type DWord -Value 0
```
<img width="1140" height="602" alt="image" src="https://github.com/user-attachments/assets/f99d518f-02e0-4465-ad39-c0097c4f6c56" />

---
***Administrative Templates: Windows Components: Event Log Service: System: Specify the maximum log file size (KB)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\EventLog\System  
RegistryItem:  MaxSize  
DefaultValue:  4096  
RecommendedValue:  32768  
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\EventLog\System" -Name "MaxSize" -Type DWord -Value 32768
```
<img width="1143" height="600" alt="image" src="https://github.com/user-attachments/assets/9f978c3c-0085-46f0-8360-989a3c68f2f5" />

---
***Administrative Templates: Windows Components: File Explorer: Turn off Data Execution Prevention for Explorer***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer  
RegistryItem:  NoDataExecutionPrevention  
DefaultValue:  0  
RecommendedValue:  0  
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer" -Name "NoDataExecutionPrevention" -Type DWord -Value 0
```
<img width="1145" height="599" alt="image" src="https://github.com/user-attachments/assets/2331c969-1105-4f2c-a0c2-82c8ec8ddec9" />

---
***Administrative Templates: Windows Components: File Explorer: Turn off heap termination on corruption***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer  
RegistryItem:  NoHeapTerminationOnCorruption  
DefaultValue:  0  
RecommendedValue:  0  
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer" -Name "NoHeapTerminationOnCorruption" -Type DWord -Value 0
```
<img width="1142" height="601" alt="image" src="https://github.com/user-attachments/assets/7652c642-3ae8-4271-ba6c-a5e2195ae5ca" />

---
***Administrative Templates: Windows Components: File Explorer: Turn off shell protocol protected mode***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer  
RegistryItem:  PreXPSP2ShellProtocolBehavior  
DefaultValue:  0  
RecommendedValue:  0  
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "PreXPSP2ShellProtocolBehavior" -Type DWord -Value 0
```
<img width="1142" height="598" alt="image" src="https://github.com/user-attachments/assets/9c3113de-e666-4777-9dfa-a968756aeadd" />

---
***Administrative Templates: Windows Components: Location and Sensors: Turn off location***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors  
RegistryItem:  DisableLocation  
DefaultValue:  0  
RecommendedValue:  1  
```
```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" -Name "DisableLocation" -Type DWord -Value 1
```
<img width="1146" height="602" alt="image" src="https://github.com/user-attachments/assets/6f34f975-b2d1-4155-8813-4f2d06b98e3a" />

---
***Administrative Templates: Windows Components: Messaging: Allow Message Service Cloud Sync***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows\Messaging  
RegistryItem:  AllowMessageSync  
DefaultValue:  1  
RecommendedValue:  0  
```
```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Messaging" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Messaging" -Name "AllowMessageSync" -Type DWord -Value 0
```
<img width="1145" height="599" alt="image" src="https://github.com/user-attachments/assets/e209c243-7e81-43bb-82c2-a5bad8a0dc1f" />

---
***Administrative Templates: Windows Components: Microsoft account: Block all consumer Microsoft account user authentication***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftAccount  
RegistryItem:  DisableUserAuth  
RecommendedValue:  1  
```
```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftAccount" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftAccount" -Name "DisableUserAuth" -Type DWord -Value 1
```
<img width="1144" height="600" alt="image" src="https://github.com/user-attachments/assets/a942c0f2-458a-46df-b614-1f2cff619880" />

---
***Administrative Templates: Windows Components: OneDrive: Prevent the usage of OneDrive for file storage***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\OneDrive  
RegistryItem:  DisableFileSyncNGSC  
DefaultValue:  0  
RecommendedValue:  1  
```
```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\OneDrive" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\OneDrive" -Name "DisableFileSyncNGSC" -Type DWord -Value 1
```
<img width="1144" height="597" alt="image" src="https://github.com/user-attachments/assets/3e4961ba-d58d-4f84-a121-181b8f55bbe5" />

---
***Administrative Templates: Windows Components: Push To Install: Turn off Push To Install service***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\PushToInstall  
RegistryItem:  DisablePushToInstall  
RecommendedValue:  1  
```
```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\PushToInstall" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\PushToInstall" -Name "DisablePushToInstall" -Type DWord -Value 1
```
<img width="1144" height="596" alt="image" src="https://github.com/user-attachments/assets/d806e5c4-d56b-4c94-a7b3-a3d327afe596" />

---
***Administrative Templates: Windows Components: Remote Desktop Connection Client: Do not allow passwords to be saved***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services  
RegistryItem:  DisablePasswordSaving  
DefaultValue:  0  
RecommendedValue:  1  
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name "DisablePasswordSaving" -Type DWord -Value 1
```
<img width="1143" height="595" alt="image" src="https://github.com/user-attachments/assets/433fc953-09a2-4d34-b015-7b530f65ac7c" />

---
***Administrative Templates: Windows Components: Remote Desktop Session Host: Connections: Restrict Remote Desktop Services users to a single Remote Desktop Services session***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services  
RegistryItem:  fSingleSessionPerUser  
DefaultValue:  1  
RecommendedValue:  1  
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name "fSingleSessionPerUser" -Type DWord -Value 1
```
<img width="1145" height="594" alt="image" src="https://github.com/user-attachments/assets/d47f61ea-39b5-4f36-9866-8b3a8efb3f7c" />

---
***Administrative Templates: Windows Components: Remote Desktop Session Host: Device and Resource Redirection: Allow UI Automation redirection***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services  
RegistryItem:  EnableUiaRedirection  
RecommendedValue:  0  
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name "EnableUiaRedirection" -Type DWord -Value 0
```
<img width="1148" height="604" alt="image" src="https://github.com/user-attachments/assets/9295bb90-f636-4874-a18b-13aa533d4b49" />

---
***Administrative Templates: Windows Components: Remote Desktop Session Host: Device and Resource Redirection: Do not allow COM port redirection***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services  
RegistryItem:  fDisableCcm  
DefaultValue:  0  
RecommendedValue:  1  
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name "fDisableCcm" -Type DWord -Value 1
```
<img width="1142" height="597" alt="image" src="https://github.com/user-attachments/assets/c2b335eb-426f-4972-8992-2c8362533713" />

---
***Administrative Templates: Windows Components: Remote Desktop Session Host: Device and Resource Redirection: Do not allow drive redirection***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services  
RegistryItem:  fDisableCdm  
DefaultValue:  0  
RecommendedValue:  1  
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name "fDisableCdm" -Type DWord -Value 1
```
<img width="1145" height="595" alt="image" src="https://github.com/user-attachments/assets/54731450-bf5d-4038-a3e4-1fc2fca7f5bb" />

---
***Administrative Templates: Windows Components: Remote Desktop Session Host: Device and Resource Redirection: Do not allow location redirection***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services  
RegistryItem:  fDisableLocationRedir  
RecommendedValue:  1  
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name "fDisableLocationRedir" -Type DWord -Value 1
```
<img width="1144" height="601" alt="image" src="https://github.com/user-attachments/assets/5484d8e6-8a80-4f5f-9591-ff09a91200d8" />

---
***Administrative Templates: Windows Components: Remote Desktop Session Host: Device and Resource Redirection: Do not allow LPT port redirection***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services  
RegistryItem:  fDisableLPT  
DefaultValue:  0  
RecommendedValue:  1  
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name "fDisableLPT" -Type DWord -Value 1
```
<img width="1138" height="597" alt="image" src="https://github.com/user-attachments/assets/a488b020-25af-46b3-bd96-699c7cf2e1a9" />

---
***Administrative Templates: Windows Components: Remote Desktop Session Host: Device and Resource Redirection: Do not allow supported Plug and Play device redirection***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services  
RegistryItem:  fDisablePNPRedir  
DefaultValue:  0  
RecommendedValue:  1  
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name "fDisablePNPRedir" -Type DWord -Value 1
```
<img width="1145" height="601" alt="image" src="https://github.com/user-attachments/assets/4ec3d345-de18-4580-8a10-0698a19e7bb0" />

---
***Administrative Templates: Windows Components: Remote Desktop Session Host: Security: Always prompt for password upon connection***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services  
RegistryItem:  fPromptForPassword  
DefaultValue:  0  
RecommendedValue:  1  
```
```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name "fPromptForPassword" -Type DWord -Value 1
```
<img width="1147" height="599" alt="image" src="https://github.com/user-attachments/assets/ee68bc71-a7a1-445d-8d6a-659299fe62b1" />

---
***Administrative Templates: Windows Components: Remote Desktop Session Host: Security: Require secure RPC communication***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services  
RegistryItem:  fEncryptRPCTraffic  
DefaultValue:  0  
RecommendedValue:  1  
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name "fEncryptRPCTraffic" -Type DWord -Value 1
```
<img width="1139" height="596" alt="image" src="https://github.com/user-attachments/assets/a87ad772-a08b-4ddb-a762-531c81181465" />

---
***Administrative Templates: Windows Components: Remote Desktop Session Host: Security: Require use of specific security layer for remote (RDP) connections***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services  
RegistryItem:  SecurityLayer  
DefaultValue:  0  
RecommendedValue:  2  
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name "SecurityLayer" -Type DWord -Value 2
```
<img width="1145" height="597" alt="image" src="https://github.com/user-attachments/assets/e8710722-a54a-4573-ba7f-ed96b54dffff" />

---
***Administrative Templates: Windows Components: Remote Desktop Session Host: Security: Require user authentication for remote connections by using Network Level Authentication***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services  
RegistryItem:  UserAuthentication  
DefaultValue:  0  
RecommendedValue:  1  
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name "UserAuthentication" -Type DWord -Value 1
```
<img width="1143" height="597" alt="image" src="https://github.com/user-attachments/assets/e65a6a2d-8274-4fed-b0cd-c234ceb21332" />

---
***Administrative Templates: Windows Components: Remote Desktop Session Host: Security: Set client connection encryption level***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services  
RegistryItem:  MinEncryptionLevel  
DefaultValue:  0  
RecommendedValue:  3  
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name "MinEncryptionLevel" -Type DWord -Value 3
```
<img width="1141" height="599" alt="image" src="https://github.com/user-attachments/assets/e654893b-d1d7-4355-994c-1893d01fa5fa" />

---
***Administrative Templates: Windows Components: Remote Desktop Session Host: Session Time Limits: Set time limit for active but idle Remote Desktop Services sessions***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services  
RegistryItem:  MaxIdleTime  
DefaultValue:  0  
RecommendedValue:  900000  
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name "MaxIdleTime" -Type DWord -Value 900000
```
<img width="1143" height="601" alt="image" src="https://github.com/user-attachments/assets/5892bbd7-cbce-4505-bf72-5fe6a8071006" />

---
***Administrative Templates: Windows Components: Remote Desktop Session Host: Session Time Limits: Set time limit for disconnected sessions***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services  
RegistryItem:  MaxDisconnectionTime  
DefaultValue:  0  
RecommendedValue:  60000  
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name "MaxDisconnectionTime" -Type DWord -Value 60000
```
<img width="1145" height="598" alt="image" src="https://github.com/user-attachments/assets/7ab666ae-6370-4f1b-8efe-0a3804a1707d" />

---
***Administrative Templates: Windows Components: Remote Desktop Session Host: Temporary folders: Do not delete temp folders upon exit***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services  
RegistryItem:  DeleteTempDirsOnExit  
DefaultValue:  1  
RecommendedValue:  1  
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name "DeleteTempDirsOnExit" -Type DWord -Value 1
```
<img width="1138" height="607" alt="image" src="https://github.com/user-attachments/assets/e9f9eece-25c8-410d-a801-ca89d73e0576" />

---
***Administrative Templates: Windows Components: Remote Desktop Session Host: Temporary folders: Do not use temporary folders per session***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services  
RegistryItem:  PerSessionTempDir  
DefaultValue:  1  
RecommendedValue:  1  
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name "PerSessionTempDir" -Type DWord -Value 1
```
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name "PerSessionTempDir" -Type DWord -Value 1

---
***Administrative Templates: Windows Components: RSS Feeds: Prevent downloading of enclosures***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Internet Explorer\Feeds  
RegistryItem:  DisableEnclosureDownload  
DefaultValue:  0  
RecommendedValue:  1  
```
```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Feeds" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Feeds" -Name "DisableEnclosureDownload" -Type DWord -Value 1
```
<img width="1145" height="600" alt="image" src="https://github.com/user-attachments/assets/974c6d50-9411-4030-9444-84e762752e02" />

---
***Administrative Templates: Windows Components: Search: Allow Cloud Search***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search  
RegistryItem:  AllowCloudSearch  
DefaultValue:  1  
RecommendedValue:  0  
```
```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "AllowCloudSearch" -Type DWord -Value 0
```
<img width="1145" height="599" alt="image" src="https://github.com/user-attachments/assets/b8428490-b279-474a-be39-746d51cc97f8" />

---
***Administrative Templates: Windows Components: Search: Allow indexing of encrypted files***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search  
RegistryItem:  AllowIndexingEncryptedStoresOrItems  
DefaultValue:  1  
RecommendedValue:  0  
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "AllowIndexingEncryptedStoresOrItems" -Type DWord -Value 0
```
<img width="1142" height="601" alt="image" src="https://github.com/user-attachments/assets/8a390c01-7ac7-4f4e-ad85-00f77b3d12ec" />

---
***Administrative Templates: Windows Components: Software Protection Platform: Turn off KMS Client Online AVS Validation***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform  
RegistryItem:  NoGenTicket  
DefaultValue:  0  
RecommendedValue:  1  
```
```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform" -Name "NoGenTicket" -Type DWord -Value 1
```
<img width="1146" height="599" alt="image" src="https://github.com/user-attachments/assets/838e9ddd-b26b-42af-83ff-68ef1d735b0e" />

---
***Administrative Templates: Windows Components: File Explorer: Configure Windows Defender SmartScreen***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows\System  
RegistryItem:  EnableSmartScreen  
DefaultValue:  1  
RecommendedValue:  1  
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "EnableSmartScreen" -Type DWord -Value 1
```
<img width="1145" height="604" alt="image" src="https://github.com/user-attachments/assets/05865412-283a-4f96-ad6e-47f41abe3a0b" />

---
***Administrative Templates: Windows Components: File Explorer: Configure Windows Defender SmartScreen to warn and prevent bypass***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows\System  
RegistryItem:  ShellSmartScreenLevel  
DefaultValue:  Warn  
RecommendedValue:  Block  
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "ShellSmartScreenLevel" -Type String -Value "Block"
```
<img width="1143" height="599" alt="image" src="https://github.com/user-attachments/assets/4ec00025-cfe2-4094-9781-c3ab58663de1" />

---
***Administrative Templates: Windows Components: Windows Ink Workspace: Allow suggested apps in Windows Ink Workspace***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\WindowsInkWorkspace  
RegistryItem:  AllowSuggestedAppsInWindowsInkWorkspace  
DefaultValue:  1  
RecommendedValue:  0  
```
```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\WindowsInkWorkspace" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\WindowsInkWorkspace" -Name "AllowSuggestedAppsInWindowsInkWorkspace" -Type DWord -Value 0
```
<img width="1142" height="599" alt="image" src="https://github.com/user-attachments/assets/270feb6f-3c63-413e-8e72-696de345ee6a" />

---
***Administrative Templates: Windows Components: Windows Ink Workspace: Allow Windows Ink Workspace***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\WindowsInkWorkspace  
RegistryItem:  AllowWindowsInkWorkspace  
DefaultValue:  1  
RecommendedValue:  1  
```
```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\WindowsInkWorkspace" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\WindowsInkWorkspace" -Name "AllowWindowsInkWorkspace" -Type DWord -Value 1
```
<img width="1146" height="602" alt="image" src="https://github.com/user-attachments/assets/df634cd4-e43d-495a-ba88-70e00e48ec9d" />

---
***Administrative Templates: Windows Components: Windows Installer: Allow user control over installs***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\Installer  
RegistryItem:  EnableUserControl  
DefaultValue:  1  
RecommendedValue:  0  
```
```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\Installer" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\Installer" -Name "EnableUserControl" -Type DWord -Value 0
```
<img width="1145" height="600" alt="image" src="https://github.com/user-attachments/assets/aa7c0f7c-1310-42ef-9ffa-46b9efec7d18" />

---
***Administrative Templates: Windows Components: Windows Installer: Always install with elevated privileges***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\Installer  
RegistryItem:  AlwaysInstallElevated  
DefaultValue:  0  
RecommendedValue:  0  
```
```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\Installer" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\Installer" -Name "AlwaysInstallElevated" -Type DWord -Value 0
```
<img width="1142" height="598" alt="image" src="https://github.com/user-attachments/assets/a427f381-d535-4e79-84dc-60df98d3cbc1" />

---
***Administrative Templates: Windows Components: Windows Installer: Prevent Internet Explorer security prompt for Windows Installer scripts***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\Installer  
RegistryItem:  SafeForScripting  
DefaultValue:  1  
RecommendedValue:  0  
```
```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\Installer" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\Installer" -Name "SafeForScripting" -Type DWord -Value 0
```
<img width="1146" height="600" alt="image" src="https://github.com/user-attachments/assets/99ea0cc8-de9d-419f-b653-112822aa5dc0" />

---
***Administrative Templates: Windows Components: Windows Logon Options: Sign-in and lock last interactive user automatically after a restart***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System  
RegistryItem:  DisableAutomaticRestartSignOn  
DefaultValue:  0  
RecommendedValue:  1  
```
```ps1
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "DisableAutomaticRestartSignOn" -Type DWord -Value 1
```
<img width="1124" height="598" alt="image" src="https://github.com/user-attachments/assets/beb2153d-5c71-4613-bff4-fb4ad202c817" />

---
***Administrative Templates: Windows Components: WinRM Client: Allow Basic authentication***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\WinRM\Client  
RegistryItem:  AllowBasic  
DefaultValue:  1  
RecommendedValue:  0  
```
```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Client" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Client" -Name "AllowBasic" -Type DWord -Value 0
```
<img width="1144" height="598" alt="image" src="https://github.com/user-attachments/assets/0623d519-0614-462d-b4f7-197966ab560e" />

---
***Administrative Templates: Windows Components: WinRM Client: Allow unencrypted traffic***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\WinRM\Client  
RegistryItem:  AllowUnencryptedTraffic  
DefaultValue:  1  
RecommendedValue:  0  
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Client" -Name "AllowUnencryptedTraffic" -Type DWord -Value 0
```
<img width="1144" height="601" alt="image" src="https://github.com/user-attachments/assets/c3fca726-c9c1-4c86-aac7-b7d022b85b76" />

---
***Administrative Templates: Windows Components: WinRM Client: Disallow Digest authentication***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\WinRM\Client  
RegistryItem:  AllowDigest  
DefaultValue:  1  
RecommendedValue:  0  
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Client" -Name "AllowDigest" -Type DWord -Value 0
```
<img width="1146" height="599" alt="image" src="https://github.com/user-attachments/assets/485c7a09-b29a-4e85-9ab1-7f748ae0ed24" />

---
***Administrative Templates: Windows Components: WinRM Service: Allow Basic authentication***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\WinRM\Service  
RegistryItem:  AllowBasic  
DefaultValue:  1  
RecommendedValue:  0  
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Service" -Name "AllowBasic" -Type DWord -Value 0
```
<img width="1144" height="601" alt="image" src="https://github.com/user-attachments/assets/54a4c518-e2f4-4578-98b6-85a08b0eff02" />

---
***Administrative Templates: Windows Components: WinRM Service: Allow remote server management through WinRM***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\WinRM\Service  
RegistryItem:  AllowAutoConfig  
DefaultValue:  1  
RecommendedValue:  0  
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Service" -Name "AllowAutoConfig" -Type DWord -Value 0
```
<img width="1142" height="598" alt="image" src="https://github.com/user-attachments/assets/0922f5ba-0655-4065-a5a2-38c8f9a2bb57" />

---
***Administrative Templates: Windows Components: WinRM Service: Allow unencrypted traffic***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\WinRM\Service  
RegistryItem:  AllowUnencryptedTraffic  
DefaultValue:  1  
RecommendedValue:  0  
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Service" -Name "AllowUnencryptedTraffic" -Type DWord -Value 0
```
<img width="1143" height="597" alt="image" src="https://github.com/user-attachments/assets/376051cb-46f0-4b1d-9d50-a8592b8edec0" />

---
***Administrative Templates: Windows Components: WinRM Service: Disallow WinRM from storing RunAs credentials***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\WinRM\Service  
RegistryItem:  DisableRunAs  
DefaultValue:  0  
RecommendedValue:  1  
```
```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Service" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Service" -Name "DisableRunAs" -Type DWord -Value 1
```
<img width="1148" height="600" alt="image" src="https://github.com/user-attachments/assets/f2fe57d7-f401-4b13-866b-cdc3a8975d53" />

---
***Administrative Templates: Windows Components: Windows Remote Shell: Allow Remote Shell Access***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\WinRM\Service\WinRS  
RegistryItem:  AllowRemoteShellAccess  
DefaultValue:  1  
RecommendedValue:  0  
```
```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Service\WinRS" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Service\WinRS" -Name "AllowRemoteShellAccess" -Type DWord -Value 0
```
<img width="1144" height="597" alt="image" src="https://github.com/user-attachments/assets/4ec19be4-dce2-4cf5-a71d-9965f04c3cae" />

---
***Administrative Templates: Windows Components: App and browser protection: Prevent users from modifying settings***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\App and Browser protection  
RegistryItem:  DisallowExploitProtectionOverride  
RecommendedValue:  1  
```
```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\App and Browser protection" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\App and Browser protection" -Name "DisallowExploitProtectionOverride" -Type DWord -Value 1
```
<img width="1146" height="597" alt="image" src="https://github.com/user-attachments/assets/f7252d19-415e-420c-ad57-e9361a9f9216" />

---
***Administrative Templates: Windows Components: Windows Update: Legacy Policies: No auto-restart with logged on users for scheduled automatic updates installations***
```
Windows Server 2022 21H2

RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU  
RegistryItem:  NoAutoRebootWithLoggedOnUsers  
DefaultValue:  0  
RecommendedValue:  0  
```
```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "NoAutoRebootWithLoggedOnUsers" -Type DWord -Value 0
```
<img width="1143" height="600" alt="image" src="https://github.com/user-attachments/assets/e0ec8686-96a2-479a-90d7-eab23964a173" />

---
***Administrative Templates: Windows Components: Windows Update: Manage end user experience: Configure Automatic Updates***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU  
RegistryItem:  NoAutoUpdate  
DefaultValue:  0  
RecommendedValue:  0  
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "NoAutoUpdate" -Type DWord -Value 0
```
<img width="1146" height="597" alt="image" src="https://github.com/user-attachments/assets/9958e3d5-7465-4d57-94d9-7735ad6c0d3b" />

---
***Administrative Templates: Windows Components: Windows Update: Manage end user experience: Configure Automatic Updates: Scheduled install day***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU  
RegistryItem:  ScheduledInstallDay  
RecommendedValue:  0  
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "ScheduledInstallDay" -Type DWord -Value 0
```
<img width="1144" height="598" alt="image" src="https://github.com/user-attachments/assets/d8b3128b-bda0-43b5-b653-4f1d696f8c6b" />

---
***Administrative Templates: Windows Components: Windows Update: Manage updates offered from Windows Update: Manage preview builds (ManagePreviewBuilds)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate  
RegistryItem:  ManagePreviewBuilds  
RecommendedValue:  1  
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Name "ManagePreviewBuilds" -Type DWord -Value 1
```
<img width="1140" height="597" alt="image" src="https://github.com/user-attachments/assets/7f0cbc15-ad62-4665-8d93-6fa21c3eff30" />

---
***Administrative Templates: Windows Components: Windows Update: Manage updates offered from Windows Update: Manage preview builds (ManagePreviewBuildsPolicyValue)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate  
RegistryItem:  ManagePreviewBuildsPolicyValue  
RecommendedValue:  0  
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Name "ManagePreviewBuildsPolicyValue" -Type DWord -Value 0
```
<img width="1142" height="599" alt="image" src="https://github.com/user-attachments/assets/0ff518c6-e520-498b-a283-4ee2d8c7b567" />

---
***Administrative Templates: Windows Components: Windows Update: Manage updates offered from Windows Update: Select when Preview Builds and Feature Updates are received (DeferFeatureUpdates)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate  
RegistryItem:  DeferFeatureUpdates  
RecommendedValue:  1  
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Name "DeferFeatureUpdates" -Type DWord -Value 1
```
<img width="1143" height="598" alt="image" src="https://github.com/user-attachments/assets/49bfec81-c49a-4c50-81ee-eba15d9849fb" />

---
***Administrative Templates: Windows Components: Windows Update: Manage updates offered from Windows Update: Select when Preview Builds and Feature Updates are received (BranchReadinessLevel)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate  
RegistryItem:  BranchReadinessLevel  
RecommendedValue:  2  
```
```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Name "BranchReadinessLevel" -Type DWord -Value 2
```
<img width="1142" height="597" alt="image" src="https://github.com/user-attachments/assets/f4bdd0a4-d19d-42ce-8fda-5b469ee66bc2" />

---
***Administrative Templates: Windows Components: Windows Update: Select when Preview Builds and Feature Updates are received (DeferFeatureUpdatesPeriodInDays)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate  
RegistryItem:  DeferFeatureUpdatesPeriodInDays  
RecommendedValue:  180  
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Name "DeferFeatureUpdatesPeriodInDays" -Type DWord -Value 180
```
<img width="1144" height="600" alt="image" src="https://github.com/user-attachments/assets/bba95fdb-e9c0-46e7-a5cb-75ea5177a6ce" />

---
***Administrative Templates: Windows Components: Windows Update: Manage updates offered from Windows Update: Select when Quality Updates are received (DeferQualityUpdates)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate  
RegistryItem:  DeferQualityUpdates  
RecommendedValue:  1  
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Name "DeferQualityUpdates" -Type DWord -Value 1
```
<img width="1144" height="597" alt="image" src="https://github.com/user-attachments/assets/9a1be40b-3755-47bc-a4c1-8f40ead56286" />

---
***Administrative Templates: Windows Components: Windows Update: Select when Quality Updates are received (DeferQualityUpdatesPeriodInDays)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate  
RegistryItem:  DeferQualityUpdatesPeriodInDays  
RecommendedValue:  0  
```
```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Name "DeferQualityUpdatesPeriodInDays" -Type DWord -Value 0
```
<img width="1142" height="600" alt="image" src="https://github.com/user-attachments/assets/e0877245-3172-4d29-9ab0-c14f93a2c962" />

---
***Administrative Templates: Network Windows Connect Now: Configuration of wireless settings using Windows Connect Now (DisableUPnPRegistrar)***
```
Windows Server 2022 21H2
RegistryPath:   HKLM:\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars
RegistryItem:   DisableUPnPRegistrar
DefaultValue:      1
RecommendedValue:  0
```

```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars" -Name "DisableUPnPRegistrar" -Type DWord -Value 0
```
<img width="1267" height="602" alt="image" src="https://github.com/user-attachments/assets/a7674e50-6579-4982-934b-f0b2c554c2a9" />

---
***Administrative Templates: Network Windows Connect Now: Configuration of wireless settings using Windows Connect Now (DisableInBand802DOT11Registrar)***
```
Windows Server 2022 21H2
RegistryPath:   HKLM:\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars
RegistryItem:   DisableInBand802DOT11Registrar
DefaultValue:      1
RecommendedValue:  0
```

```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars" -Name "DisableInBand802DOT11Registrar" -Type DWord -Value 0
```
<img width="1267" height="596" alt="image" src="https://github.com/user-attachments/assets/e489c091-34bd-480e-bcec-bfa6b091cf4b" />

---
***Administrative Templates: Network Windows Connect Now: Configuration of wireless settings using Windows Connect Now (DisableFlashConfigRegistrar)***
```
Windows Server 2022 21H2
RegistryPath:   HKLM:\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars
RegistryItem:   DisableFlashConfigRegistrar
DefaultValue:      1
RecommendedValue:  0
```

```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars" -Name "DisableFlashConfigRegistrar" -Type DWord -Value 0
```
<img width="1265" height="598" alt="image" src="https://github.com/user-attachments/assets/23ffd019-df4b-4978-950b-d7268678a781" />

---
***Administrative Templates: Network Windows Connect Now: Configuration of wireless settings using Windows Connect Now (DisableWPDRegistrar)***
```
Windows Server 2022 21H2
RegistryPath:   HKLM:\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars
RegistryItem:   DisableWPDRegistrar
DefaultValue:      1
RecommendedValue:  0
```

```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars" -Name "DisableWPDRegistrar" -Type DWord -Value 0
```
<img width="1267" height="600" alt="image" src="https://github.com/user-attachments/assets/82dbb393-e5a9-4cef-9db5-3d271ebf0f94" />

---
***Administrative Templates: Network Windows Connect Now: Prohibit access of the Windows Connect Now wizards***
```
Windows Server 2022 21H2
RegistryPath:   HKLM:\SOFTWARE\Policies\Microsoft\Windows\WCN\UI
RegistryItem:   DisableWcnUi
DefaultValue:      0
RecommendedValue:  1
```

```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WCN\UI" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WCN\UI" -Name "DisableWcnUi" -Type DWord -Value 1
```
<img width="1264" height="600" alt="image" src="https://github.com/user-attachments/assets/46a6d618-884e-41d3-8042-8f25370a5e4e" />

---
***Administrative Templates: Network Windows Connection Manager: Minimize the number of simultaneous connections to the Internet or a Windows Domain***
```
Windows Server 2022 21H2
RegistryPath:   HKLM:\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\GroupPolicy
RegistryItem:   fMinimizeConnections
DefaultValue:      1
RecommendedValue:  3
```

```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\GroupPolicy" -Name "fMinimizeConnections" -Type DWord -Value 3
```
<img width="1264" height="593" alt="image" src="https://github.com/user-attachments/assets/977c2279-9c83-4dbd-a55b-e48066700d4c" />

---
***Administrative Templates: Network Windows Connection Manager: Prohibit connection to non-domain networks when connected to domain authenticated network***
```
Windows Server 2022 21H2
RegistryPath:   HKLM:\Software\Policies\Microsoft\Windows\WcmSvc\GroupPolicy
RegistryItem:   fBlockNonDomain
DefaultValue:      0
RecommendedValue:  1
```

```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\WcmSvc\GroupPolicy" -Name "fBlockNonDomain" -Type DWord -Value 1
```
<img width="1267" height="603" alt="image" src="https://github.com/user-attachments/assets/90caebb5-0ee6-4f6e-8ad8-a3266ac64188" />

-----------
***MSS (Legacy) MSS: (AutoAdminLogon) Enable Automatic Logon (not recommended)***
```
Windows Server 2022 21H2
RegistryPath:   HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon
RegistryItem:   AutoAdminLogon
DefaultValue:      0
RecommendedValue:  0
```

```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "AutoAdminLogon" -Type String -Value "0"
```
<img width="1249" height="594" alt="image" src="https://github.com/user-attachments/assets/01ca87dc-a289-4e28-a04e-eb8d213be7d9" />

---
***MSS (Legacy) MSS: (DisableIPSourceRouting IPv6) IP source routing protection level (protects against packet spoofing)***
```
Windows Server 2022 21H2
RegistryPath:   HKLM:\System\CurrentControlSet\Services\Tcpip6\Parameters
RegistryItem:   DisableIPSourceRouting
DefaultValue:      0
RecommendedValue:  2
```

```ps1
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Services\Tcpip6\Parameters" -Name "DisableIPSourceRouting" -Type DWord -Value 2
```
<img width="1267" height="601" alt="image" src="https://github.com/user-attachments/assets/5f6d0b5b-078d-435f-9989-f4406cd56fe0" />

---
***MSS (Legacy) MSS: (DisableIPSourceRouting) IP source routing protection level (protects against packet spoofing)***
```
Windows Server 2022 21H2
RegistryPath:   HKLM:\System\CurrentControlSet\Services\Tcpip\Parameters
RegistryItem:   DisableIPSourceRouting
DefaultValue:      1
RecommendedValue:  2
```

```ps1
New-Item -Path "HKLM:\System\CurrentControlSet\Services\Tcpip\Parameters" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Services\Tcpip\Parameters" -Name "DisableIPSourceRouting" -Type DWord -Value 2
```
<img width="1266" height="600" alt="image" src="https://github.com/user-attachments/assets/d9724d89-cb5c-4d9c-9968-c33fd945cecf" />

---
***MSS (Legacy) MSS: (EnableICMPRedirect) Allow ICMP redirects to override OSPF generated routes***
```
Windows Server 2022 21H2
RegistryPath:   HKLM:\System\CurrentControlSet\Services\Tcpip\Parameters
RegistryItem:   EnableICMPRedirect
DefaultValue:      1
RecommendedValue:  0
```

```ps1
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Services\Tcpip\Parameters" -Name "EnableICMPRedirect" -Type DWord -Value 0
```
<img width="1262" height="601" alt="image" src="https://github.com/user-attachments/assets/5ed6c76e-9341-44f0-93ef-30605ea276a2" />

---
***MSS (Legacy) MSS: (KeepAliveTime) How often keep-alive packets are sent in milliseconds***
```
Windows Server 2022 21H2
RegistryPath:   HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters
RegistryItem:   KeepAliveTime
DefaultValue:      7200000
RecommendedValue:  300000
```

```ps1
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "KeepAliveTime" -Type DWord -Value 300000
```
<img width="1268" height="600" alt="image" src="https://github.com/user-attachments/assets/87818a7a-1805-4f9e-be56-16b7ace66012" />

---
***MSS (Legacy) MSS: (NoNameReleaseOnDemand) Allow the computer to ignore NetBIOS name release requests except from WINS servers***
```
Windows Server 2022 21H2
RegistryPath:   HKLM:\System\CurrentControlSet\Services\Netbt\Parameters
RegistryItem:   NoNameReleaseOnDemand
DefaultValue:      0
RecommendedValue:  1
```

```ps1
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Services\Netbt\Parameters" -Name "NoNameReleaseOnDemand" -Type DWord -Value 1
```
<img width="1268" height="600" alt="image" src="https://github.com/user-attachments/assets/f365c9e5-5f92-442f-9183-166d4193c774" />

---
***MSS (Legacy) MSS: (PerformRouterDiscovery) Allow IRDP to detect and configure Default Gateway addresses (could lead to DoS)***
```
Windows Server 2022 21H2
RegistryPath:   HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters
RegistryItem:   PerformRouterDiscovery
DefaultValue:      0
RecommendedValue:  0
```

```ps1
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "PerformRouterDiscovery" -Type DWord -Value 0
```
<img width="1268" height="601" alt="image" src="https://github.com/user-attachments/assets/80bb21fe-379e-4518-aac2-c3fb3e183e52" />

---
***MSS (Legacy) MSS: (SafeDllSearchMode) Enable Safe DLL search mode (recommended)***
```
Windows Server 2022 21H2
RegistryPath:   HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager
RegistryItem:   SafeDLLSearchMode
DefaultValue:      0
RecommendedValue:  1
```

```ps1
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager" -Name "SafeDLLSearchMode" -Type DWord -Value 1
```
<img width="1261" height="598" alt="image" src="https://github.com/user-attachments/assets/3950c5fc-12f3-4c25-af80-e7472843ccd4" />

---
***MSS (Legacy) MSS: (ScreenSaverGracePeriod) The time in seconds before the screen saver grace period expires (0 recommended)***
```
Windows Server 2022 21H2
RegistryPath:   HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon
RegistryItem:   ScreenSaverGracePeriod
DefaultValue:      5
RecommendedValue:  5
```

```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "ScreenSaverGracePeriod" -Type String -Value "5"
```
<img width="1249" height="600" alt="image" src="https://github.com/user-attachments/assets/23f86c98-b1f3-47f0-8bcf-0b93fd185cff" />

---
***MSS (Legacy) MSS: (TcpMaxDataRetransmissions IPv6) How many times unacknowledged data is retransmitted***
```
Windows Server 2022 21H2
RegistryPath:   HKLM:\System\CurrentControlSet\Services\Tcpip6\Parameters
RegistryItem:   TcpMaxDataRetransmissions
DefaultValue:      5
RecommendedValue:  3
```

```ps1
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Services\Tcpip6\Parameters" -Name "TcpMaxDataRetransmissions" -Type DWord -Value 3
```
<img width="1267" height="600" alt="image" src="https://github.com/user-attachments/assets/e390b482-4f09-4b87-b2d3-c1c5afc24e27" />

---
***MSS (Legacy) MSS: (TcpMaxDataRetransmissions) How many times unacknowledged data is retransmitted***
```
Windows Server 2022 21H2
RegistryPath:   HKLM:\System\CurrentControlSet\Services\Tcpip\Parameters
RegistryItem:   TcpMaxDataRetransmissions
DefaultValue:      5
RecommendedValue:  3
```

```ps1
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Services\Tcpip\Parameters" -Name "TcpMaxDataRetransmissions" -Type DWord -Value 3
```
<img width="1265" height="598" alt="image" src="https://github.com/user-attachments/assets/ceb2ee75-8ce5-4ae6-8630-19d451a3fcb6" />

---
***MSS (Legacy) MSS: (WarningLevel) Percentage threshold for the security event log at which the system will generate a warning***
```
Windows Server 2022 21H2
RegistryPath:   HKLM:\SYSTEM\CurrentControlSet\Services\Eventlog\Security
RegistryItem:   WarningLevel
DefaultValue:      0
RecommendedValue:  90
```

```ps1
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Eventlog\Security" -Name "WarningLevel" -Type DWord -Value 90
```
<img width="1263" height="600" alt="image" src="https://github.com/user-attachments/assets/48382abe-c267-4b61-9f3f-30143c8deb06" />
