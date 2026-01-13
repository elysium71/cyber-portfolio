#!/usr/bin/env bash
set -euo pipefail

echo "=== Basic System Info ==="
echo "User: $(whoami)"
echo "Host: $(hostname)"
echo "OS:   $(uname -a)"
echo

echo "=== IP Addresses ==="
ip -brief address || ip a
echo

echo "=== Default Route (Gateway) ==="
ip route | head -n 5
echo

echo "=== DNS ==="
# Works on many Linux distros; if empty, it's still OK.
cat /etc/resolv.conf || true
echo

echo "=== Listening Ports (services on this machine) ==="
# Shows processes listening on TCP/UDP ports
ss -tulpn || netstat -tulpn
echo

