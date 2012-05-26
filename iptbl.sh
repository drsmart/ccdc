#ports needed
#80,443 httpd
#21 vsftpd
#3306 mysqld

iptables -F
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -s 127.0.0.0/8 -j DROP
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
#allow only the following ports
iptables -A INPUT -p tcp --dport 80 -m state --state NEW -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -m state --state NEW -j ACCEPT
iptables -A INPUT -p tcp --dport 21 -m state --state NEW -j ACCEPT
iptables -A INPUT -p tcp --dport 20 -m state --state NEW -j ACCEPT
iptables -L -v

#saves the new rules
service iptables save