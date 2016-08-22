#!/bin/sh

# set shell to bash
echo "dash dash/sh boolean false" | debconf-set-selections && dpkg-reconfigure -p critical dash
debconf-show dash

# Add zh_TW.utf8
locale -a
locale-gen zh_TW.UTF-8
locale -a

#set timezone
echo "Asia/Taipei" >  /etc/timezone
dpkg-reconfigure --frontend noninteractive tzdata

#set wireshark for user
dpkg-reconfigure wireshark-common 
usermod -a -G wireshark $USER
reboot

