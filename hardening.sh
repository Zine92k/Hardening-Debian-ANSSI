 <div class="modal-section">
        <div class="modal-section-title">Script Bash — Durcissement ANSSI</div>
        <div class="code-block"><div class="code-lang">BASH</div><pre><span class="cm">#!/bin/bash
# durcissement_debian.sh — Zinedine Khalfaoui
# Recommandations ANSSI R32/R33</span>

<span class="kw">for</span> svc <span class="kw">in</span> avahi-daemon cups bluetooth rpcbind; <span class="kw">do</span>
  systemctl disable --now <span class="str">$svc</span> 2>/dev/null
<span class="kw">done</span>

iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -p tcp --dport <span class="str">1194</span> -j ACCEPT
iptables -A INPUT -p tcp --dport <span class="str">22</span> -s <span class="str">10.8.0.0/24</span> -j ACCEPT

sed -i <span class="str">'s/PermitRootLogin yes/PermitRootLogin no/'</span> /etc/ssh/sshd_config
sed -i <span class="str">'s/#PasswordAuthentication yes/PasswordAuthentication no/'</span> /etc/ssh/sshd_config
systemctl restart ssh
<span class="fn">echo</span> <span class="str">"[✓] Durcissement terminé."</span></pre></div>
      </div>
