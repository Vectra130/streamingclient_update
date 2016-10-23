#/bin/bash
#1.13.1
#Updatefile zum updaten des StreamingClients

UPDATEDIR="/etc/vectra130/update/git_update_files"
SYSTEMDDIR="/etc/systemd/system"
BINDIR="/usr/bin"

#StreamingClient beenden
logger -t UPDATE beende StreamingClient
if [ x$(cat /tmp/.frontendSet) != xsuspend ]; then
	echo suspend > /tmp/.frontendSet
	while [[ $(pidof -xs kodi.bin | wc -w) != 0 ] || [ $(pidof -xs vdr | wc -w) != 0 ]]; do
		sleep 1
	done
fi
systemctl stop streamingclient
sleep 2
count=0
while [ $(pidof -xs StreamingClient | wc -w) != 0 ]; do
	sleep 1
	killall StreamingClient
	count=$[ count + 1 ]
	if [ count > 30 ]; then
		killall -9 StreamingClient
	fi
done

logger -t UPDATE installiere Files
cd $UPDATEDIR
./FILES/scripts/showscreenimage.sh update
sleep 5
#updateinfos zeigen
chvt 1
clear

echo "########## erstelle read-write filesystem ..."
mount -o rw,remount /

#system
echo "########## Aktualisiere System Files ..."
rm -r /etc/vectra130/bin
cp -a FILES/fstab/fstab /etc/
cp -ra FILES/apt/* /etc/apt/
apt-key adv --keyserver keyserver.ubuntu.com --recv-key 5243CDED
aptitude -y update

#swapfile
if [ ! -e /etc/vectra130/swapfile ]; then
	echo "########## Erstelle Swap File ..."
	dd if=/dev/zero of=/etc/vectra130/swapfile bs=1M count=2048
	chown root:root /etc/vectra130/swapfile
	chown 0600 /etc/vectra130/swapfile
	mkswap /etc/vectra130/swapfile
	swapon /etc/vectra130/swapfile
fi

#proftpd
echo "########## Aktualisiere proftpd ..."
aptitude -y install proftpd-basic
cp -ra FILES/proftpd/* /etc/proftpd/
#streamingclient
echo "########## Aktualisiere StreamingClient ..."
install --mode=755 FILES/streamingclient/BootSequenz $BINDIR/
install --mode=755 FILES/streamingclient/StreamingClient $BINDIR/
install --mode=755 FILES/streamingclient/CheckServer $BINDIR/
cp -a FILES/streamingclient.service FILES/streamingclient-boot.service $SYSTEMDDIR/
cp -a /etc/vectra130/update/VERSION /etc/vectra130/VERSION
#vdr
echo "########## Aktualisiere vdr ..."
rm -ra /usr/lib/vdr
mkdir -p /usr/lib/vdr/plugins/
cp -ra FILES/vdr/lib/* /usr/lib/vdr/plugins/
cp -a FILES/vdr/vdr /usr/bin
cp -a FILES/vdr/vdr.service /etc/systemd/system/
#kodi
echo "########## Aktualisiere kodi ..."
aptitude -y install kodi
cp -a FILES/kodi/kodi.service /etc/systemd/system/
#systemctl
echo "########## Aktualisiere systemctl ..."
systemctl daemon-reload
systemctl disable syslog
systemctl disable syslog-ng
systemctl enable streamingclient
systemctl enable streamingclient-boot
systemctl disable vdr
systemctl disable kodi

#richtige user anlegen
echo "########## Aktualisiere User ..."
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
echo "########## Aktualisiere User Rechte ..."
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
echo "########## Räume auf uns schließe Update ab ..."
apt-get -y autoclean
apt-get -y autoremove
apt-get clean
rm -r /etc/vectra130/update/*
echo "########## Update beendet, starte neu ..."
logger -t UPDATE beendet

sleep 2
reboot
exit 0
