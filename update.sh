#/bin/bash
#1.13.1
#Updatefile zum updaten des StreamingClients

error_exit()
{
echo -e "\n\n\e[31mUPDATE FEHLGESCHLAGEN!!!!!\n\n\e[0mDie letzten 10 Log Einträge:\n" | tee -a /dev/tty1
tail -10 /etc/vectra130/update.log
exit 2
}

create_update()
{
UPDATEDIR="/usr/local/src/cplusplus/VDR/StreamingClient/UPDATE"
UPDATEFILESDIR="$UPDATEDIR/FILES"
SYSTEMDDIR="/etc/systemd/system"
BINDIR="/usr/bin"
VERSION=$(cat /etc/vectra130/VERSION)
[ x$VERSION == x ] && exit 2

# up = update
# cf = force kopieren
# rc = original(ordner) vorher komplett löschen, dann kopieren
# rm = nur löschen
# nf = touch
# sl = symlink
# nd = ordner anlegen

echo Erstelle Update $VERSION ...

echo $VERSION > VERSION
while read -r line; do
	[ $(echo $line | grep -E "^up |^cf |^rc " | wc -l) == 0 ] && continue
	DIR="$UPDATEFILESDIR/$(dirname ${line:3})"
	[ ! -e $DIR ] && mkdir -p $DIR
	echo "--> kopiere ${line:3} (option:${line:0:2})"
	cp -rau ${line:3} $DIR
done < $UPDATEDIR/file_tree

[ ! -e $UPDATEFILESDIR/debconf ] && mkdir $UPDATEFILESDIR/debconf
debconf-get-selections > $UPDATEFILESDIR/debconf/selections
echo Archiv packen...
[ -e ${UPDATEDIR}/FILES.tar ] && rm ${UPDATEDIR}/FILES.tar
du -hs $UPDATEFILESDIR | awk '{ print $1 "B" }' > $UPDATEDIR/size_FILES
tar cfpz ${UPDATEDIR}/FILES.tar $UPDATEFILESDIR && rm -r $UPDATEFILESDIR && echo ok
du -hs $UPDATEDIR/FILES.tar | awk '{ print $1 "B" }' > $UPDATEDIR/size_FILES_TAR
du -hs $UPDATEDIR --exclude=.git | awk '{ print $1 "B" }' > $UPDATEDIR/size_DOWNLOAD
echo "FILES: $(cat /$UPDATEDIR/size_FILES)"
echo "TAR:   $(cat /$UPDATEDIR/size_FILES_TAR)"
echo "UPDATE:$(cat /$UPDATEDIR/size_DOWNLOAD)"
}

upload_update()
{
VERSION=$(cat VERSION)
echo -e "\n-- aktualisiere git ..."
git add -A && git commit -m $VERSION && git push && echo "--- Version $VERSION hoch geladen"
}

install_update()
{
UPDATEDIR="/etc/vectra130/update/git_update_files"
SYSTEMDDIR="/etc/systemd/system"
BINDIR="/usr/bin"
TTY="> /dev/tty1"
LOG="| tee -a /dev/tty1 | tee -a /etc/vectra130/update.log"

cd $UPDATEDIR
#updateinfos zeigen
chvt 1
echo -e "\e[3J" $LOG
echo -e "\n\e[34m############################## UPDATEVERLAUF ##############################\e[0m\n" $LOG
echo -e "\n\e[33m########## Updatefiles heruntergeladen\e[0m" $LOG

echo -e "\n\e[33m########## Updatefiles entpacken ...\e[0m" $LOG
tar xfpz ${UPDATEDIR}/FILES.tar && rm -r $UPDATEDIR/FILES.tar || error_exit

echo -e "\n\e[33m########## Erstelle read-write Filesystem ...\e[0m" $LOG
mount -o rw,remount / || error_exit
mount -o rw,remount /boot || error_exit
mount -o remount,size=256M /tmp || error_exit

#system
echo -e "\n\e[33m########## Aktualisiere Quellen ...\e[0m" $LOG
cp -ra FILES/etc/apt/* /etc/apt/ || error_exit
apt-key adv --keyserver keyserver.ubuntu.com --recv-key 5243CDED
aptitude -y update
dpkg --configure -a
debconf-set-selections FILES/debconf/selections || error_exit

#swapfile
if [ ! -e /etc/vectra130/swapfile ]; then
	echo -e "\n\e[33m########## Erstelle Swap File ...\e[0m" $LOG
	dd if=/dev/zero of=/etc/vectra130/swapfile bs=1M count=2048
	chown root:root /etc/vectra130/swapfile
	chown 0600 /etc/vectra130/swapfile
	mkswap /etc/vectra130/swapfile
	swapon /etc/vectra130/swapfile
fi

#proftpd
echo -e "\n\e[33m########## Aktualisiere proftpd ...\e[0m" $LOG
aptitude -y --no-gui install proftpd-basic || error_exit

#kodi
echo -e "\n\e[33m########## Aktualisiere kodi ...\e[0m" $LOG
aptitude -y --no-gui install kodi || error_exit

# dateien kopieren
echo -e "\n\e[33m########## Kopiere Files ($(du -hs | awk '{ print $1 }')B) ...\e[0m" $LOG
# up = update
# cf = force kopieren
# rc = original(ordner) vorher komplett löschen, dann kopieren
# rm = nur löschen
# nf = touch
# sl = symlink
# nd = ordner anlegen
while read -r line; do
	[ $(echo $line | grep -E "^up |^cf |^rc |^rm |^nf |^sl |^nd " | wc -l) == 0 ] && continue
	if [ x${line:0:2} == xup ]; then
		DIR="$(dirname ${line:3})"
		[ ! -e $DIR ] && mkdir -p $DIR
#		echo "--> kopiere ${line:3} (option:${line:0:2})"
		cp -rau $UPDATEFILESDIR/${line:3} $DIR || error_exit
	fi
	if [ x${line:0:2} == xcf ]; then
		DIR="$(dirname ${line:3})"
		[ ! -e $DIR ] && mkdir -p $DIR
#		echo "--> kopiere ${line:3} (option:${line:0:2})"
		cp -raf $UPDATEFILESDIR/${line:3} $DIR || error_exit
	fi
	if [ x${line:0:2} == xrc ]; then
		[ -e ${line:3} ] && rm -r ${line:3}
		DIR="$(dirname ${line:3})"
		[ ! -e $DIR ] && mkdir -p $DIR
#		echo "--> kopiere ${line:3} (option:${line:0:2})"
		cp -ra $UPDATEFILESDIR/${line:3} $DIR || error_exit
	fi
	if [ x${line:0:2} == xrm ]; then
		[ -e ${line:3} ] && rm -r ${line:3}
#		echo "--> lösche ${line:3} (option:${line:0:2})"
	fi
	if [ x${line:0:2} == xnf ]; then
		DIR="$(dirname ${line:3})"
		[ ! -e $DIR ] && mkdir -p $DIR
#		echo "--> touch ${line:3} (option:${line:0:2})"
		touch ${line:3} || error_exit
	fi
	if [ x${line:0:2} == xsl ]; then
		line1=$(echo $line | awk '{ print $2 }')
		line2=$(echo $line | awk '{ print $3 }')
		DIR="$(dirname $line2)"
		[ ! -e $DIR ] && mkdir -p $DIR
#		echo "--> symlink $line1 -> $line2 (option:${line:0:2})"
		ln -sf $line1 $line2 || error_exit
	fi
	if [ x${line:0:2} == xnd ]; then
		DIR="${line:3}"
		[ ! -e $DIR ] && mkdir -p $DIR
#		echo "--> mkdir ${line:3} (option:${line:0:2})"
	fi
done < $UPDATEDIR/file_tree
if [ $(cat /boot/config.txt | grep "^dtoverlay=lirc-rpi" | wc -l) != 1 ]; then
	echo "dtoverlay=lirc-rpi" >> /boot/config.txt
fi
if [ $(cat /boot/config.txt | grep "^dtparam=audio=on" | wc -l) != 1 ]; then
	echo "dtparam=audio=on" >> /boot/config.txt
fi
if [ $(cat /boot/config.txt | grep "^dtoverlay=pi3-act-led,gpio=11" | wc -l) != 1 ]; then
	echo "dtoverlay=pi3-act-led,gpio=11" >> /boot/config.txt
fi


#systemctl
echo -e "\n\e[33m########## Aktualisiere systemctl ...\e[0m" $LOG
systemctl daemon-reload
systemctl disable syslog
systemctl disable syslog-ng
systemctl enable streamingclient
systemctl enable streamingclient-boot
systemctl disable vdr
systemctl disable kodi

#richtige user anlegen
echo -e "\n\e[33m########## Aktualisiere User ...\e[0m" $LOG
deluser ftp
delgroup ftp
if [ $(cat /etc/passwd | grep ^"vdr:x:1001:1001::/etc/vectra130/configs/userconfig:/bin/bash" | wc -l) != 1 ];then
	deluser vdr
	delgroup vdr
	addgroup --gid 1001 vdr || error_exit
	adduser --no-create-home --uid 1001 --gid 1001 --home /etc/vectra130/configs/userconfig --shell /bin/bash --disabled-password --disabled-login --system vdr || error_exit
fi
if [ $(cat /etc/passwd | grep ^"kodi:x:1002:1002::/etc/vectra130/configs/userconfig:/bin/bash" | wc -l) != 1 ];then
	deluser kodi
	delgroup kodi
	addgroup --gid 1002 kodi || error_exit
	adduser --no-create-home --uid 1002 --gid 1002 --home /etc/vectra130/configs/userconfig --shell /bin/bash --disabled-password --disabled-login --system kodi || error_exit
fi
echo "vdr:vdr" | chpasswd || error_exit
echo "kodi:kodi" | chpasswd || error_exit
usermod -a -G video,audio,sudo,cdrom,plugdev,users,dialout,dip,input,kodi vdr || error_exit
usermod -a -G video,audio,sudo,cdrom,plugdev,users,dialout,dip,input,vdr kodi || error_exit

#datei rechte vergeben
echo -e "\n\e[33m########## Aktualisiere User Rechte ...\e[0m" $LOG
chown -R vdr:vdr /etc/vectra130/configs/vdrconfig || error_exit
chown -R kodi:kodi /etc/vectra130/configs/kodiconfig || error_exit
chown -R vdr:vdr /etc/vectra130/configs/userconfig || error_exit
chown -R vdr:vdr /etc/vectra130/data/vdr || error_exit
chown -R kodi:kodi /etc/vectra130/data/kodi || error_exit
chown -R vdr:vdr /usr/*/vdr || error_exit
chown -R kodi:kodi /usr/*/kodi || error_exit
chown -R vdr:vdr /vdrvideo0? || error_exit
chmod 777 /vdrvideo0? || error_exit

#aufräumen
echo -e "\n\e[33m########## Räume auf uns schließe Update ab ...\e[0m" $LOG
apt-get -y autoclean
apt-get -y autoremove
apt-get clean
cp -a /etc/vectra130/update/VERSION /etc/vectra130/VERSION || error_exit
rm -r /etc/vectra130/update/*
echo -e "\n\n\n\e[32m############################## Update beendet, starte neu ... ##############################\e[0m\n" > $TTfY

sleep 10
reboot
exit 0
}

if [ x$1 == xcreate ]; then
	create_update
	read -n1 -p "Upload [Y/n]?" READ
	[ x$READ != xn ] && upload_update
	echo
	exit 0
fi
if [ x$1 == xupload ]; then
	upload_update
	exit 0
fi
install_update
