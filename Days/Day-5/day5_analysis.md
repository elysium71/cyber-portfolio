### Nikto Web Vulnerability Scan Analysis

Nikto was used to scan the intentionally vulnerable website
testphp.vulnweb.com to identify web server misconfigurations
and security weaknesses.

The scan revealed several issues, including missing HTTP
security headers and server version disclosure.

The most critical vulnerability identified was the absence
of the X-Frame-Options and X-Content-Type-Options headers.
Without these protections, the website is vulnerable to
clickjacking and MIME-type sniffing attacks, which could
allow attackers to trick users into performing unintended
actions or execute malicious scripts.

Additionally, the server disclosed detailed version information,
including the web server and PHP version, which could assist
attackers in crafting targeted exploits.

If deployed in a real-world environment, these vulnerabilities
would significantly increase the attack surface of the system.
