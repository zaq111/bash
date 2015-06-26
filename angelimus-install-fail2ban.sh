clear
echo Welcome to Angelimus.com
echo thanks for using auto install script
echo --------------------------------------
sleep 3
echo --------------------------------------
echo Step 1 - Installing fail2ban
echo --------------------------------------
rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
yum -y install fail2ban
clear
echo --------------------------------------
echo Step 2 - Creating jail.conf
echo --------------------------------------
sleep 3
cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
clear
echo --------------------------------------
echo Step 3 - Preparing jail.local
echo --------------------------------------
sleep 3
vi /etc/fail2ban/jail.local
