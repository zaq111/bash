clear
echo "*********************************************"
echo " "
echo "Welcome to angelimus.com installer"
echo " "
echo "This will install VestaCP into your VPS"
echo " "
echo "Read This Carefully "
echo "1. This Will Uninstall your apache first, or"
echo "   httpd service"
echo "2. This Will disable Selinux."
echo "3. Follow instruction when installing. "
echo "*********************************************"

read -p $'Press any key to continue...\n' -n1 key
clear
echo "Removing Apache / httpd..."
sleep 2
yum -y remove httpd
clear
echo "Starting process..."
sleep 2

wget http://vestacp.com/pub/vst-install.sh
sleep 1
bash vst-install.sh --force
