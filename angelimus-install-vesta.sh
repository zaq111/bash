echo "*********************************************"
echo " "
echo "Welcome to angelimus.com installer"
echo " "
echo "This will install VestaCP into your VPS"
echo " "
echo "*********************************************"

read -p $'Press any key to continue...\n' -n1 key
clear
echo "Starting process..."
sleep 2

wget http://vestacp.com/pub/vst-install.sh
sleep 1
sh vst-install.sh
