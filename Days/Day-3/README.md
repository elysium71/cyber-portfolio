# Day 3 Vulnerability Scanning and Basic Exploitation
# Day 3 – Vulnerability Scanning & Controlled Exploitation

## Objective
Deploy an intentionally vulnerable application and demonstrate a controlled exploit in a lab environment.

## Environment
- Attacker: Kali Linux
- Target: Ubuntu Server
- Application: DVWA
- Network: Host-only / Internal

## Tasks Performed
- Installed and configured DVWA on Ubuntu Server
- Verified Apache and database services
- Performed Nmap vulnerability scanning
- Demonstrated command injection vulnerability
- Verified server-side execution on Ubuntu

## Evidence
Screenshots are provided in the `screenshots/` folder.

## Key Finding
Improper input validation in web applications can lead to OS 

## Pre settings for vmware:
binrg up enp0s8 in Ubuntu:
sudo ip link set enp0s8 up
sudo ip addr add 192.168.233.101/24 dev enp0s8

in Kali:
sudo ip addr add 192.168.233.102/24 dev eth1
sudo dhclient -r eth0
sudo dhclient eth0



## Step 1
On Kali: 
ip a
ping 192.168.233.101

## Step2
close firewall on Ubuntu Server
install DVWA on Ubuntu Server just for testing vulnerable.
on Kali goes http://192.168.233.101/DVWA/security.php to change security level = low

## Step3
Nmap scan:
sudo nmap -sS -sV -O --script vuln 192.168.233.101

what does it do:
-sS Stealth TCP scan
-sV Service version detection
-O OS fingerprinting
--script vuln Runes vulnerability scripts

## Step4
in Ubuntu server open Apache access log with sudo tail -f /var/log/apache2/access.log
in DVWA menu goes Command injection
enter 127.0.0.1; whoami

a new line of log appear in ubuntu server, means the injection is working.

# Summary
In Day 3, I deployed Damn Vulnerable Web Application (DVWA) on an Ubuntu Server within an isolated lab network. I verified Apache and database services were running correctly and confirmed external access from Kali Linux. Using Nmap, I identified the exposed HTTP service on port 80. DVWA was configured at a low security level to allow controlled testing. I successfully demonstrated a command injection vulnerability by executing operating system commands through unsanitised user input and verified server-side execution by writing command output to the Ubuntu filesystem. This task highlights how improper input validation can lead to system compromise and demonstrates the importance of secure coding and service hardening.
