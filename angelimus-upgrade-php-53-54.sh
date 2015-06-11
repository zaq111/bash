wget http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
rpm -ivh epel-release-6-8.noarch.rpm
wget http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
rpm -Uvh remi-release-6*.rpm
yum --enablerepo=remi upgrade php-mysql php-devel php-gd php-pecl-memcache php-pspell php-snmp php-xmlrpc php-xml