#!/bin/sh

echo "deb http://packages.linuxmint.com debian import" >> /etc/apt/sources.list
echo "deb http://http.us.debian.org/debian/ testing non-free contrib main" >> /etc/apt/sources.list
echo "deb http://ftp.de.debian.org/debian squeeze main" >> /etc/apt/sources.list

gpg --keyserver pgp.mit.edu --recv-keys 3EE67F3D0FF405B2
gpg --export 3EE67F3D0FF405B2 > 3EE67F3D0FF405B2.gpg
apt-key add ./3EE67F3D0FF405B2.gpg
rm ./3EE67F3D0FF405B2.gpg

apt-get update
apt-get upgrade -y

apt-get install jwm xvt -y
apt-get install vnc4server -y
vncserver
vncserver –kill :1
cd ~
> .vnc/xstartup

echo "
#!/bin/sh
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
jwm &
[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
xsetroot -solid grey
vncconfig -iconic &
" > .vnc/xstartup

wget –-no-check-certificate https://raw.githubusercontent.com/zaq111/script/master/vncserver 
cp vncserver /etc/init.d/vncserver
chmod +x /etc/init.d/vncserver

echo "
VNCSERVERS="1:root"
VNCSERVERARGS[1]="-geometry 1024x768"
" > /etc/vncserver/vncservers.conf

update-rc.d vncserver defaults 99
apt-get install firefox -y
wget –-no-check-certificate https://raw.githubusercontent.com/zaq111/bash/master/alexamaster.iim
wget –-no-check-certificate https://raw.githubusercontent.com/zaq111/bash/master/vps.js
apt-get install libdbus-glib-1-2 -y
apt-get install libasound2 -y
apt-get install libgtk2.0-0 -y
