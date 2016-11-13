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
cd /usr/local/src/cplusplus/VDR/StreamingClient/
make
StreamingClient -v
./StreamingClient -v
make
./StreamingClient -v
cd UPDATE/
./update.sh create
cd /usr/local/src/cplusplus/VDR/StreamingClient/
cd UPDATE/
nano VERSION
git push
git add VERSION 
git commit -m "abwärtskompatibilität"
git push
nano /etc/wicd/manager-settings.conf 
top
uptime
echo vdr > /tmp/.frontendSet 
echo suspend > /tmp/.frontendSet 
top
echo vdr > /tmp/.frontendSet 
top
echo suspend > /tmp/.frontendSet 
top
top
echo kodi > /tmp/.frontendSet 
top
echo suspend > /tmp/.frontendSet 
top
exit
cd /usr/local/src/cplusplus/VDR/StreamingClient/UPDATE/
nano file_tree 
ls FILES/etc/vectra130/configs/sysconfig/
ls /etc/vectra130/configs/sysconfig/
ls -l /etc/network/
nano file_tree 
ls -l /etc/
nano file_tree 
nano update.sh 
apt-key adv --keyserver keyserver.ubuntu.com --recv-key 5243CDED; echo x$?
apt-key adv --keyserver keyserver.ubuntud.com --recv-key 5243CDED; echo x$?
apt-key adv --keyserver keyserver.ubuntu.com --recv-key 5243CDEj; echo x$?
nano update.sh 
nano update.sh 
df -h
lsblk
lsblk -h
lsblk --output SIZE
lsblk /dev/mmcblk3 --output SIZE
lsblk /dev/mmcblk0p3 --output SIZE
lsblk /dev/mmcblk0p3 --output SIZE -d
lsblk /dev/mmcblk0p3 --output SIZE -i
lsblk /dev/mmcblk0p3 --output SIZE -l
lsblk /dev/mmcblk0p3 --output SIZE -n
lsblk /dev/mmcblk0p3 --output SIZE -n
df -h | grep mmcblk0p3
df -h | grep mmcblk0p3 | awk '{ print $4 }'
nano update.sh 
df | grep mmcblk0p3 | awk '{ print $4 }'
df -m | grep mmcblk0p3 | awk '{ print $4 }'
nano update.sh 
df -m | grep mmcblk0p4 | awk '{ print $4 }'
nano update.sh 
cd /usr/local/src/cplusplus/VDR/StreamingClient/
nano INCLUDES/kodi.cpp 
nano INCLUDES/kodi.h
nano INCLUDES/frontend.h 
nano INCLUDES/frontend.h INCLUDES/kodi.h INCLUDES/vdr.h INCLUDES/music.h INCLUDES/web.h
nano INCLUDES/frontend.h INCLUDES/kodi.h INCLUDES/vdr.h INCLUDES/music.h INCLUDES/web.h
nano INCLUDES/kodi.h
nano INCLUDES/kodi.cpp 
make clean
make
nano INCLUDES/frontend.cpp 
make
git status
git diff
git status
git add INCLUDES/frontend.*
git add INCLUDES/[kmvw].*
git add INCLUDES/kodi.*
git add INCLUDES/vdr.h 
git add INCLUDES/music.h 
git add INCLUDES/web.h 
git status 
git commit -m "defines verschoben"
cd /usr/local/src/cplusplus/VDR/StreamingClient/
nano INCLUDES/init.cpp 
nano INCLUDES/net.cpp 
nano INCLUDES/net.cpp 
cd /usr/local/src/cplusplus/VDR/StreamingClient/
nano INCLUDES/kodi.cpp 
make
make install
reboot
echo kodi > /tmp/.frontendSet 
journalctl -u streamingclient -r
echo suspend > /tmp/.frontendSet 
journalctl -u streamingclient -r
journalctl -u streamingclient -r
cd /usr/local/src/cplusplus/VDR/StreamingClient/UPDATE/
nano prepare_update.sh 
nano ../INCLUDES/frontend.cpp 
nano prepare_update.sh 
nano /usr/local/src/cplusplus/VDR/StreamingClient/UPDATE/update.sh 
exit
top
journalctl -u  streamingclient -r
journalctl -u  streamingclient -r
killall StreamingClient 
journalctl -u  streamingclient -r
pidof -x StreamingClient 
killall StreamingClient -9
pidof -x StreamingClient 
reboot
cd /usr/local/src/cplusplus/VDR/StreamingClient/
nano INCLUDES/video.cpp 
nano INCLUDES/png2fb.c
make
nano INCLUDES/png2fb.c
make
nano INCLUDES/png2fb.c
make
nano INCLUDES/avahi.c INCLUDES/png2fb.c
nano INCLUDES/avahiBrowse.c INCLUDES/png2fb.c
make
nano INCLUDES/avahiBrowse.c INCLUDES/png2fb.c
make
nano INCLUDES/png2fb.c
make
git status
git diff
exit
nano /etc/apt/sources.list.d/kodi.list 
mount -o rw,remount /
nano /etc/apt/sources.list.d/kodi.list 
aptitude update
aptitude install kodi
nano /etc/vectra130/VERSION 
nano /etc/apt/sources.list.d/kodi.list 
aptitude update
aptitude install kodi
nano /etc/apt/sources.list.d/kodi.list 
cd /usr/local/src/cplusplus/VDR/StreamingClient/
killall StreamingClient 
./StreamingClient -d
pidof -x StreamingClient 
journalctl -u streamingclient -r
killall StreamingClient 
killall StreamingClient 
killall StreamingClient 
killall StreamingClient -9
killall StreamingClient 
killall StreamingClient 
service streamingclient start
journalctl -u streamingclient -r
echo vdr > /tmp/.frontendSet 
journalctl -u streamingclient -r
top
echo suspend > /tmp/.frontendSet 
top
make install
service streamingclient stop
service streamingclient start
journalctl -u streamingclient -f
echo vdr > /tmp/.frontendSet 
top
journalctl -u streamingclient -f
pidof -x StreamingClient 
top
ps aux | grep Stre
journalctl -u streamingclient -f
echo suspend > /tmp/.frontendSet 
journalctl -u streamingclient -f
echo vdr > /tmp/.frontendSet 
journalctl -u streamingclient -f
service streamingclient stop
journalctl -u streamingclient -f
service streamingclient start
journalctl -u streamingclient -f
top
pidof -x vdr
cat /tmp/.frontendSet 
journalctl -u streamingclient -f
echo suspend > /tmp/.frontendSet 
journalctl -u streamingclient -f
reboot
journalctl -u streamingclient -f
pidof -x StreamingClient 
free -h
cd /usr/local/src/cplusplus/VDR/StreamingClient/
git status
git diff INCLUDES/png2fb.c
nano INCLUDES/png2fb.c
make
make install
reboot
