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
