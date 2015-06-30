clear
echo "             - angelimus.com -"
echo " 1. This is for free and personal use only, coorporate"
echo "	   you're welcome to use it."
echo " 2. Re-Distribute? DO IT!!! NO PERMISSION NEEDED"
echo " 3. Remove Credit? NO PROBLEM!!"
echo " 4. SELL IT? GO AHEAD"
echo " 5. DIDN'T Like IT? JUST DELETE IT."
echo " 6. DO WHAT YOU WANT TO DO, "
echo "    it's all about knowledge................"
echo ""
echo ""	   
read -p $'Press any key to continue...\n' -n1 key
sleep 1
clear
yum -y install squid http-tools
sleep 1
rm -rf /etc/squid/squid.conf
touch /etc/squid/squid.conf
sleep 1
username="myproxy"
password="myproxypass01"
echo -e "
http_port 3128
acl localhost src 127.0.0.1/32 ::1
acl to_localhost dst 127.0.0.0/8 0.0.0.0/32 ::1
acl localnet src 10.0.0.0/8    # RFC1918 possible internal network
acl localnet src 172.16.0.0/12    # RFC1918 possible internal network
acl localnet src 192.168.0.0/16    # RFC1918 possible internal network
acl localnet src fc00::/7       # RFC 4193 local private network range
acl localnet src fe80::/10      # RFC 4291 link-local (directly plugged) machines

acl SSL_ports port 443
acl Safe_ports port 80        # http
acl Safe_ports port 425       # smtp
acl Safe_ports port 21        # ftp
acl Safe_ports port 443       # https
acl Safe_ports port 70        # gopher
acl Safe_ports port 210       # wais
acl Safe_ports port 1025-65535    # unregistered ports
acl Safe_ports port 280        # http-mgmt
acl Safe_ports port 488        # gss-http
acl Safe_ports port 591        # filemaker
acl Safe_ports port 777        # multiling http
acl CONNECT method CONNECT

http_access allow manager localhost
http_access deny manager
http_access deny !Safe_ports
http_access allow Safe_ports
http_access deny CONNECT !SSL_ports
http_access allow localnet
http_access allow localhost
hierarchy_stoplist cgi-bin ?
coredump_dir /var/spool/squid
refresh_pattern ^ftp:        1440    20%    10080
refresh_pattern ^gopher:    1440    0%    1440
refresh_pattern -i (/cgi-bin/|?) 0    0%    0
refresh_pattern .        0    20%    4320
auth_param basic program /usr/lib64/squid/basic_ncsa_auth /etc/squid/squid_access
auth_param basic childred 5
auth_param basic realm Squid proxy-caching web server
auth_param basic credentialsttl 2 hours
acl ncsaauth proxy_auth REQUIRED
http_access allow ncsaauth
forwarded_for off
request_header_access Allow allow all
request_header_access Authorization allow all
request_header_access WWW-Authenticate allow all
request_header_access Proxy-Authorization allow all
request_header_access Proxy-Authenticate allow all
request_header_access Cache-Control allow all
request_header_access Content-Encoding allow all
request_header_access Content-Length allow all
request_header_access Content-Type allow all
request_header_access Date allow all
request_header_access Expires allow all
request_header_access Host allow all
request_header_access If-Modified-Since allow all
request_header_access Last-Modified allow all
request_header_access Location allow all
request_header_access Pragma allow all
request_header_access Accept allow all
request_header_access Accept-Charset allow all
request_header_access Accept-Encoding allow all
request_header_access Accept-Language allow all
request_header_access Content-Language allow all
request_header_access Mime-Version allow all
request_header_access Retry-After allow all
request_header_access Title allow all
request_header_access Connection allow all
request_header_access Proxy-Connection allow all
request_header_access User-Agent allow all
request_header_access Cookie allow all
request_header_access All deny all" >> /etc/squid/squid.conf
htpasswd -b -c /etc/squid/squid_access $username $password
chkconfig squid on
/etc/init.d/squid start
clear
echo "-------------------------------------------------------------------------"
echo "Now you're alredy done installing"
echo "All credit belongs to"
echo "http://www.squid-cache.org/Doc/config/acl/"
echo "http://autoim.net/elite-squid-proxy-setup/"
echo "http://www.cyberciti.biz/tips/howto-rhel-centos-fedora-squid-installation-configuration.html"
echo "-------------------------------------------------------------------------"
echo "      :: Elite Proxy ::"
echo "    Username = $username"
echo "    Password = $password"
echo "--------------------------------- www.angelimus.com - 2015 --------------"
echo ""
echo ""
read -p $'Press any key to continue...\n' -n1 key
