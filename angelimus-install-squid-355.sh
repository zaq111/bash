cd /etc/yum.repos.d/
echo -e "
[angelimus_squid]
name=Squid beta repo for CentOS Linux 6 - $basearch
#IL mirror
baseurl=http://www1.ngtech.co.il/repo/centos/6/beta/$basearch/
failovermethod=priority
enabled=1
gpgcheck=0" >> angelimus.repo
sleep 1
yum-config-manager --enable angelimus_squid
