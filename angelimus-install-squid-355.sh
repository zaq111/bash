cd /etc/yum.repos.d/
wget https://raw.githubusercontent.com/zaq111/bash/master/angelimus-repo-squid355.repo
yum-config-manager --enable angelimus_squid
yum -y update
