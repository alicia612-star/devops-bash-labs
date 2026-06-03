# DevOps Bash Automation Labs & Challenges

This repository contains production-ready Bash shell scripts designed to handle systems automation, infrastructure monitoring, self-healing service management, and user onboarding.

## Repository Contents

| File Name | Purpose | Core Concepts Demonstrated |
| :--- | :--- | :--- |
| `lab1_nginx_recovery.sh` | Automated Service Monitoring | Conditionals, Systemctl Tracking, Logging |
| `lab3_ec2_monitor.sh` | Resource Utilization Triage | Performance Parsing, Top, Awk Math |
| `challenge1_menu_tool.sh` | Interactive Sysadmin Utility | Case Loops, User Interfaces, Text Manipulation |
| `challenge2_onboarding.sh` | System IAM Management | File Iteration, Array Parsing, User Provisioning |

---

## Lab Execution Guides & Output Proofs

### 1. Production Server Recovery Agent (`lab1_nginx_recovery.sh`)
Monitors target system services and triggers automated self-healing remediation if a failure is detected.

**Note on Environment Adaptation:** *This script was originally designed to target Nginx. However, due to temporary upstream Kali mirror connection timeouts (404 errors during package fetching), the production target was dynamically pivoted to monitor the local **SSH** daemon instead. The automation logic remains identical.*

**How to Execute:**
```bash
./lab1_service_recovery.sh
