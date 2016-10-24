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

echo -e "\n########## erstelle read-write filesystem ..." > $TTY
exit 0
mount -o rw,remount /

#system
echo -e "\n########## Aktualisiere System Files ..." > $TTY
rm -r /etc/vectra130/bin
cp -a FILES/fstab/fstab /etc/
cp -ra FILES/apt/* /etc/apt/
apt-key adv --keyserver keyserver.ubuntu.com --recv-key 5243CDED
aptitude -y update

#swapfile
if [ ! -e /etc/vectra130/swapfile ]; then
	echo -e "\n########## Erstelle Swap File ..." > $TTY
	dd if=/dev/zero of=/etc/vectra130/swapfile bs=1M count=2048
	chown root:root /etc/vectra130/swapfile
	chown 0600 /etc/vectra130/swapfile
	mkswap /etc/vectra130/swapfile
	swapon /etc/vectra130/swapfile
fi

#proftpd
echo -e "\n########## Aktualisiere proftpd ..." > $TTY
aptitude -y install proftpd-basic
cp -ra FILES/proftpd/* /etc/proftpd/
#streamingclient
echo -e "\n########## Aktualisiere StreamingClient ..." > $TTY
install --mode=755 FILES/streamingclient/BootSequenz $BINDIR/
install --mode=755 FILES/streamingclient/StreamingClient $BINDIR/
install --mode=755 FILES/streamingclient/CheckServer $BINDIR/
cp -a FILES/streamingclient.service FILES/streamingclient-boot.service $SYSTEMDDIR/
cp -ra FILES/scripts/* /etc/vectra130/scripts/
#vdr
echo -e "\n########## Aktualisiere vdr ..." > $TTY
rm -ra /usr/lib/vdr
mkdir -p /usr/lib/vdr/plugins/
cp -ra FILES/vdr/lib/* /usr/lib/vdr/plugins/
cp -a FILES/vdr/vdr /usr/bin
cp -a FILES/vdr/vdr.service /etc/systemd/system/
#kodi
echo -e "\n########## Aktualisiere kodi ..." > $TTY
aptitude -y install kodi
cp -a FILES/kodi/kodi.service /etc/systemd/system/
#webif
echo -e "\n########## Aktualisiere WebInterface ..." > $TTY
cp -a FILES/www/* /etc/vectra130/www/
#systemctl
echo -e "\n########## Aktualisiere systemctl ..." > $TTY
systemctl daemon-reload
systemctl disable syslog
systemctl disable syslog-ng
systemctl enable streamingclient
systemctl enable streamingclient-boot
systemctl disable vdr
systemctl disable kodi

#richtige user anlegen
echo -e "\n########## Aktualisiere User ..." > $TTY
deluser vdr
deluser kodi
delgroup vdr
delgroup kodi
adduser --no-create-home --uid 1001 --gid 1001 --home /etc/vectra130/configs/vdrconfig --shell /bin/bash --disable-password vdr
adduser --no-create-home --uid 1002 --gid 1002 --home /etc/vectra130/configs/kodiconfig --shell /bin/bash --disable-password kodi
echo "vdr:vdr" | chpasswd
echo "kodi:kodi" | chpasswd
usermod -a -G video,audio,sudo,cdrom,plugdev,users,dialout,dip,input,ftp,kodi vdr
usermod -a -G video,audio,sudo,cdrom,plugdev,users,dialout,dip,input,vdr kodi

#datei rechte vergeben
echo -e "\n########## Aktualisiere User Rechte ..." > $TTY
chown -R vdr:vdr /etc/vectra130/configs/vdrconfig
chown -R kodi:kodi /etc/vectra130/configs/kodiconfig
ln -sf ./ /etc/vectra130/configs/kodiconfig/.kodi
chown -R ftp:ftp /etc/vectra130/configs/userconfig
chown -R vdr:vdr /etc/vectra130/data/vdr
chown -R kodi:kodi /etc/vectra130/data/kodi
chown -R vdr:vdr /usr/*/vdr
chown -R kodi:kodi /usr/*/kodi
chown vdr:vdr /vdrvideo0?
chmod 777 /vdrvideo0?

#aufräumen
echo -e "\n########## Räume auf uns schließe Update ab ..." > $TTY
apt-get -y autoclean
apt-get -y autoremove
apt-get clean
cp -a /etc/vectra130/update/VERSION /etc/vectra130/VERSION
rm -r /etc/vectra130/update/*
echo -e "\n########## Update beendet, starte neu ..." > $TTY
logger -t UPDATE beendet

sleep 2
reboot
exit 0
