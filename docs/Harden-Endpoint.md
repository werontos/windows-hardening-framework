# Harden-Endpoint.ps1 — Implementation Documentation

# Microsoft Defender Antivirus
---
***Microsoft Defender Antivirus	MAPS: Configure local setting override for reporting to Microsoft MAPS***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet
RegistryItem:  LocalSettingOverrideSpynetReporting
DefaultValue:      -
RecommendedValue:  0
```
```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" -Name "LocalSettingOverrideSpynetReporting" -Type DWord -Value 0
```
<img width="1271" height="595" alt="image" src="https://github.com/user-attachments/assets/96e42c8a-d607-45ff-83f8-02f77289ceaa" />

---
***Microsoft Defender Antivirus	MAPS: Join Microsoft MAPS***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet
RegistryItem:  SpynetReporting
DefaultValue:      0
RecommendedValue:  0
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" -Name "SpynetReporting" -Type DWord -Value 0
```
<img width="1270" height="595" alt="image" src="https://github.com/user-attachments/assets/8f50844b-b819-42c6-b9ac-7d6953c4a708" />

---
***Microsoft Defender Antivirus	MpEngine: Enable file hash computation feature***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\MpEngine
RegistryItem:  EnableFileHashComputation
DefaultValue:      -
RecommendedValue:  1
```
```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\MpEngine" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\MpEngine" -Name "EnableFileHashComputation" -Type DWord -Value 1
```
<img width="1268" height="594" alt="image" src="https://github.com/user-attachments/assets/913c6a73-b193-419b-82e7-d0841b4d8cec" />

---
***Microsoft Defender Antivirus	Real-time Protection: Scan all downloaded files and attachments***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows Defender\Real-Time Protection
RegistryItem:  DisableIOAVProtection
DefaultValue:      0
RecommendedValue:  0
```
```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" -Name "DisableIOAVProtection" -Type DWord -Value 0
```
<img width="1267" height="595" alt="image" src="https://github.com/user-attachments/assets/95d73551-cde8-4add-b262-2cdbc8baa589" />

---
***Microsoft Defender Antivirus	Real-time Protection: Turn off real-time protection***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows Defender\Real-Time Protection
RegistryItem:  DisableRealtimeMonitoring
DefaultValue:      0
RecommendedValue:  0
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" -Name "DisableRealtimeMonitoring" -Type DWord -Value 0
```
<img width="1269" height="594" alt="image" src="https://github.com/user-attachments/assets/798cc8a1-7949-424c-bda8-c06fd17c7e39" />

---
***Microsoft Defender Antivirus	Real-time Protection: Turn on behavior monitoring (Policy)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows Defender\Real-Time Protection
RegistryItem:  DisableBehaviorMonitoring
DefaultValue:      0
RecommendedValue:  0
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" -Name "DisableBehaviorMonitoring" -Type DWord -Value 0
```
<img width="1268" height="594" alt="image" src="https://github.com/user-attachments/assets/f66b9865-0964-40bf-a41a-be404a546e85" />

---
***Microsoft Defender Antivirus	Real-time Protection: Turn on script scanning***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows Defender\Real-Time Protection
RegistryItem:  DisableScriptScanning
DefaultValue:      0
RecommendedValue:  0
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" -Name "DisableScriptScanning" -Type DWord -Value 0
```
<img width="1266" height="596" alt="image" src="https://github.com/user-attachments/assets/817237e0-2693-4818-8302-4aa3219083b7" />

---
***Microsoft Defender Antivirus	Reporting: Configure Watson events***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Reporting
RegistryItem:  DisableGenericRePorts
DefaultValue:      0
RecommendedValue:  1
```
```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Reporting" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Reporting" -Name "DisableGenericRePorts" -Type DWord -Value 1
```
<img width="1267" height="596" alt="image" src="https://github.com/user-attachments/assets/0a1143ce-cc6d-466f-b85a-a3bd3454081d" />

---
***Microsoft Defender Antivirus	Scan: Scan removable drives***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows Defender\Scan
RegistryItem:  DisableRemovableDriveScanning
DefaultValue:      1
RecommendedValue:  0
```
```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows Defender\Scan" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender\Scan" -Name "DisableRemovableDriveScanning" -Type DWord -Value 0
```
<img width="1264" height="592" alt="image" src="https://github.com/user-attachments/assets/9788da6d-4d02-420f-ba74-8a8f5b1f6f20" />

---
***Microsoft Defender Antivirus	Scan: Turn on e-mail scanning***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows Defender\Scan
RegistryItem:  DisableEmailScanning
DefaultValue:      1
RecommendedValue:  0
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender\Scan" -Name "DisableEmailScanning" -Type DWord -Value 0
```
<img width="1269" height="596" alt="image" src="https://github.com/user-attachments/assets/3bcddbf6-8150-4547-a242-61c0bbeb4345" />

---
***Microsoft Defender Antivirus	Configure detection for potentially unwanted applications***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows Defender
RegistryItem:  PUAProtection
DefaultValue:      0
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender" -Name "PUAProtection" -Type DWord -Value 1
```
<img width="1268" height="594" alt="image" src="https://github.com/user-attachments/assets/60ea27c9-d068-417e-9894-5daa70c44ef6" />

---
***Microsoft Defender Antivirus	Turn off Microsoft Defender Antivirus***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows Defender
RegistryItem:  DisableAntiSpyware
DefaultValue:      0
RecommendedValue:  0
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender" -Name "DisableAntiSpyware" -Type DWord -Value 0
```
<img width="1269" height="594" alt="image" src="https://github.com/user-attachments/assets/6b438956-2ecc-4b19-8fec-d0cf78b7ed63" />

---
# Microsoft Defender Exploit Guard
---
***Microsoft Defender Exploit Guard	Attack Surface Reduction rules***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR
RegistryItem:  ExploitGuard_ASR_Rules
DefaultValue:      0
RecommendedValue:  1
```
```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR" -Name "ExploitGuard_ASR_Rules" -Type DWord -Value 1
```
<img width="1269" height="597" alt="image" src="https://github.com/user-attachments/assets/43a1a6a7-0c6c-449c-9459-569aa7067d24" />

---
***Microsoft Defender Exploit Guard	ASR: Block all Office applications from creating child processes (Policy)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\rules
RegistryItem:  d4f940ab-401b-4efc-aadc-ad5f3c50688a
DefaultValue:      0
RecommendedValue:  1
```
```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\rules" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\rules" -Name "d4f940ab-401b-4efc-aadc-ad5f3c50688a" -Type DWord -Value 1
```
<img width="1265" height="590" alt="image" src="https://github.com/user-attachments/assets/2e9d68a5-b1f1-46f3-bf74-77e8fca4028e" />

---
***Microsoft Defender Exploit Guard	ASR: Block Office applications from creating executable content (Policy)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\rules
RegistryItem:  3b576869-a4ec-4529-8536-b80a7769e899
DefaultValue:      0
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\rules" -Name "3b576869-a4ec-4529-8536-b80a7769e899" -Type DWord -Value 1
```
<img width="1271" height="597" alt="image" src="https://github.com/user-attachments/assets/0990100d-3b39-4b53-a684-825d366d6bf8" />

---
***Microsoft Defender Exploit Guard	ASR: Block execution of potentially obfuscated scripts (Policy)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\rules
RegistryItem:  5beb7efe-fd9a-4556-801d-275e5ffc04cc
DefaultValue:      0
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\rules" -Name "5beb7efe-fd9a-4556-801d-275e5ffc04cc" -Type DWord -Value 1
```
<img width="1268" height="589" alt="image" src="https://github.com/user-attachments/assets/a94f12ab-5256-43c8-9f3c-01e6dae8ba33" />

---
***Microsoft Defender Exploit Guard	ASR: Block Office applications from injecting code into other processes (Policy)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\rules
RegistryItem:  75668c1f-73b5-4cf0-bb93-3ecf5cb7cc84
DefaultValue:      0
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\rules" -Name "75668c1f-73b5-4cf0-bb93-3ecf5cb7cc84" -Type DWord -Value 1
```
<img width="1264" height="590" alt="image" src="https://github.com/user-attachments/assets/31c6c84e-36cc-4ab9-a1d5-08af7e9d522a" />

---
***Microsoft Defender Exploit Guard	ASR: Block Adobe Reader from creating child processes (Policy)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\rules
RegistryItem:  7674ba52-37eb-4a4f-a9a1-f0f9a1619a2c
DefaultValue:      0
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\rules" -Name "7674ba52-37eb-4a4f-a9a1-f0f9a1619a2c" -Type DWord -Value 1
```
<img width="1265" height="591" alt="image" src="https://github.com/user-attachments/assets/8d865221-59f4-4954-a1b6-6a21336859eb" />

---
***Microsoft Defender Exploit Guard	ASR: Block Win32 API calls from Office macros (Policy)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\rules
RegistryItem:  92e97fa1-2edf-4476-bdd6-9dd0b4dddc7b
DefaultValue:      0
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\rules" -Name "92e97fa1-2edf-4476-bdd6-9dd0b4dddc7b" -Type DWord -Value 1
```
<img width="1265" height="592" alt="image" src="https://github.com/user-attachments/assets/219b1406-7e35-464e-aeb1-3ddab758173b" />

---
***Microsoft Defender Exploit Guard	ASR: Block credential stealing from the Windows local security authority subsystem (lsass.exe) (Policy)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\rules
RegistryItem:  9e6c4e1f-7d60-472f-ba1a-a39ef669e4b2
DefaultValue:      0
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\rules" -Name "9e6c4e1f-7d60-472f-ba1a-a39ef669e4b2" -Type DWord -Value 1
```
<img width="1266" height="597" alt="image" src="https://github.com/user-attachments/assets/9ed0eeda-fc05-4f54-be7b-225f6faa5dfa" />

---
***Microsoft Defender Exploit Guard	ASR: Block untrusted and unsigned processes that run from USB (Policy)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\rules
RegistryItem:  b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4
DefaultValue:      0
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\rules" -Name "b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4" -Type DWord -Value 1
```
<img width="1266" height="594" alt="image" src="https://github.com/user-attachments/assets/e435ea66-61fc-4606-aeee-72b1a0f0af57" />

---
***Microsoft Defender Exploit Guard	ASR: Block executable content from email client and webmail (Policy)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\rules
RegistryItem:  be9ba2d9-53ea-4cdc-84e5-9b1eeee46550
DefaultValue:      0
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\rules" -Name "be9ba2d9-53ea-4cdc-84e5-9b1eeee46550" -Type DWord -Value 1
```
<img width="1268" height="593" alt="image" src="https://github.com/user-attachments/assets/fa7ee323-1e3a-476a-b7a3-d77d2a0626d3" />

---
***Microsoft Defender Exploit Guard	ASR: Block JavaScript or VBScript from launching downloaded executable content (Policy)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\rules
RegistryItem:  d3e037e1-3eb8-44c8-a917-57927947596d
DefaultValue:      0
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\rules" -Name "d3e037e1-3eb8-44c8-a917-57927947596d" -Type DWord -Value 1
```
<img width="1268" height="593" alt="image" src="https://github.com/user-attachments/assets/e07b2981-6a8a-4ad0-b542-31811a265ecd" />

---
***Microsoft Defender Exploit Guard	ASR: Block Office communication application from creating child processes (Policy)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\rules
RegistryItem:  26190899-1602-49e8-8b27-eb1d0a1ce869
DefaultValue:      0
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\rules" -Name "26190899-1602-49e8-8b27-eb1d0a1ce869" -Type DWord -Value 1
```
<img width="1265" height="589" alt="image" src="https://github.com/user-attachments/assets/0f91e63f-d68b-484d-9c43-bf9eaa43d720" />

---
***Microsoft Defender Exploit Guard	ASR: Block persistence through WMI event subscription (Policy)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\rules
RegistryItem:  e6db77e5-3df2-4cf1-b95a-636979351e5b
DefaultValue:      0
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\rules" -Name "e6db77e5-3df2-4cf1-b95a-636979351e5b" -Type DWord -Value 1
```
<img width="1269" height="599" alt="image" src="https://github.com/user-attachments/assets/5c200219-0a16-41e7-b5c8-c2c66f077284" />

---
# Security Options
---
***Security Options	Accounts: Limit local account use of blank passwords to console logon only***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\System\CurrentControlSet\Control\Lsa
RegistryItem:  SCENoApplyLegacyAuditPolicy
DefaultValue:      1
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Lsa" -Name "SCENoApplyLegacyAuditPolicy" -Type DWord -Value 1
```
<img width="1268" height="596" alt="image" src="https://github.com/user-attachments/assets/d8322f65-8e86-488a-a45d-cbd7b9c30ace" />

---
***Administrative Templates: System	Device Guard: Credential Guard Configuration (Member)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard
RegistryItem:  LsaCfgFlags
DefaultValue:      -
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" -Name "LsaCfgFlags" -Type DWord -Value 1
```
<img width="1271" height="595" alt="image" src="https://github.com/user-attachments/assets/222d8155-414c-4087-8943-4549b9a88434" />

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
***MS Security Guide	Enable Structured Exception Handling Overwrite Protection (SEHOP)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\kernel
RegistryItem:  DisableExceptionChainValidation
DefaultValue:      0
RecommendedValue:  0
```
```ps1
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" -Name "DisableExceptionChainValidation" -Type DWord -Value 0
```
<img width="1219" height="544" alt="image" src="https://github.com/user-attachments/assets/c3625c9a-83bf-45ed-9e32-49acfc96c986" />

---
***Administrative Templates: Windows Components	App Package Deployment: Allow a Windows app to share application data between users***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\AppModel\StateManager
RegistryItem:  AllowSharedLocalAppData
DefaultValue:      1
RecommendedValue:  0
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\AppModel\StateManager" -Name "AllowSharedLocalAppData" -Type DWord -Value 0
```
<img width="1213" height="546" alt="image" src="https://github.com/user-attachments/assets/0b8c4ba9-69dc-4861-91d3-67d55d585c35" />

---
***Microsoft Defender Exploit Guard	Exploit protection: Data Execution Prevention (DEP)***
```
Windows Server 2022 21H2
Processmitigation:  DEP
DefaultValue:      ON
RecommendedValue:  ON
```
```ps1
Set-ProcessMitigation -System -Enable DEP
```
---
***Microsoft Defender Exploit Guard	Force use of Data Execution Prevention (DEP)***
```
Windows Server 2022 21H2
bcdedit:           nx
DefaultValue:      OptIn
RecommendedValue:  AlwaysOn
```
```ps1
bcdedit /set {current} nx AlwaysOn
```
---
***Microsoft Defender Exploit Guard	Exploit protection: Validate exception chains (SEHOP)***
```
Windows Server 2022 21H2
Processmitigation:  SEHOP.Enable
DefaultValue:      ON
RecommendedValue:  ON
```
```ps1
Set-ProcessMitigation -System -Enable SEHOP
```
---
***Microsoft Defender Exploit Guard	Exploit protection: Validate exception chains (SEHOP (Telemetry only)***
```
Windows Server 2022 21H2
Processmitigation:  SEHOP.TelemetryOnly
DefaultValue:      NOTSET
RecommendedValue:  OFF
```
```ps1
Set-ProcessMitigation -System -Disable SEHOPTelemetry
```
---
***Microsoft Defender Exploit Guard	Exploit protection: Override validate exception chains (SEHOP)***
```
Windows Server 2022 21H2
Processmitigation:  SEHOP.OverrideSEHOP
DefaultValue:      False
RecommendedValue:  False
```
```ps1
Set-ProcessMitigation -System -Disable SEHOPOverrideSEHOP
```
---
***Microsoft Defender Exploit Guard	Exploit protection: Force randomization for images (Mandatory ASLR)***
```
Windows Server 2022 21H2
Processmitigation:  ASLR.ForceRelocateImages
DefaultValue:      OFF
RecommendedValue:  ON
```
```ps1
Set-ProcessMitigation -System -Enable ForceRelocateImages
```
---
***Microsoft Defender Exploit Guard	Exploit protection: Override force randomization for images (Mandatory ASLR)***
```
Windows Server 2022 21H2
Processmitigation:    ASLR.OverrideForceRelocateImages
DefaultValue:         False
RecommendedValue:     False
```
```ps1
Set-ProcessMitigation -System -Disable OverrideForceRelocateImages
Set-ProcessMitigation -System -Disable OverrideBottomUp
```
---
***Microsoft Defender Exploit Guard	Exploit protection: Randomize memory allocations (Bottom-up ASLR)***
```
Windows Server 2022 21H2
Processmitigation:    ASLR.BottomUp
DefaultValue:         ON
RecommendedValue:     ON
```
```ps1
Set-ProcessMitigation -System -Enable BottomUp
```
---
***Microsoft Defender Exploit Guard	Exploit protection: Override randomize memory allocations (Bottom-up ASLR)***
```
Windows Server 2022 21H2
Processmitigation:    ASLR.OverrideBottomUp
DefaultValue:         ON
RecommendedValue:     ON
```
```ps1
-
```
---
***Microsoft Defender Exploit Guard	Exploit protection: High-entropy ASLR***
```
Windows Server 2022 21H2
Processmitigation:    ASLR.HighEntropy
DefaultValue:         ON
RecommendedValue:     ON
```
```ps1
Set-ProcessMitigation -System -Enable HighEntropy
```
---
***MS Security Guide	LSA Protection***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SYSTEM\CurrentControlSet\Control\Lsa
RegistryItem:  RunAsPPL
DefaultValue:      -
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -Name "RunAsPPL" -Type DWord -Value 1
```
<img width="1268" height="596" alt="image" src="https://github.com/user-attachments/assets/96f7d15d-0c4d-4bc6-97f9-2d61aa8d4127" />

---
***PowerShell Constrained Language Mode***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment\
RegistryItem:  __PSLockdownPolicy
DefaultValue:      -
RecommendedValue:  4
```
```ps1
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" -name __PSLockdownPolicy -Type DWord -Value 4
```
<img width="1266" height="594" alt="image" src="https://github.com/user-attachments/assets/5ecfb279-280e-4067-99ed-f9595e813bf6" />

---
***Administrative Templates: Windows Components	AutoPlay Policies: Disallow Autoplay for non-volume devices***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\Explorer
RegistryItem:  NoAutoplayfornonVolume
DefaultValue:      0
RecommendedValue:  1
```
```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\Explorer" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\Explorer" -name "NoAutoplayfornonVolume" -Type DWord -Value 1
```
<img width="1267" height="587" alt="image" src="https://github.com/user-attachments/assets/f16be6cc-3179-467b-87ac-ac823adf956b" />

---
***Administrative Templates: Windows Components	AutoPlay Policies: Turn off Autoplay***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer
RegistryItem:  NoDriveTypeAutoRun
DefaultValue:      0
RecommendedValue:  255
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -name "NoDriveTypeAutoRun" -Type DWord -Value 255
```
<img width="1267" height="594" alt="image" src="https://github.com/user-attachments/assets/a8872e5f-739f-4434-a324-a125c39e3b56" />

---
***Administrative Templates: Windows Components	WinRM Client: Allow Basic authentication***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\WinRM\Client
RegistryItem:  AllowBasic
DefaultValue:      1
RecommendedValue:  0
```
```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Client" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Client" -name "AllowBasic" -Type DWord -Value 0
```
<img width="1266" height="588" alt="image" src="https://github.com/user-attachments/assets/87f21634-5569-4190-b9c4-e938809223d3" />

---
***Administrative Templates: Windows Components	WinRM Service: Allow Basic authentication***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\WinRM\Service
RegistryItem:  AllowBasic
DefaultValue:      1
RecommendedValue:  0
```
```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Service" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Service" -name "AllowBasic" -Type DWord -Value 0
```
<img width="1268" height="595" alt="image" src="https://github.com/user-attachments/assets/bfb11a76-23d9-48b6-98ef-5d1138f7af13" />

---
***Administrative Templates: Windows Components	WinRM Client: Allow unencrypted traffic***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\WinRM\Client
RegistryItem:  AllowUnencryptedTraffic
DefaultValue:      1
RecommendedValue:  0
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Client" -name "AllowUnencryptedTraffic" -Type DWord -Value 0
```
<img width="1267" height="593" alt="image" src="https://github.com/user-attachments/assets/0373bc31-53c0-443f-a5ed-8626110357f9" />

---
***Administrative Templates: Windows Components	WinRM Service: Allow unencrypted traffic***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\WinRM\Service
RegistryItem:  AllowUnencryptedTraffic
DefaultValue:      1
RecommendedValue:  0
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Service" -name "AllowUnencryptedTraffic" -Type DWord -Value 0
```
<img width="1266" height="594" alt="image" src="https://github.com/user-attachments/assets/daec67d4-c0ee-4859-ac67-d568e95fb78e" />

---
***MSS (Legacy)	MSS: (SafeDllSearchMode) Enable Safe DLL search mode (recommended)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager
RegistryItem:  SafeDllSearchMode
DefaultValue:      0
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager" -name "SafeDllSearchMode" -Type DWord -Value 1
```
<img width="1269" height="592" alt="image" src="https://github.com/user-attachments/assets/a72191ff-806c-4340-8b95-304e3a187239" />

---
***Microsoft Defender Exploit Guard	Network Protection: Prevent users and apps from accessing dangerous websites***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Network Protection
RegistryItem:  EnableNetworkProtection
DefaultValue:      -
RecommendedValue:  1
```
```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Network Protection" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Network Protection" -name "EnableNetworkProtection" -Type DWord -Value 1
```
<img width="1269" height="592" alt="image" src="https://github.com/user-attachments/assets/f146de3b-c751-49f7-9cba-4c4fb7d977f1" />

---
***Controlled Folder Access***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Controlled Folder Access
RegistryItem:  EnableControlledFolderAccess
DefaultValue:      -
RecommendedValue:  1
```
```ps1
New-Item -Path "SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Controlled Folder Access" -Force | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Controlled Folder Access" -Name "EnableControlledFolderAccess" -PropertyType DWord -Value 1 -Force
```
<img width="1263" height="597" alt="image" src="https://github.com/user-attachments/assets/4b75079d-0618-4a52-ae79-ba8c122f7b5c" />

---
***Administrative Templates: Windows Components	WinRM Client: Disallow Digest authentication***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\WinRM\Client
RegistryItem:  AllowDigest
DefaultValue:      1
RecommendedValue:  0
```
```ps1
New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Client" -Name "AllowDigest" -PropertyType DWord -Value 0 -Force
```
<img width="1264" height="594" alt="image" src="https://github.com/user-attachments/assets/daff0bbd-346b-440e-8217-52506c649c16" />

---
***Administrative Templates: Windows Components	WinRM Service: Disallow WinRM from storing RunAs credentials***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\WinRM\Service
RegistryItem:  DisableRunAs
DefaultValue:      0
RecommendedValue:  1
```
```ps1
New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Service" -Name "DisableRunAs" -PropertyType DWord -Value 1 -Force
```
<img width="1268" height="591" alt="image" src="https://github.com/user-attachments/assets/0e3beb44-6c93-4dc0-a867-2d83a75afe6d" />

---
***Windows Script Host***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Microsoft\Windows Script Host\Settings
RegistryItem:  Enabled
DefaultValue:      -
RecommendedValue:  0
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows Script Host\Settings" -Name "Enabled" -Type DWord -Value 0
```
<img width="1264" height="593" alt="image" src="https://github.com/user-attachments/assets/43c637f7-58d1-4166-994e-988f300efba9" />

---
***MS Security Guide WDigest Authentication***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest
RegistryItem:  UseLogonCredential
DefaultValue:      0
RecommendedValue:  0
```
```ps1
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest" -Name "UseLogonCredential" -Type DWord -Value 0
```
<img width="1268" height="600" alt="image" src="https://github.com/user-attachments/assets/7239a88a-161f-4467-ac45-d59b4f68a014" />

---
***Microsoft Defender Configure Tamper Protection***
```
Windows Server 2022 21H2
RegistryPath:      HKLM:\SOFTWARE\Microsoft\Windows Defender\Features
RegistryItem:      TamperProtection
DefaultValue:      0
RecommendedValue:  5
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows Defender\Features" -Name "TamperProtection" -Type DWord -Value 5
```
You can toggle it on manually
