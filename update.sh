#/bin/bash
#1.13.1
#Updatefile zum updaten des StreamingClients

UPDATEDIR="/etc/vectra130/update/git_update_files"
SYSTEMDDIR="/etc/systemd/system"
BINDIR="/usr/bin"
TTY=/dev/tty1

logger -t UPDATE installiere Files
cd $UPDATEDIR
sleep 5
#updateinfos zeigen
chvt 1
echo -e "\e[3J" > $TTY
echo -e "\n\e[34m############################## UPDATEVERLAUF ##############################\e[0m\n" > $TTY
echo -e "\n\e[33m########## Updatefiles heruntergeladen\e[0m" > $TTY

echo -e "\n\e[33m########## Erstelle read-write Filesystem ...\e[0m" > $TTY
mount -o rw,remount /
mount -o remount,size=256M /tmp

#system
echo -e "\n\e[33m########## Aktualisiere System Files ...\e[0m" > $TTY
rm -r /etc/vectra130/bin
rm -r /etc/hostname
echo "rpi-vdr" > /etc/hostname
cp -a FILES/fstab/fstab /etc/
cp -ra FILES/apt/* /etc/apt/
apt-key adv --keyserver keyserver.ubuntu.com --recv-key 5243CDED
aptitude -y update
dpkg --configure -a
debconf-set-selections FILES/debconf/selections

#swapfile
if [ ! -e /etc/vectra130/swapfile ]; then
	echo -e "\n\e[33m########## Erstelle Swap File ...\e[0m" > $TTY
	dd if=/dev/zero of=/etc/vectra130/swapfile bs=1M count=2048
	chown root:root /etc/vectra130/swapfile
	chown 0600 /etc/vectra130/swapfile
	mkswap /etc/vectra130/swapfile
	swapon /etc/vectra130/swapfile
fi

#proftpd
echo -e "\n\e[33m########## Aktualisiere proftpd ...\e[0m" > $TTY
aptitude -y --no-gui install proftpd-basic
cp -ra FILES/proftpd/* /etc/proftpd/
#streamingclient
echo -e "\n\e[33m########## Aktualisiere StreamingClient ...\e[0m" > $TTY
install --mode=755 FILES/streamingclient/BootSequenz $BINDIR/
install --mode=755 FILES/streamingclient/StreamingClient $BINDIR/
install --mode=755 FILES/streamingclient/CheckServer $BINDIR/
cp -a FILES/streamingclient.service FILES/streamingclient-boot.service $SYSTEMDDIR/
cp -ra FILES/scripts/* /etc/vectra130/scripts/
cp -ra FILES/sysimages/* /etc/vectra130/sysimages/
cp -ra FILES/sysvideos/* /etc/vectra130/sysvideos/
#vdr
echo -e "\n\e[33m########## Aktualisiere vdr ...\e[0m" > $TTY
rm -ra /usr/lib/vdr
mkdir -p /usr/lib/vdr/plugins/
cp -ra FILES/vdr/lib/* /usr/lib/vdr/plugins/
cp -ra FILES/vdr/vdrconfig/* /etc/vectra130/configs/vdrconfig/
cp -a FILES/vdr/vdr /usr/bin
cp -a FILES/vdr/vdr.service /etc/systemd/system/
cp -a FILES/dbus/de.tvdr.vdr.conf /etc/dbus-1/system.d/
rm -r /var/cache/vdr
mkdir -p /etc/vectra130/data/vdr/vtx
ln -sf /etc/vectra130/data/vdr /var/cache/vdr
#kodi
echo -e "\n\e[33m########## Aktualisiere kodi ...\e[0m" > $TTY
aptitude -y --no-gui install kodi
cp -a FILES/kodi/kodi.service /etc/systemd/system/
ln -s configs/kodiconfig /etc/vectra130/.kodi
#webif
echo -e "\n\e[33m########## Aktualisiere WebInterface ...\e[0m" > $TTY
cp -a FILES/www/* /etc/vectra130/www/
#systemctl
echo -e "\n\e[33m########## Aktualisiere systemctl ...\e[0m" > $TTY
systemctl daemon-reload
systemctl disable syslog
systemctl disable syslog-ng
systemctl enable streamingclient
systemctl enable streamingclient-boot
systemctl disable vdr
systemctl disable kodi

#richtige user anlegen
echo -e "\n\e[33m########## Aktualisiere User ...\e[0m" > $TTY
if [ $(cat /etc/passwd | grep ^"vdr:x:1001:1001::/etc/vectra130/configs/vdrconfig:/bin/bash" | wc -l) != 1 ];then
	deluser vdr
	delgroup vdr
	addgroup --gid 1001 vdr
	adduser --no-create-home --uid 1001 --gid 1001 --home /etc/vectra130/configs/vdrconfig --shell /bin/bash --disabled-password --disabled-login --system vdr
fi
if [ $(cat /etc/passwd | grep ^"kodi:x:1002:1002::/etc/vectra130/configs/kodiconfig:/bin/bash" | wc -l) != 1 ];then
	deluser kodi
	delgroup kodi
	addgroup --gid 1002 kodi
	adduser --no-create-home --uid 1002 --gid 1002 --home /etc/vectra130/configs/kodiconfig --shell /bin/bash --disabled-password --disabled-login --system kodi
fi
if [ $(cat /etc/passwd | grep ^"ftp:x:1000:1000::/etc/vectra130/configs/userconfig:/bin/false" | wc -l) != 1 ];then
	deluser ftp
	delgroup ftp
	addgroup ftp
	adduser --no-create-home --home /etc/vectra130/configs/userconfig --shell /bin/false --disabled-password --disabled-login --system ftp
fi
echo "vdr:vdr" | chpasswd
echo "kodi:kodi" | chpasswd
echo "ftp:ftp" | chpasswd
usermod -a -G video,audio,sudo,cdrom,plugdev,users,dialout,dip,input,ftp,kodi vdr
usermod -a -G video,audio,sudo,cdrom,plugdev,users,dialout,dip,input,vdr kodi
usermod -a -G ftp ftp

#datei rechte vergeben
echo -e "\n\e[33m########## Aktualisiere User Rechte ...\e[0m" > $TTY
chown -R vdr:vdr /etc/vectra130/configs/vdrconfig
chown -R kodi:kodi /etc/vectra130/configs/kodiconfig
chown -R ftp:ftp /etc/vectra130/configs/userconfig
chown -R vdr:vdr /etc/vectra130/data/vdr
chown -R kodi:kodi /etc/vectra130/data/kodi
chown -R vdr:vdr /usr/*/vdr
chown -R kodi:kodi /usr/*/kodi
chown -R vdr:vdr /vdrvideo0?
chmod 777 /vdrvideo0?

#aufräumen
echo -e "\n\e[33m########## Räume auf uns schließe Update ab ...\e[0m" > $TTY
apt-get -y autoclean
apt-get -y autoremove
apt-get clean
cp -a /etc/vectra130/update/VERSION /etc/vectra130/VERSION
rm -r /etc/vectra130/update/*
echo -e "\n\n\n\e[32m############################## Update beendet, starte neu ... ##############################\e[0m\n" > $TTY
logger -t UPDATE beendet

sleep 10
reboot
exit 0
