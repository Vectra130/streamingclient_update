git push
nano /etc/group
mount -o rw,remount /
nano /etc/passwd
killall kodi
reboot
chpasswd -h
exit
dpkg -l | grep plymouth
mount -o re,remount /
mount -o rw,remount /
aptitude install plymouth-themes 
update-alternatives --config default.plymouth
apt-cache search libpango
dpkg -l | grep pango
nano /usr/share/initramfs-tools/hooks/plymouth 
aptitude install plymouth-drm
apt-cache search plymouth drm
apt-cache search plymouth frame
update-initramfs -c -k $(uname -r)
mount -o rw,remount /boot
update-initramfs -c -k $(uname -r)
df -h
ls /var/tmp/
mount -o remount,size=100M /var/tmp/
ls /var/tmp/
ls /var/tmp/
df -h
update-initramfs -c -k $(uname -r)
uname -r
ls /boot/
nano /boot/config.txt
nano /etc/initramfs-tools/modules 
echo "export FRAMEBUFFER=/dev/fb1" | sudo tee
/etc/initramfs-tools/conf.d/fb1
nano /etc/initramfs-tools/conf.d/fb1
plymouth-set-default-theme text
update-initramfs -u
nano /boot/config.txt
nano /boot/cmdline.txt
ls/bo
ls/bo
ls /boot
ls /boot l
ls /boot -l
ls /boot -lh
cd /usr/local/src/cplusplus/VDR/StreamingClient/
nano BootSequenz.cpp 
nano INCLUDES/init.cpp 
make
make install
reboot
cd /usr/local/src/cplusplus/VDR/StreamingClient/UPDATE/
nano update.sh
git add -A
git commit -m 1.13.1
git push
nano update.sh
nano prepare_update.sh 
nano update.sh prepare_update.sh 
git add -A
git add -A; git commit -m 1.13.1; git push
git add -A; git commit -m 1.13.1; git push
nano prepare_update.sh 
git add -A; git commit -m bugfix; git push
nano prepare_update.sh 
nano /etc/vectra130/www/config/update.php
nano FILES/scripts/updateStreamingClient.sh 
nano /etc/vectra130/www/config/update.php
nano FILES/scripts/updateStreamingClient.sh 
nano prepare_update.sh 
nano update.sh
nano update.sh
git add -A; git commit -m bugfix; git push
ls /etc/vectra130/sysimages/
nano update.sh
mkdir FILES/www
cp -ra /etc/vectra130/www/* FILES/www/
nano update.sh
git add -A; git commit -m bugfix; git push
nano /etc/vectra130/www/config/update.php
git add -A; git commit -m bugfix; git push
cp -ra /etc/vectra130/www/* FILES/www/
git status
nano update.sh
echo -e \e > /dev/tty
echo -e \e > /dev/tty1
echo -e e > /dev/tty1
chvt 1
echo -e e > /dev/tty1
echo e > /dev/tty1
chvt 2
nano update.sh
nano prepare_update.sh 
nano prepare_update.sh 
git add -A; git commit -m bugfix; git push
nano update.sh
git add -A; git commit -m bugfix; git push
mkdir FILES/sysimages FILES/sysvideos
cp -ra /etc/vectra130/sysimages/* FILES/sysimages/
cp -ra /etc/vectra130/sysvideos/* FILES/sysvideos/
nano update.sh
ping 192.168.1.81
nano update.sh
dpkg -h
dpkg --help
aptitude -h
nano update.sh
debconf-get-selections | grep proftp
debconf-set-selections -h
debconf-set-selections -c proftpd-basic   shared/proftpd/inetd_or_standalone      select  inetd
nano /etc/debconf.conf 
nano update.sh
debconf-get-selections | grep proftp
debconf-get-selections | grep proftp >> FILES/debconf/selections
mkdir FILES/debconf
debconf-get-selections | grep proftp >> FILES/debconf/selections
git add -A; git commit -m bugfix; git push
nano update.sh
nano update.sh
nano update.sh
git add -A; git commit -m bugfix; git push
ls FILES/
mkdir configs
cp -ra /etc/vectra130/configs/vdrconfig/conf.* FILES/vdr/vdrconfig/
rmdir configs/
mkdir FILES/vdr/vdrconfig
cp -ra /etc/vectra130/configs/vdrconfig/conf.* FILES/vdr/vdrconfig/
cp -ra /etc/vectra130/configs/vdrconfig/plugins FILES/vdr/vdrconfig/
cp -ra /etc/vectra130/configs/vdrconfig/diseqc.conf FILES/vdr/vdrconfig/
cp -ra /etc/vectra130/configs/vdrconfig/remote.conf FILES/vdr/vdrconfig/
cp -ra /etc/vectra130/configs/vdrconfig/themes FILES/vdr/vdrconfig/
du -hs /etc/vectra130/configs/vdrconfig/plugins/
du -hs /etc/vectra130/configs/vdrconfig/plugins/*
du -hs /etc/vectra130/configs/vdrconfig/plugins/skindesigner/*
nano update.sh
cd ..
nano INCLUDES/vdr.cpp 
ls -l /dev/vchiq 
chmod 666 /dev/vchiq 
ls -l /dev/vchiq 
grep chmod INCLUDES/*
nano INCLUDES/vdr.cpp 
make
make install
cp StreamingClient UPDATE/FILES/streamingclient/
cd UPDATE/
git status; git add -A; git commit -m bugfix; git push
git add -A; git commit -m bugfix; git push
nano FILES/www/config/update.php
nano FILES/www/config/update.php
git status; git add -A; git commit -m bugfix; git push
mkdir FILES/dbus
cp -r /etc/dbus-1/system.d/de.tvdr.vdr.conf FILES/dbus/
nano update.sh
nano FILES/dbus/de.tvdr.vdr.conf 
ls -l /etc/vectra130/data/vdr/
mount -o rw,remount /
rmd /var/cache/vdr/epgimages/images/
rmdir /var/cache/vdr/epgimages/images/
rmdir /var/cache/vdr/epgimages/
rmdir /var/cache/vdr
ls -l /usr/bin/vdr 
nano update.sh
nano update.sh
nano /etc/passwd
nano update.sh
nano /etc/group
nano update.sh
git status; git add -A; git commit -m bugfix; git push
nano update.sh
git status; git add -A; git commit -m bugfix; git push
ls /etc/vectra130/configs/vdrconfig/plugins/fritzbox/
nano update.sh
nano update.sh
cd /usr/local/src/cplusplus/VDR/StreamingClient/UPDATE/
nano update.sh
nano update.sh
cat /etc/passwd | grep ^"vdr:x:1001:1001::/etc/vectra130/configs/vdrconfig:/bin/bash"
cat /etc/passwd | grep ^vdr:x:1001:1001::/etc/vectra130/configs/vdrconfig:/bin/bash
cat /etc/passwd | grep ^vdr:x:1001:1001
cat /etc/passwd | grep ^vdr
nano update.sh
nano update.sh
echo -e \e[3mhallo\e[0m
echo -e "\e[3mhallo\e[0m"
echo -e "\e[1mhallo\e[0m"
echo -e "\e[2mhallo\e[0m"
echo -e "\e[3mhallo\e[0m"
echo -e "\e[4mhallo\e[0m"
echo -e "\e[5mhallo\e[0m"
echo -e "\e[6mhallo\e[0m"
echo -e "\e[7mhallo\e[0m"
echo -e "\e[8mhallo\e[0m"
echo -e "\e[9mhallo\e[0m"
echo -e "\e[10mhallo\e[0m"
echo -e "\e[11mhallo\e[0m"
echo -e "\e[12mhallo\e[0m"
echo -e "\e[13mhallo\e[0m"
echo -e "\e[14mhallo\e[0m"
echo -e "\e[15mhallo\e[0m"
echo -e "\e[16mhallo\e[0m"
echo -e "\e[17mhallo\e[0m"
echo -e "\e[18mhallo\e[0m"
echo -e "\e[19mhallo\e[0m"
echo -e "\e[20mhallo\e[0m"
nano /etc/vectra130/scripts/VDR_BUILD_INSTALL.sh 
echo -e "\e[33mhallo\e[0m"
nano update.sh
nano /etc/vectra130/scripts/VDR_BUILD_INSTALL.sh 
nano update.sh
nano /etc/vectra130/scripts/VDR_BUILD_INSTALL.sh 
nano update.sh
nano update.sh
df -h
apt-get clean
mount -o rw,remount /
apt-get clean
mount -o ro,remount /
df -h
git status; git add -A; git commit -m bugfix; git push
nano /etc/vectra130/www/config/index.php
ls -l /etc/hostname 
nano /etc/hos
ls -l /etc/ | grep ^l
ls /tmp_system/
nano update.sh
git status; git add -A; git commit -m bugfix; git push
nano ../FILES/configs/.config.template 
nano /etc/vectra130/configs/sysconfig/config
nano ../FILES/configs/.config.template 
cp -a /etc/vectra130/configs/sysconfig/.config.template FILES/streamingclient/
nano update.sh
ls FILES/
ls FILES/streamingclient/
nano update.sh
nano ../Makefile 
git status; git add -A; git commit -m bugfix; git push
diff -u update.sh update.sh.save 
rm update.sh.save 
git status; git add -A; git commit -m bugfix; git push
nano /etc/vectra130/VERSION 
nano FILES/www/config/update.php
nano update.sh 
mv FILES/scripts/updateStreamingClient.sh FILES/www/config/scripts/
rm FILES/scripts/aa-StreamingClientBoot 
nano FILES/scripts/powertest.sh 
rm FILES/scripts/powertest.sh 
ls FILES/scripts/
ls -l /etc/vectra130/scripts/
nano update.sh 
ls FILES/streamingclient/
ls FILES/streamingclient/ -a
git status; git add -A; git commit -m bugfix; git push
top
dpkg -l | grep syslog
systemctl start syslog.service 
nano /etc/systemd/system/syslog.service
systemctl start rsyslog.service 
echo test > /tmp/test > /tmp/test2
cat /tmp/test
cat /tmp/test2
top
cat /etc/passwd
exit
ls -la /etc/vectra130/
ls -la /etc/vectra130/configs/kodiconfig/
rm /etc/vectra130/configs/kodiconfig/.kodi
rm /etc/vectra130/configs/kodiconfig/kodiconfig 
ls -la /etc/vectra130/configs/kodiconfig/
journalctl -u streamingclient -r
ls -l /boot/
echo vdr > /tmp/.frontendSet 
journalctl -u vdr.service -r
nano /usr/local/src/vdr-2.2.0/thread.c
nano /etc/systemd/system/vdr.service 
mount -o rw,remount /
nano /etc/systemd/system/vdr.service 
mount -o ro,remount /
nano /etc/vectra130/configs/vdrconfig/conf.avail/00-vdr.conf 
y
echo suspend > /tmp/.frontendSet 
journalctl -u vdr.service -r
journalctl -u vdr.service -r
pidof -x vdr
echo vdr > /tmp/.frontendSet 
journalctl -u vdr.service -r
ls -l /etc/vectra130/configs/vdrconfig/
cd /usr/local/src/cplusplus/VDR/StreamingClient/UPDATE/
nano update.sh 
cat /etc/passwd
cat /etc/group
nano update.sh 
delgroup 1001
delgroup 1002
nano update.sh 
git status; git add -A; git commit -m bugfix; git push
nano FILES/vdr/vdrconfig/conf.avail/00-vdr.conf 
nano FILES/vdr/vdr.service 
git status; git add -A; git commit -m bugfix; git push
nano /etc/vectra130/VERSION 
top
journalctl -u streamingclient -r
journalctl -u vdr.service 
cat /etc/passwd
cat /etc/group
cd /usr/local/src/cplusplus/VDR/StreamingClient/UPDATE/
nano update.sh 
chown -R vdr:vdr /etc/vectra130/configs/vdrconfig
addgroup --gid 1001 vdr
cat /etc/group
delgroup ftp
addgroup --gid 1001 vdr
delgroup ftp
deluser vdr
mount -o rw,remount /
delgroup ftp
cat /etc/group
nano update.sh 
deluser ftp
nano update.sh 
git status; git add -A; git commit -m bugfix; git push
deluser vdr
delgroup ftp
cat /etc/group
nano /etc/vectra130/VERSION 
ls /etc/vectra130/update/
nano /etc/vectra130/www/config/scripts/updateStreamingClient.sh 
/etc/vectra130/www/config/scripts/updateStreamingClient.sh update &
/etc/vectra130/update/prepare_update.sh &
nano update.sh 
pidof -x update.sh
/etc/vectra130/update/prepare_update.sh 
journalctl -u vdr.service -r
systemctl status kodi.service 
pa aux | grep vdr
ps aux | grep vdr
ps aux | grep kodi
ls -l /etc/vectra130/configs/vdrconfig/
ls -l /etc/vectra130/configs/vdrconfig/conf.d/
cd /usr/local/src/cplusplus/VDR/StreamingClient/
nano INCLUDES/vdr.cpp 
make
make install
cat /etc/passwd
cat /etc/group
nano UPDATE/update.sh 
nano UPDATE/update.sh 
usermod -a -G video,audio,sudo,cdrom,plugdev,users,dialout,dip,input,kodi vdr
cat /etc/group
nano UPDATE/update.sh 
cat /etc/passwd
nano UPDATE/FILES/kodi/kodi.service 
nano /etc/vectra130/configs/userconfig/
cd /usr/local/src/cplusplus/VDR/StreamingClient/UPDATE/
tree ./
tree -h
tree --help
tree -d
nano file_tree
ls FILES/vdr/vdrconfig/
nano file_tree
ls FILES/kodi/
nano file_tree
ls FILES/streamingclient/
nano file_tree
nano file_tree
ls FILES/proftpd/
ls /etc/proftpd/
nano file_tree
ls /etc/dbus-1/system.d/de.tvdr.vdr.conf 
nano file_tree
nano update.sh 
./update.sh 
./update.sh create
nano update.sh 
nano /etc/vectra130/scripts/sysinfo.sh 
nano /etc/vectra130/scripts/VDR_BUILD_INSTALL.sh 
nano /etc/vectra130/scripts/VDR_BUILD_INSTALL.sh 
nano update.sh 
./update.sh create
nano update.sh 
./update.sh create
nano update.sh 
./update.sh create
dirname --help
nano update.sh 
./update.sh create
nano update.sh 
./update.sh create
nano update.sh 
rsync -h
nano update.sh 
./update.sh create
ls TEST/
tree TEST/ -d
nano update.sh 
./update.sh create
nano file_tree 
./update.sh create
ls /etc/vectra130/configs/vdrconfig/
nano file_tree 
cp --help
cp --help
nano update.sh 
./update.sh createt
nano update.sh 
./update.sh create
rsync --help
cp -h
cp --help
nano update.sh 
./update.sh 
./update.sh create
nano update.sh 
./update.sh create
rm -r TEST/
./update.sh create
nano update.sh 
./update.sh create
ls FILES/
cat file_tree 
ls FILES/apt/
nano update.sh 
cat file_tree 
nano file_tree 
nano update.sh 
nano update.sh 
./update.sh create
cat TEST/debconf/selections 
cd /usr/local/src/cplusplus/VDR/StreamingClient/UPDATE/
ls -a /etc/vectra130/configs/sysconfig/
nano /etc/vectra130/configs/sysconfig/VDR-Streaming-Client.service 
ls -l /etc/avahi/services/VDR-Streaming-Client.service 
nano update.sh 
ls -la /etc/avahi/services/
nano update.sh 
cd ..
nano INCLUDES/standards.h 
grep SYS_CONF_DIR *
grep SYS_CONF_DIR INCLUDES/*
make clean
make -j2
make install
mv /etc/vectra130/configs/sysconfig/config /etc/vectra130/configs/userconfig/
cd UPDATE/
ls -la /etc/vectra130/configs/sysconfig/
nano /etc/vectra130/configs/sysconfig/hostname 
rm /etc/vectra130/configs/sysconfig/hostname 
ls -la /etc/vectra130/configs/sysconfig/
nano file_tree 
nano file_tree 
nano update.sh 
rm -h
rm --help
nano update.sh 
ls -l /etc/ | grep ^l
nano update.sh 
reboot
cd /usr/local/src/cplusplus/VDR/StreamingClient/UPDATE/
nano update.sh 
mount -o rw,remount /boot
nano /boot/config.txt
nano update.sh 
nano file_tree 
nano /boot/cmdline.txt
nano update.sh 
nano file_tree 
cat file_tree 
nano update.sh 
nano file_tree update.sh 
nano file_tree 
nano update.sh 
nano update.sh file_tree 
nano update.sh file_tree 
nano update.sh file_tree 
nano update.sh file_tree 
nano update.sh file_tree 
ls -la /etc/vectra130/configs/vdrconfig/
nano update.sh file_tree 
nano update.sh file_tree 
nano update.sh file_tree 
nano update.sh file_tree 
nano update.sh file_tree 
nano update.sh /tmp/test
nano update.sh /tmp/test
chmod +x /tmp/test 
nano /tmp/test 
/tmp/test 
nano /tmp/test 
nano update.sh /tmp/test
/tmp/test 
/tmp/test 
nano /tmp/test 
du -hs TEST
du -s TESTr
du -s TEST
nano update.sh 
cp update.sh update.sh.bkp
nano update.sh 
