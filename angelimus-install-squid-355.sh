cd /etc/yum.repos.d/
echo -e "
[squid]
name=Squid beta repo for CentOS Linux 6 - $basearch
#IL mirror
baseurl=http://www1.ngtech.co.il/rpm/centos/6/$basearch
failovermethod=priority
enabled=1
gpgcheck=0" >> angelimus.repo
sleep 1
yum-config-manager --enable squid
yum -y update
