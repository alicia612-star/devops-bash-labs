# DevOps Automated Infrastructure Solutions: Bash Scripts Lab

This repository contains a suite of lightweight, production-ready Bash shell scripts designed to automate core system administration tasks, service monitoring, resource triage, and Identity & Access Management (IAM) onboarding workflows.

---

## Workspace Setup & Permissions

Before executing any of the automation scripts, ensure that executable permissions are recursively granted across all script assets within the workspace directory:

```bash
chmod +x *.sh
```

---

# Core Automation Scripts Matrix

## 1. Production Service Recovery Agent (`lab1_service_recovery.sh`)

### Description

Periodically audits the state of target core daemons and triggers automated self-healing remediation routines if a service failure state is detected.

> **Environment Pivot Note:**
> Originally configured to monitor Nginx. Due to upstream package repository mirror connection timeouts, the script target was dynamically shifted to the local SSH daemon. The underlying script tracking logic remains identical.

### Execution

```bash
sudo ./lab1_service_recovery.sh
```

### Output Verification

Telemetry tracking history is systematically appended directly to:

```text
./nginx_recovery.log
```

---

## 2. AWS EC2 Instance Resource Monitor (`lab3_ec2_monitor.sh`)

### Description

Synthesizes low-level Linux diagnostic utilities (`df`, `free`, `top`) to extract lightweight performance snapshots of:

* Storage block volumes
* Memory utilization
* CPU load statistics

### Execution

```bash
./lab3_ec2_monitor.sh
```

### Output Verification

Formatted report files are dynamically generated with ISO timestamps under:

```text
/var/log/monitoring/
```

or local fallback directories.

---

## 3. Interactive Sysadmin Utility UI (`challenge1_menu_tool.sh`)

### Description

An interactive command-line dashboard interface featuring structured loops and case evaluations that allow operators to:

* Execute hardware diagnostics
* Restart services
* Archive logs
* Monitor system resources

### Execution

```bash
./challenge1_menu_tool.sh
```

### Output Verification

Interactive outputs print directly to the terminal.

Log backups are exported as compressed archives inside:

```text
./backup_logs/
```

as `.tar.gz` files.

---

## 4. Automated Identity Management Onboarding (`challenge2_onboarding.sh`)

### Description

Parses an input registry file (`users.txt`), provisions home profile architectures, generates cryptographically secure passwords using OpenSSL, and forces password rotation using:

```bash
chage -d 0
```

upon first login.

### Execution

```bash
sudo ./challenge2_onboarding.sh
```

### Output Verification

Generates simulated corporate email notification logs inside:

```text
email_mock_notifications.txt
```

located in the root workspace folder.

---

# Lab Execution Verification Proofs

## Lab 1 — Service Recovery Telemetry Log View
![Lab 1 Output](lab1_output.png)

Displays:

* Active service validation states
* Successful remediation notifications
* Recovery timestamps

---

## Lab 3 — System Infrastructure Performance Summary
![Lab 3 Output](lab3_output.png)

Displays compiled infrastructure reports detailing:

* Disk utilization
* Memory utilization
* CPU metrics

---

## Challenge 1 — Sysadmin Interactive Interface Loop
![Challenge 1 Output](challenge1_output.png)
Displays the functional DevOps Utility UI menu layout within the active terminal session.

---

## Challenge 2 — Simulated IAM Accounts Provisioning Output
![Challenge 2 Output](challenge2_output.png)
Displays generated mock email notifications mapping:

* User credentials
* Account assignments
* Compliance enforcement flags

---

# Auxiliary Step-by-Step Test Logs


## Lab 1 Failover – Emergency Restart Notification Trigger

![Crash Alert](notif.png)

---

## Challenge 1 UI – Menu Option 1 & 2 (CPU/RAM Live Stats)

![Option 1 and 2](option1-2.png)

---

## Challenge 1 UI – Menu Option 4 & 5 (Log Compression & Exit)

![Option 4 and 5](option4-5.png)

---

## Challenge 2 IAM – Active Useradd Profile Creation Loops

![Provisioning Loop](onboarding.png)

The following supporting screenshots document isolated execution stages,
 menu selections, and system notifications captured during development.

| Test Phase      | Step Description                           | Auxiliary Evidence Link |
| --------------- | ------------------------------------------ | ----------------------- |
| Lab 1 Failover  | Emergency Restart Notification Trigger     | View Crash Alert        |
| Challenge 1 UI  | Menu Option 1 & 2 (CPU/RAM Live Stats)     | View Stat Execution     |
| Challenge 1 UI  | Menu Option 4 & 5 (Log Compression & Exit) | View Backup Archive     |
| Challenge 2 IAM | Active Useradd Profile Creation Loops      | View Provisioning Loop  |

---

## Repository Structure

```text
.
├── lab1_service_recovery.sh
├── lab3_ec2_monitor.sh
├── challenge1_menu_tool.sh
├── challenge2_onboarding.sh
├── users.txt
├── nginx_recovery.log
├── email_mock_notifications.txt
├── backup_logs/
└── README.md
```

---

## Requirements

* Linux-based environment (Ubuntu/Kali Linux recommended)
* Bash Shell
* OpenSSL
* Systemd-enabled services
* Sudo privileges for administrative scripts

---

## Author

DevOps Automated Infrastructure Solutions Lab Project
