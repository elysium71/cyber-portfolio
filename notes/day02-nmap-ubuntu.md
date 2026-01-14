Ubuntu ip: 192.168.233.101
# before
commeand used: nmap -sV 192.168.233.101
ports 22/tcp is open and ssh service with OpenSSH version

# after use firewall on Ubuntu server
sudo ufw enable
sudo ufw allow ssh
sudo ufw status verbose

Scan again: nmap -sV 192.168.233.101
geting message about blocking ping probes.

