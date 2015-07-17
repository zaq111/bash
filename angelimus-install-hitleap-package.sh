clear
echo "INSTALL WINE NEED EPEL"
echo "==============================="
sleep 2
yum -y install epel-release
sleep 2
yum -y update
sleep 2
yum -y groupinstall 'Development Tools'
sleep 2
yum -y install libX11-devel freetype-devel zlib-devel libxcb-devel
sleep 2
yum -y install wine
clear
echo "CPU LIMIT NEED EPEL"
echo "=============================="
sleep 2
yum -y install cpulimit
clear
echo "KDE"
echo "=============================="
sleep 2
yum -y groupinstall "KDE Desktop"
yum -y install tigervnc-server xorg-x11-fonts-Type1 firefox
clear
vncserver
