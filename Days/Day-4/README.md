# Day 4 — Vulnerability Assessment (DVWA Lab)

## Scope (Authorized Lab Only)
- Attacker: Kali Linux
- Target: Ubuntu Server running DVWA (Docker)
- Target IP: 192.168.233.101
- DVWA URL: http://192.168.233.101:8080

## What I Set Up on Ubuntu Server
I deployed DVWA using Docker and exposed it on port 8080 for testing inside my local VM lab.

## Method
1. Host/port scan + service detection (Nmap)
2. Web fingerprinting (WhatWeb)
3. Web checks (Nikto)

## Top 3 Findings
### 1) Missing security headers + cookies missing HttpOnly (Medium)
**Evidence:** `notes/05_nikto_dvwa.txt`  
**Why it matters:** Increases risk of clickjacking/MIME sniffing; cookies less protected.  
**Fix:** Add `X-Frame-Options` (or CSP `frame-ancestors`), `X-Content-Type-Options: nosniff`, and set cookies with `HttpOnly` (and `Secure` if HTTPS).

### 2) Apache version disclosure / outdated Apache flagged (Medium)
**Evidence:** `notes/02_enum_dvwa.txt`, `notes/05_nikto_dvwa.txt`  
**Why it matters:** Helps fingerprinting; older versions may have known issues.  
**Fix:** Patch/upgrade Apache; reduce version leakage (server tokens/signature hardening).

### 3) Exposed directories/files (High in real systems)
**Evidence:** `notes/05_nikto_dvwa.txt` (e.g., `/config/`, `/docs/`, `.gitignore`)  
**Why it matters:** Directory listing/config paths can leak sensitive info.  
**Fix:** Disable directory indexing; restrict/remove `/config/` and `/docs/`; remove unnecessary exposed files.

## Notes
- One scan attempt hit the wrong IP (192.168.233.102) and showed port 8080 closed. Correct target is 192.168.233.101.

## Evidence Files
- `notes/01_discovery.txt`
- `notes/02_enum_dvwa.txt`
- `notes/03_nmap_vuln_dvwa.txt`
- `notes/04_whatweb_dvwa.txt`
- `notes/05_nikto_dvwa.txt`
