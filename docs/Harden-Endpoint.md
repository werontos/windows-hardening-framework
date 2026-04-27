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
