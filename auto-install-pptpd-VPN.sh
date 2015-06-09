#!/bin/bash
#
#
# Original Script by Mr Drew Morris @github
# drewsyma/VPN
#
# Modified by : angelimus
# angelimus.blogspot.com
#
# Thanks Drew for the lesson, Cheers

USERVPN="angelimusVPN01"
PASSVPN="pass001"

yum install ppp
yum install pptpd

wget http://poptop.sourceforge.net/yum/stable/packages/pptpd-1.4.0-1.el6.x86_64.rpm
rpm -Uhv pptpd-1.4.0-1.el6.x86_64.rpm

sed -i '/#remoteip 192.168.0.234-238,192.168.0.245/ a\remoteip 192.168.0.101-200' /etc/pptpd.conf
sed -i '/#remoteip 192.168.0.234-238,192.168.0.245/ a\localip 192.168.0.1' /etc/pptpd.conf

sed -i '/#ms-dns 10.0.0.2/ a\ms-dns 4.4.4.4' /etc/ppp/options.pptpd
sed -i '/#ms-dns 10.0.0.2/ a\ms-dns 8.8.8.8' /etc/ppp/options.pptpd

sed -i '/# client/ a\'$USERVPN' pptpd '$PASSVPN' *' /etc/ppp/chap-secrets
sed -i 's/net.ipv4.ip_forward = 0/net.ipv4.ip_forward = 1/' /etc/sysctl.conf

sysctl -p /etc/sysctl.conf

service iptables start
IPTAB="touch"
sed -i '/'$IPTAB'/ a\iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE' /etc/rc.local
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

service iptables save
service iptables restart

service pptpd restart
chkconfig pptpd on

MYIPADD=`curl ipv4.icanhazip.com`

clear
echo -e "\e[1;33mConnect VPN to : $MYIPADD \e[0m"
echo -e "\e[1;33mUsername       : $USERVPN \e[0m"
echo -e "\e[1;33mPassword       : $PASSVPN \e[0m"
