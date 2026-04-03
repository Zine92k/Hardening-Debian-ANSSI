#!/bin/bash
# Hardening Debian - Zine92k

# 1. Mise à jour du système
apt update && apt upgrade -y

# 2. Configuration SSH (Exemple)
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config

# 3. Pare-feu (Iptables)
iptables -F
iptables -P INPUT DROP
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -s 10.8.0.0/24 -j ACCEPT

echo "Le serveur est sécurisé !"