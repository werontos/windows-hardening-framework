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
