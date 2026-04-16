# 🛡️ Windows Hardening Framework

![Platform](https://img.shields.io/badge/Platform-Windows%2010%20%7C%20Server%202022-blue)
![PowerShell](https://img.shields.io/badge/PowerShell-5.1%2B-blue)
![MITRE ATT&CK](https://img.shields.io/badge/MITRE-ATT%26CK%20Mapped-red)
![CIS Benchmark](https://img.shields.io/badge/CIS-Benchmark%20Aligned-green)
![License](https://img.shields.io/badge/License-MIT-yellow)
![Status](https://img.shields.io/badge/Status-In%20Progress-orange)

> Enterprise-grade Windows hardening framework built from real lab testing.
> Every control is verified in a live VM, documented with before/after evidence,
> and mapped to MITRE ATT&CK techniques.

---

## 📋 Overview

This framework provides a complete set of PowerShell hardening scripts for Windows endpoints and servers. It is built by cross-referencing four industry sources:

- **HardeningKitty** (0x6d69636b) — community-maintained control list
- **CIS Benchmark** — Center for Internet Security Windows baseline
- **Microsoft SCT** — Security Compliance Toolkit official GPO baseline
- **DISA STIGs** — US Department of Defense hardening standards

Each script is modular, idempotent (safe to run multiple times), supports `-WhatIf` dry-run mode, and generates a log file with pass/fail results.

---

## 🏗️ Repository Structure

```
windows-hardening-framework/
│
├── scripts/
│   ├── Harden-Logging.ps1       ✅ Complete
│   ├── Harden-Network.ps1       🔄 In progress
│   ├── Harden-Identity.ps1      ⏳ Planned
│   ├── Harden-Endpoint.ps1      ⏳ Planned
│   ├── Harden-GPO.ps1           ⏳ Planned
│   ├── Master-Harden.ps1        ⏳ Planned
│   ├── Audit-Compliance.ps1     ⏳ Planned
│   └── Rollback.ps1             ⏳ Planned
│
├── docs/
│   ├── Harden-Logging.md        ✅ Full documentation with evidence
│   ├── Harden-Network.md        ⏳ Planned
│   ├── Harden-Identity.md       ⏳ Planned
│   └── mitre-mapping.md         ⏳ Planned
│
└── lab/
    └── scenarios/               ⏳ Planned — attack/detect exercises
```

---

## ⚡ Quick Start

```powershell
# 1. Clone the repository
git clone https://github.com/YOUR_USERNAME/windows-hardening-framework.git
cd windows-hardening-framework

# 2. Dry run — see what WILL be changed, touches nothing
.\scripts\Harden-Logging.ps1 -WhatIf

# 3. Apply logging hardening (run as Administrator)
.\scripts\Harden-Logging.ps1
```

> ⚠️ **Always run as Administrator.** Test in a VM before applying to production.

---

## 📊 Coverage Status

| Script | Controls | Status | MITRE Techniques |
|--------|----------|--------|-----------------|
| Harden-Logging.ps1 | 40+ | ✅ Complete | T1059, T1078, T1070, T1562 |
| Harden-Network.ps1 | — | 🔄 In progress | T1046, T1557, T1021 |
| Harden-Identity.ps1 | — | ⏳ Planned | T1078, T1110, T1548 |
| Harden-Endpoint.ps1 | — | ⏳ Planned | T1486, T1003, T1204 |
| Harden-GPO.ps1 | — | ⏳ Planned | T1059, T1204, T1548 |

---

## 🔍 What Harden-Logging.ps1 Covers

Full documentation with before/after evidence: [docs/Harden-Logging.md](docs/Harden-Logging.md)

| Category | Controls Applied |
|----------|-----------------|
| Windows Firewall Logging | Log size, dropped packets, successful connections — all 3 profiles (Domain, Private, Public) |
| PowerShell Logging | Script Block Logging, Module Logging, Invocation Logging — Windows PS + PS Core |
| Advanced Audit Policy | 30+ subcategories: Logon, Process Creation, Credential Validation, Privilege Use, Object Access, Policy Change |
| LSASS Audit | NTLM authentication audit — detects Pass-the-Hash attempts |
| Event Log Hardening | Security log 1 GB, System/Application 512 MB — prevents log roll-off attacks |

---

## 🧪 Lab Environment

All controls tested on:

| VM | OS | Role |
|----|----|------|
| VM1 | Kali Linux 2024 | Attacker |
| VM2 | Windows Server 2022 | Domain Controller |
| VM3 | Windows 10 Pro | Victim Workstation |
| VM4 | Ubuntu 22.04 | Wazuh SIEM + Suricata IDS |

Network: VirtualBox internal network `192.168.56.0/24` — fully isolated.

---

## 🗺️ MITRE ATT&CK Mapping

| Technique | ID | Mitigated by |
|-----------|----|-------------|
| PowerShell abuse | T1059.001 | ScriptBlock + Module Logging |
| Valid Accounts | T1078 | Logon auditing (4624/4625) |
| Brute Force | T1110 | Account Lockout + Logon audit |
| Clear Event Logs | T1070.001 | Log size hardening (1 GB Security log) |
| Credential Dumping (LSASS) | T1003.001 | LSASS AuditLevel + Sensitive Privilege Use |
| Network Service Scanning | T1046 | Firewall dropped packet logging |

---

## 📚 Sources & References

- [HardeningKitty](https://github.com/0x6d69636b/HardeningKitty) — primary control reference
- [CIS Benchmarks](https://www.cisecurity.org/cis-benchmarks) — Windows 10/11/Server 2022
- [Microsoft SCT](https://www.microsoft.com/en-us/download/details.aspx?id=55319) — Security Compliance Toolkit
- [DISA STIGs](https://public.cyber.mil/stigs/) — DoD hardening standards
- [MITRE ATT&CK](https://attack.mitre.org) — threat technique mapping

---

## 📄 License

MIT License — free to use, modify, and distribute with attribution.
