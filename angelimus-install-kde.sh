#!/bin/bash
yum -y groupinstall "KDE Desktop"
yum -y install tigervnc-server xorg-x11-fonts-Type1 firefox
clear
vncserver