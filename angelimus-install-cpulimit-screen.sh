clear
yum -y install epel-release
sleep 1
yum -y update
sleep 2
yum -y install cpulimit
yum -y install screen
echo "Done"
echo "Type cpulimit -h for showing help menu"
