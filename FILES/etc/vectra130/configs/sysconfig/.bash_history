git tag
git tag 1.13.1
git push --tag
nano Make.config 
StreamingClient -v
./StreamingClient -v
make install
StreamingClient -v
nano INCLUDES/init.cpp 
mount -o rw,remount /boot
nano /boot/cmdline.txt
mount -o ro,remount /boot
make
make install
cd UPDATE/
./update.sh create
cd ..
grep VERSION *
grep VERSION INCLUDES/*
nano INCLUDES/system.cpp 
grep getVersion INCLUDES/*
nano INCLUDES/system.cpp 
nano Make.config 
make -j2
make install
cat /etc/vectra130/VERSION 
reboot
cat /etc/vectra130/VERSION 
cd /usr/local/src/cplusplus/VDR/StreamingClient/
make clean
grep VERSION INCLUDES/*
grep VERSION INCLUDES/*
make -j2
make install
StreamingClient -v
reboot
cat /etc/vectra130/VERSION 
nano /etc/vectra130/VERSION 
cd /usr/local/src/cplusplus/VDR/StreamingClient/UPDATE/
./update.sh create
nano update.sh 
./update.sh upload
./update.sh create
tail -f /etc/vectra130/update.log 
cat /etc/vectra130/VERSION 
cd /usr/local/src/cplusplus/VDR/StreamingClient/UPDATE/
nano update.sh 
StreamingClient -v
StreamingClient -v | sed 's/Streaming.*v\(.*\) by.*/\1/g
StreamingClient -v | sed 's/Streaming.*v\(.*\) by.*/\1/g'
StreamingClient -v | grep Streaming | sed 's/Streaming.*v\(.*\) by.*/\1/g'
nano update.sh 
./update.sh create
pidof -x vdr
killall vdr
journalctl -u streamingclient -f
ln -s /etc/vectra130/configs/kodiconfig/ /etc/vectra130/configs/userconfig/.kodi
ln -s /etc/vectra130/configs/kodiconfig/ /etc/vectra130/configs/kodiconfig/.kodi
ln -s /etc/vectra130/configs/kodiconfig/ /etc/vectra130/configs/.kodi
ln -s /etc/vectra130/configs/kodiconfig/ /etc/vectra130/.kodi
nano /usr/bin/kodi
ls /etc/vectra130/configs/kodiconfig/
ls -a /etc/vectra130/configs/kodiconfig/
ls -a /etc/vectra130/configs/kodiconfig/.kodi
journalctl -u kodi
journalctl -u streamingclient -r
ls -l /etc/vectra130/configs/kodiconfig/temp/
ls -l /etc/vectra130/configs/kodiconfig/temp/
nano /usr/bin/kodi
nano /usr/bin/kodi
mount -o rw,remount /
nano /usr/bin/kodi
mount -o ro,remount /
rm /etc/vectra130/.kodi/
ls -la /etc/vectra130/
ls -l /etc/vectra130/.kodi/temp/
echo $HOME
ls -a /root/
ls -la /root/
cat /etc/passwd
ln -sv /etc/vectra130/configs/kodiconfig/ /etc/vectra130/.kodi
ln -sf /etc/vectra130/configs/kodiconfig/ /etc/vectra130/.kodi
mount -o rw,remount /
nano /usr/bin/kodi
rm /etc/vectra130/configs/.kodi
rm /etc/vectra130/configs/userconfig/.kodi
rm /etc/vectra130/configs/kodiconfig/.kodi
ls /etc/vectra130/.kodi/temp/
ls /etc/vectra130/.kodi/temp/kodi.log 
cat /etc/vectra130/.kodi/temp/kodi.log 
ls /etc/vectra130/.kodi/temp/kodi.log 
ls -a /etc/vectra130/.kodi/temp/
ls -l /etc/vectra130/
ls -la /etc/vectra130/
ln -sf /etc/vectra130/configs/kodiconfig/ /etc/vectra130/.kodi
ls -la /etc/vectra130/
pidof -x kodi
rm -r /etc/vectra130/.kodi/
ln -sf /etc/vectra130/configs/kodiconfig/ /etc/vectra130/.kodi
ls -la /etc/vectra130/
killall vdr
cd /usr/local/src/cplusplus/VDR/StreamingClient/UPDATE/
nano file_tree 
nano /etc/systemd/system/kodi.service 
nano /usr/bin/kodi
ps aux | grep kodi
nano /etc/default/kodi 
nano /usr/bin/kodi
mount -o rw,remount /
nano /usr/bin/kodi
mount -o ro,remount /
nano file_tree 
nano update.sh 
rm PATCHES/usr/bin/kodi.diff 
journalctl -u vdr.service 
cd ../
nano INCLUDES/frontend.cpp 
make
make install
mount -o ro,remount /
cd /usr/local/src/cplusplus/VDR/StreamingClient/UPDATE/
nano file_tree 
./update.sh create
svdrpsend help
StreamingClient -v
killall vdr
journalctl -u streamingclient -r
cd /usr/local/src/cplusplus/VDR/StreamingClient/
nano INCLUDES/frontend.cpp 
journalctl -u streamingclient -r
nano /etc/dbus-1/system.d/de.tvdr.vdr.conf 
journalctl -u streamingclient -r
journalctl -u dbus.service 
journalctl -u dbus.service 
journalctl -u streamingclient -r
nano /etc/dbus-1/system.d/de.tvdr.vdr.conf 
systemctl status dbus.service 
systemctl restart dbus.service 
systemctl status dbus.service 
systemctl status dbus.service -l
  vdr-dbus-send.sh /Plugins/<pluginname> plugin.SVDRPCommand string:'command' string:'parameter'
  vdr-dbus-send.sh /Plugins/test plugin.SVDRPCommand string:'command' string:'parameter'
which vdr-dbus
nano INCLUDES/remote.cpp 
  dbus-send /Plugins/test plugin.SVDRPCommand string:'command' string:'parameter'
systemctl status dbus.service -l
nano /etc/vectra130/configs/vdrconfig/conf.d/21-dbus2vdr.conf 
cd /usr/local/src/cplusplus/VDR/StreamingClient/
nano INCLUDES/frontend.cpp 
git status
git diff
nano INCLUDES/frontend.cpp 
make
grep VERSION INCLUDES/*
nano INCLUDES/system.cpp INCLUDES/version.cpp 
nano INCLUDES/system.cpp INCLUDES/version.cpp 
nano INCLUDES/system.h INCLUDES/version.h
nano INCLUDES/system.cpp INCLUDES/version.cpp 
make
nano INCLUDES/version.cpp 
make
make clean
make
git add INCLUDES/version.* INCLUDES/system.*
git commit -m "bugfix versions angabe"
git diff
git add INCLUDES/frontend.cpp 
git commit -m "nulldevice abfrage in extra thread mit timeout"
git status
git add -A
git commit -m version
git push
git status
nano UPDATE/file_tree 
nano /etc/vectra130/configs/sysconfig/.config.template 
nano /etc/vectra130/www/config/scripts/updateStreamingClient.sh 
/etc/vectra130/www/config/scripts/updateStreamingClient.sh check
nano /etc/vectra130/www/config/scripts/updateStreamingClient.sh 
/etc/vectra130/www/config/scripts/updateStreamingClient.sh check
nano /etc/vectra130/www/config/scripts/updateStreamingClient.sh 
/etc/vectra130/www/config/scripts/updateStreamingClient.sh check
nano /etc/vectra130/www/config/scripts/updateStreamingClient.sh 
/etc/vectra130/www/config/scripts/updateStreamingClient.sh check
nano /etc/vectra130/www/config/scripts/updateStreamingClient.sh 
/etc/vectra130/www/config/scripts/updateStreamingClient.sh check
nano /etc/vectra130/www/config/scripts/updateStreamingClient.sh 
/etc/vectra130/www/config/scripts/updateStreamingClient.sh check
nano /etc/vectra130/www/config/scripts/updateStreamingClient.sh 
/etc/vectra130/www/config/scripts/updateStreamingClient.sh check
nano /etc/vectra130/www/config/scripts/updateStreamingClient.sh 
cat /etc/vectra130/configs/userconfig/config | grep "C:STABLEONLY" | awk -F: '{ print $3 }'
cat /etc/vectra130/configs/sysconfig/config | grep "C:STABLEONLY" | awk -F: '{ print $3 }'
cat /etc/vectra130/configs/sysconfig/.config.template | grep "C:STABLEONLY" | awk -F: '{ print $3 }'
nano /etc/vectra130/configs/sysconfig/.config.template 
cat /etc/vectra130/configs/sysconfig/.config.template | grep "C:STABLEONLY" | awk -F: '{ print $3 }'
nano /etc/vectra130/www/config/scripts/updateStreamingClient.sh 
nano /etc/vectra130/configs/sysconfig/.config.template 
/etc/vectra130/www/config/scripts/updateStreamingClient.sh check
nano /etc/vectra130/VERSION 
/etc/vectra130/www/config/scripts/updateStreamingClient.sh check
nano /etc/vectra130/VERSION 
/etc/vectra130/www/config/scripts/updateStreamingClient.sh check
nano /etc/vectra130/www/config/scripts/updateStreamingClient.sh /etc/vectra130/www/config/scripts/updateStreamingServer.sh 
scp -r /etc/vectra130/www/* 192.168.1.80:/etc/vectra130/www/
nano /etc/vectra130/configs/sysconfig/.config.template 
nano /etc/vectra130/configs/sysconfig/.config.template 
nano /etc/vectra130/configs/sysconfig/.config.template 
nano /etc/vectra130/www/config/scripts/updateStreamingClient.sh 
cat /etc/vectra130/update/UPDATE.info 
cat /etc/vectra130/update/UPDATE.info | awk -F: '{ print $2 }'
nano /etc/vectra130/www/config/scripts/updateStreamingClient.sh 
cat /etc/vectra130/update/UPDATE.info | awk -F: '{ print $2- }'
cat /etc/vectra130/update/UPDATE.info | awk -F: '{ print $2.. }'
cat /etc/vectra130/update/UPDATE.info | awk -F: '{ print $2$3 }'
cat /etc/vectra130/update/UPDATE.info | awk -F: '{ print $2:$3 }'
nano /etc/vectra130/www/config/scripts/updateStreamingClient.sh 
cat /etc/vectra130/update/UPDATE.info
cat /etc/vectra130/update/UPDATE.info | sed 's/.+[A-Z]:\(.*\)/\1/'
cat /etc/vectra130/update/UPDATE.info | sed 's/.+[A-Z][:]\(.*\)/\1/'
cat /etc/vectra130/update/UPDATE.info | sed 's/.*[A-Z][:]\(.*\)/\1/'
nano /etc/vectra130/www/config/scripts/updateStreamingClient.sh 
/etc/vectra130/www/config/scripts/updateStreamingClient.sh check
nano /etc/vectra130/VERSION 
/etc/vectra130/www/config/scripts/updateStreamingClient.sh check
nano /etc/vectra130/www/config/update.php
nano /etc/vectra130/www/config/update.php
cd /etc/vectra130/www/config/
nano scripts/updateStreamingClient.sh scripts/updateStreamingServer.sh 
scripts/updateStreamingServer.sh check
scripts/updateStreamingClient.sh check
diff -u scripts/updateStreamingClient.sh scripts/updateStreamingServer.sh 
cp scripts/updateStreamingClient.sh scripts/updateStreamingServer.sh 
nano scripts/updateStreamingServer.sh 
scp scripts/updateStreaming* 192.168.1.80:/etc/vectra130/www/config/scripts/
scp update.php 192.168.1.80:/etc/vectra130/www/config/
exit
cd /usr/local/src/cplusplus/VDR/StreamingClient/
make install
reboot
cd /usr/local/src/cplusplus/VDR/StreamingClient/
nano INCLUDES/frontend.h INCLUDES/vdr.h
nano INCLUDES/frontend.h INCLUDES/vdr.h
nano INCLUDES/frontend.cpp INCLUDES/vdr.cpp 
nano INCLUDES/frontend.cpp INCLUDES/vdr.cpp 
nano INCLUDES/vdr.h
nano INCLUDES/kodi.h
nano INCLUDES/frontend.cpp INCLUDES/kodi.cpp 
nano INCLUDES/frontend.cpp INCLUDES/music.cpp 
make clean
make -j2
nano INCLUDES/frontend.cpp 
make -j2
nano INCLUDES/frontend.h
nano INCLUDES/kodi.cpp 
grep killDaemon INCLUDES/*
grep killDaemon INCLUDES/*.h
nano INCLUDES/vdr.cpp 
nano INCLUDES/kodi.cpp 
make -j2
nano INCLUDES/frontend.h 
make clean
make -j2
nano INCLUDES/kodi.cpp 
nano INCLUDES/vdr.cpp 
make
cd /usr/local/src/cplusplus/VDR/StreamingClient/
make install
make
reboot
journalctl -u streamingclient
exit
cd /usr/local/src/cplusplus/VDR/StreamingClient/UPDATE/
nano file_tree 
nano /boot/cmdline.txt
nano /boot/config.txt
exit
fdisk -l /dev/mmcblk0 
fdisk -l /dev/mmcblk0 >> /etc/vectra130/hdd_info
cat /etc/vectra130/hdd_info 
exit
ping 192.168.1.80
CheckServer 
CheckServer 
cd /usr/local/src/cplusplus/VDR/StreamingClient/
nano INCLUDES/power.cpp 
journalctl -u streamingclient
nano INCLUDES/power.cpp 
nano INCLUDES/frontend.cpp 
make
git diff
git status
git add INCLUDES/frontend.cpp 
git commit -m "bugfix abort"
git add -A
git commit -m "optimierung beendigung der frontends"
git push
cd /usr/local/src/cplusplus/VDR/StreamingClient/
nano Make.config 
git add Make.config 
git commit -m version
watch CheckServer 
ifconfig -a
raspi-config 
mount -o rw,remount /
raspi-config 
iwlist wlan0 scan
ifup wlan0
nano /etc/network/interfaces
ifup wlan0
iwlist wlan0 scan
nano /etc/wpa_supplicant/wpa_supplicant.conf 
cd /usr/local/src/cplusplus/VDR/StreamingClient/
nano INCLUDES/init.cpp 
nano INCLUDES/net.cpp 
nano INCLUDES/net.cpp 
nano /etc/wpa_supplicant/wpa_supplicant.conf 
nano INCLUDES/net.cpp 
wpa_passphrase Vectra130 29118117110726108019059900
wpa_passphrase -h
wpa_passphrase --help
nano INCLUDES/net.cpp 
make
nano INCLUDES/net.cpp 
make
nano UPDATE/file_tree 
ls /etc/wpa_supplicant/
nano /etc/systemd/system/streamingclient-boot.service 
make install
mount -o rw,remount /boot
nano /boot/cmdline.txt
mount -o ro,remount /
mount -o ro,remount /boot
nano /etc/vectra130/configs/sysconfig/.config.template 
/usr/local/src/cplusplus/VDR/StreamingClient/UPDATE/update.sh create
ifconfig -a
systemctl status networking.service 
systemctl status networking.service 
cat /etc/vectra130/configs/sysconfig/wpa_supplicant.conf 
ifup wlan0
ifdown wlan0
ifup wlan0
ifconfig -a
cat /etc/resolv.conf 
service networking restart &
systemctl daemon-reload
service networking restart &
cat /etc/network/interfaces
ifconfig wlan0
nano /etc/wpa_supplicant/wpa_supplicant.conf 
cp /etc/vectra130/configs/sysconfig/wpa_supplicant.conf /etc/wpa_supplicant/
mount -o rw,remount /
ifconfig wlan0
service networking restart &
ifconfig wlan0
cp /etc/vectra130/configs/sysconfig/wpa_supplicant.conf /etc/wpa_supplicant/
service networking restart &
ifconfig wlan0
nano /etc/wpa_supplicant/wpa_supplicant.conf 
service networking restart &
ifconfig wlan0
iwlist wlan0 scan | egrep "(ESSID|IEEE)"
ifconfig wlan0
reboot
ifconfig wlan0
journalctl -u networking.service 
journalctl -u networking.service -l
nano /etc/wpa_supplicant/wpa_supplicant.conf 
cat /var/run/wpa_supplicant/wlan0
ifconfig wlan0 up
ifconfig wlan0
ifup wlan0 
ifdown wlan0 
ifup wlan0 
journalctl -u networking.service -l
ifconfig
nano /etc/wpa_supplicant/wpa_supplicant.conf 
nano /etc/network/interfaces
service networking restart &
systemctl daemon-reload 
service networking restart
ifconfig
nano /etc/network/interfaces
nano /etc/network/interfaces
service networking restart
ifconfig
nano /etc/network/interfaces
nano /etc/wpa_supplicant/wpa_supplicant.conf 
nano /etc/network/interfaces
service networking restart
ifconfig
cat /etc/network/interfaces
ifconfig wlan0 down
ifdown wlan0
ifconfig 
ifup wlan0
ifconfig 
ifconfig 
cat /etc/network/interfaces
cd /usr/local/src/cplusplus/VDR/StreamingClient/
nano INCLUDES/net.cpp 
cd /usr/local/src/cplusplus/VDR/StreamingClient/
nano INCLUDES/net.cpp 
nano INCLUDES/net.cpp 
make install
ln -sf /etc/vectra130/configs/sysconfig/wpa_supplicant.conf /etc/wpa_supplicant/wpa_supplicant.conf 
ls -l /etc/wpa_supplicant/wpa_supplicant.conf 
reboot
cat /etc/network/interfaces
cd /usr/local/src/cplusplus/VDR/StreamingClient/
nano INCLUDES/net.cpp 
make
make install
nano /etc/vectra130/configs/userconfig/config 
reboot
cat /etc/network/interfaces
nano /etc/vectra130/configs/sysconfig/wpa_supplicant.conf 
iwlist -h
iw -h
iw
iw wlan0 info
service networking restart
systemctl daemon-reload 
service networking restart
iw wlan0 info
ifdown wlan0
iw wlan0 info
ifup wlan0
mount -o rw,remount /
ifup wlan0
ifdown wlan0
ifup wlan0
nano /etc/network/if-pre-up.d/wpasupplicant 
nano /etc/network/interfaces
systemctl daemon-reload 
service networking restart
nano /etc/network/interfaces
service networking restart
ifconfig 
ifdown wlan0
ifup wlan0
nano /etc/network/interfaces
service networking restart
ifup wlan0
ifdown wlan0
ifup wlan0
reboot
iwlist scan
ifup wlan0
iwlist scan
ifconfig wlan0
ping 192.168.1.1
nano /etc/vectra130/configs/userconfig/config 
reboot
mount -o rw,remount /
aptitude install wicd-curses
wicd-curses 
ifconfig wlan0
wicd-curses 
nano /etc/network/interfaces
wicd -h
wicd-curses -h
pidof -x wicd
nano /etc/wicd/wireless-settings.conf 
nano /etc/wicd/wired-settings.conf 
nano /etc/wicd/manager-settings.conf 
nano /etc/wicd/dhclient.conf.template
nano /etc/wicd/dhclient.conf.template.default 
reboot
wicd-curses 
ifconfig wlan0
wicd-curses 
ifconfig 
wicd-curses 
ifconfig 
cd /usr/local/src/cplusplus/VDR/StreamingClient/
grep ifup *
grep ifup INCLUDES/*
nano INCLUDES/net.cpp 
grep -i ifup INCLUDES/*
nano INCLUDES/init.cpp 
nano INCLUDES/net.cpp 
make
systemctl status wicd.service 
nano /etc/vectra130/configs/userconfig/config 
make install
reboot
ifconfig 
ifup wlan0
ifconfig 
ifconfig 
wicd-curses 
wicd
ps aux | grep wicd
nano /etc/init.d/wicd 
rm /var/run/wicd/wicd.pid
wicd
pidof -x wicd
nano /etc/vectra130/configs/userconfig/config 
reboot
ifconfig 
