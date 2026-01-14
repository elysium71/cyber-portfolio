Connectivity test: ping -c 2 192.168.233.101 succeded (0% loss)
Nmap service detection: SSH 22 and HTTP 80 open

Scan 1 (before firewall active)
Result: 22/tch (SSH), 80/tcp (HTTP/Apache)

Scan 2 (after firewall)
Result: Host seems down (ping blocked)
Follow up command : nmap -sV -Pn 192.168.233.101
"Firewall filtering hide ping" and confirm that services are reachable

