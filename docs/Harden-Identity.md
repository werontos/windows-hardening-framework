# Harden-Logging.ps1 — Implementation Documentation

---
***Account Policies	Length of password history maintained***
```
Windows Server 2022 21H2
accountpolicy
DefaultValue:      None
RecommendedValue:  24
```
```ps1
net accounts /uniquepw:24
```
---
***Account Policies	Maximum password age***
```
Windows Server 2022 21H2
accountpolicy
DefaultValue:      42
RecommendedValue:  365
```
```ps1
net accounts /maxpwage:365
```
---
***Account Policies	Minimum password age***
```
Windows Server 2022 21H2
accountpolicy
DefaultValue:      0
RecommendedValue:  1
```
```ps1
net accounts /minpwage:1
```
---
***Account Policies	Minimum password length***
```
Windows Server 2022 21H2
accountpolicy
DefaultValue:      0
RecommendedValue:  14
```
```ps1
net accounts /minpwlen:14
```
<img width="478" height="146" alt="image" src="https://github.com/user-attachments/assets/81625de7-4d5b-4fb0-b468-4a5eaa0fccd5" />

---
***Account Policies Relax minimum password length limits***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\System\CurrentControlSet\Control\SAM
RegistryItem:  RelaxMinimumPasswordLengthLimits
DefaultValue:      0
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\SAM" -Name "RelaxMinimumPasswordLengthLimits" -Type DWord -Value 1
```
<img width="1263" height="601" alt="image" src="https://github.com/user-attachments/assets/40695ee9-e3e3-41f7-9a59-08fd96c5431d" />

---
***Security Options	Accounts: Limit local account use of blank passwords to console logon only***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\System\CurrentControlSet\Control\Lsa
RegistryItem:  LimitBlankPasswordUse
DefaultValue:      1
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Lsa" -Name "LimitBlankPasswordUse" -Type DWord -Value 1
```
<img width="1268" height="602" alt="image" src="https://github.com/user-attachments/assets/985481e9-bf90-426a-a0fd-232f66da081b" />

---
***Security Options	Domain controller: Refuse machine account password changes (DC)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters
RegistryItem:  RefusePasswordChange
DefaultValue:      1
RecommendedValue:  0
```
```ps1
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" -Name "RefusePasswordChange" -Type DWord -Value 0
```
<img width="1265" height="602" alt="image" src="https://github.com/user-attachments/assets/acde62f7-46d6-4147-8bcc-2cd53ddc46e2" />

---
***Security Options	Domain member: Disable machine account password changes***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters
RegistryItem:  DisablePasswordChange
DefaultValue:      0
RecommendedValue:  0
```
```ps1
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" -Name "DisablePasswordChange" -Type DWord -Value 0
```
<img width="1270" height="599" alt="image" src="https://github.com/user-attachments/assets/b820bad5-60a8-4501-b4c1-dca14a295e57" />

---
***Security Options	Domain member: Disable machine account password changes***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters
RegistryItem:  MaximumPasswordAge
DefaultValue:      30
RecommendedValue:  30
```
```ps1
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" -Name "MaximumPasswordAge" -Type DWord -Value 30
```
<img width="1272" height="604" alt="image" src="https://github.com/user-attachments/assets/b4b2c023-21d9-4291-b8b8-57b9db6f345c" />

---
***Security Options	Interactive logon: Prompt user to change password before expiration (Max)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System
RegistryItem:  PasswordExpiryWarning
DefaultValue:      5
RecommendedValue:  14
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "PasswordExpiryWarning" -Type DWord -Value 14
```
<img width="1263" height="603" alt="image" src="https://github.com/user-attachments/assets/6e116bef-8295-47e5-9a92-580c4c92962e" />

---
***Security Options	Interactive logon: Prompt user to change password before expiration (Min)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System
RegistryItem:  PasswordExpiryWarning
DefaultValue:      5
RecommendedValue:  5
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "PasswordExpiryWarning" -Type DWord -Value 5
```
<img width="1266" height="603" alt="image" src="https://github.com/user-attachments/assets/41205f2f-9f65-4120-ab03-cc8f1b0bdf43" />

---
***Security Options	Microsoft network client: Send unencrypted password to third-party SMB servers***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\System\CurrentControlSet\Services\LanmanWorkstation\Parameters
RegistryItem:  EnablePlainTextPassword
DefaultValue:      0
RecommendedValue:  0
```
```ps1
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Services\LanmanWorkstation\Parameters" -Name "EnablePlainTextPassword" -Type DWord -Value 0
```
<img width="1265" height="602" alt="image" src="https://github.com/user-attachments/assets/e491eceb-0e2a-4cf1-872f-de63dcdd8496" />

---
***Security Options	Network access: Do not allow storage of passwords and credentials for network authentication***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\System\CurrentControlSet\Control\Lsa
RegistryItem:  DisableDomainCreds
DefaultValue:      0
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Lsa" -Name "DisableDomainCreds" -Type DWord -Value 1
```
<img width="1269" height="602" alt="image" src="https://github.com/user-attachments/assets/16e74304-a667-409f-b29f-65bd1969ae37" />

---
***Security Options	Network security: Do not store LAN Manager hash value on next password change***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\System\CurrentControlSet\Control\Lsa
RegistryItem:  NoLMHash
DefaultValue:      1
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Lsa" -Name "NoLMHash" -Type DWord -Value 1
```
<img width="1267" height="603" alt="image" src="https://github.com/user-attachments/assets/a2be68d5-507a-41c9-9f47-2f83ff4fc767" />

---
***Administrative Templates: LAPS	Do not allow password expiration time longer than required by policy (Member)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft Services\AdmPwd
RegistryItem:  PwdExpirationProtectionEnabled
DefaultValue:      0
RecommendedValue:  1
```
```ps1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft Services\AdmPwd" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft Services\AdmPwd" -Name "PwdExpirationProtectionEnabled" -Type DWord -Value 1
```
<img width="1271" height="602" alt="image" src="https://github.com/user-attachments/assets/b90315a5-a76b-4415-bd39-49e0f6a7af5c" />

---
***Administrative Templates: LAPS	Enable local admin password management (Member)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft Services\AdmPwd
RegistryItem:  AdmPwdEnabled
DefaultValue:      0
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft Services\AdmPwd" -Name "AdmPwdEnabled" -Type DWord -Value 1
```
<img width="1267" height="599" alt="image" src="https://github.com/user-attachments/assets/9a197554-1a93-44e3-9df5-2b0d21ef798e" />

---
***Administrative Templates: LAPS	Password Settings: Password Complexity (Member)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft Services\AdmPwd
RegistryItem:  PasswordComplexity
DefaultValue:      4
RecommendedValue:  4
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft Services\AdmPwd" -Name "PasswordComplexity" -Type DWord -Value 4
```
<img width="1264" height="604" alt="image" src="https://github.com/user-attachments/assets/6d32183c-51a4-48e4-93a9-a9087a76350d" />

---
***Administrative Templates: LAPS	Password Settings: Password Length (Member)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft Services\AdmPwd
RegistryItem:  PasswordLength
DefaultValue:      14
RecommendedValue:  15
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft Services\AdmPwd" -Name "PasswordLength" -Type DWord -Value 15
```
<img width="1264" height="603" alt="image" src="https://github.com/user-attachments/assets/f25dfc7c-2537-4196-8b97-7c61560cbd8b" />

---
***Administrative Templates: LAPS	Password Settings: Password Age (Days) (Member)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft Services\AdmPwd
RegistryItem:  PasswordAgeDays
DefaultValue:      30
RecommendedValue:  30
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft Services\AdmPwd" -Name "PasswordAgeDays" -Type DWord -Value 30
```
<img width="1268" height="602" alt="image" src="https://github.com/user-attachments/assets/6b535ff6-1e8a-4409-ab5d-af5d9cf3dd5c" />

---
***Administrative Templates: System	Logon: Turn off picture password sign-in***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows\System
RegistryItem:  BlockDomainPicturePassword
DefaultValue:      0
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "BlockDomainPicturePassword" -Type DWord -Value 1
```
<img width="1269" height="599" alt="image" src="https://github.com/user-attachments/assets/6e154ab0-542b-4fb1-9dcc-3614e5ea7bd7" />

---
***Administrative Templates: System	Sleep Settings: Require a password when a computer wakes (on battery)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51
RegistryItem:  DCSettingIndex
DefaultValue:      0
RecommendedValue:  1
```
```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51" -Name "DCSettingIndex" -Type DWord -Value 1
```
<img width="1268" height="598" alt="image" src="https://github.com/user-attachments/assets/554809af-41a5-47d7-aa92-2e1e882011dc" />

---
***Administrative Templates: System	Sleep Settings: Require a password when a computer wakes (plugged in)***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51
RegistryItem:  ACSettingIndex
DefaultValue:      0
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51" -Name "ACSettingIndex" -Type DWord -Value 1
```
<img width="1270" height="600" alt="image" src="https://github.com/user-attachments/assets/de059a14-fb64-4f52-95e6-709c567927b5" />

---
***Administrative Templates: Windows Components	Credential User Interface: Do not display the password reveal button***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\Software\Policies\Microsoft\Windows\CredUI
RegistryItem:  DisablePasswordReveal
DefaultValue:      0
RecommendedValue:  1
```
```ps1
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CredUI" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\CredUI" -Name "DisablePasswordReveal" -Type DWord -Value 1
```
<img width="1265" height="599" alt="image" src="https://github.com/user-attachments/assets/5c7b636a-6ffa-4159-aac7-4a387a25be39" />

---
***Administrative Templates: Windows Components	Remote Desktop Connection Client: Do not allow passwords to be saved***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services
RegistryItem:  DisablePasswordSaving
DefaultValue:      0
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name "DisablePasswordSaving" -Type DWord -Value 1
```
<img width="1267" height="603" alt="image" src="https://github.com/user-attachments/assets/69841903-963a-4639-af25-29c1859dbc03" />

---
***Administrative Templates: Windows Components	Remote Desktop Session Host: Security: Always prompt for password upon connection***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services
RegistryItem:  fPromptForPassword
DefaultValue:      0
RecommendedValue:  1
```
```ps1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name "fPromptForPassword" -Type DWord -Value 1
```
<img width="1265" height="601" alt="image" src="https://github.com/user-attachments/assets/073343dd-a088-4c27-8e8d-9ac695665163" />

---
***	Account Policies	Password must meet complexity requirements***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services
RegistryItem:  fPromptForPassword
DefaultValue:      0
RecommendedValue:  1
```
```ps1
secedit /export /cfg C:\secpol.cfg

(Get-Content C:\secpol.cfg) `
-replace "PasswordComplexity = 0", "PasswordComplexity = 1" |
Set-Content C:\secpol.cfg

secedit /configure /db C:\Windows\Security\Database\secedit.sdb /cfg C:\secpol.cfg /areas SECURITYPOLICY

Remove-Item C:\secpol.cfg -Force
```
---
***	Account Policies	Password must meet complexity requirements***
```
Windows Server 2022 21H2
RegistryPath:  HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services
RegistryItem:  fPromptForPassword
DefaultValue:      0
RecommendedValue:  1
```
```ps1
secedit /export /cfg C:\secpol.cfg

(Get-Content C:\secpol.cfg) `
-replace "ClearTextPassword = 1", "ClearTextPassword = 0" |
Set-Content C:\secpol.cfg

secedit /configure /db C:\Windows\Security\Database\secedit.sdb /cfg C:\secpol.cfg /areas SECURITYPOLICY

Remove-Item C:\secpol.cfg -Force
```
