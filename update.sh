#/bin/bash
#v1.0
#Updatefile zum updaten des StreamingClients

error_exit()
{
echo -e "\n\n\e[31mUPDATE FEHLGESCHLAGEN!!!!!\n\n\e[0mDie letzten 20 Log Einträge:\n##########" # | tee -a /dev/tty1
tail -20 /etc/vectra130/update.log
echo "##########"
date >> $DLOG
exit 2
}

create_update()
{
UPDATEDIR="/usr/local/src/cplusplus/VDR/StreamingClient/UPDATE"
UPDATEFILESDIR="$UPDATEDIR/FILES"
SYSTEMDDIR="/etc/systemd/system"
BINDIR="/usr/bin"
VERSION=$(StreamingClient -v | grep Streaming | sed 's/Streaming.*v\(.*\) by.*/\1/g')
read -n 1 -p "Update Version $VERSION ok? [Y/n] " CHECK
if [ x$CHECK == xn ]; then
	echo
	read -p "Neue Update Version eingeben: " VERSION
fi
[ x$VERSION == x ] && exit 2
echo

# up = update
# cf = force kopieren
# rc = original(ordner) vorher komplett löschen, dann kopieren
# rm = nur löschen
# nf = touch
# sl = symlink
# nd = ordner anlegen
# mv = verschieben

echo Erstelle Update $VERSION ...

[ -e $UPDATEDIR/UPDATE.info ] && rm $UPDATEDIR/UPDATE.info

while read -r line; do
	[ $(echo $line | grep -E "^up |^cf |^rc " | wc -l) == 0 ] && continue
	DIR="$UPDATEFILESDIR/$(dirname ${line:3})"
	[ ! -e $DIR ] && mkdir -p $DIR
	echo "--> kopiere ${line:3} (option:${line:0:2})"
	cp -rau ${line:3} $DIR
	if [ $? -ne 0 ]; then
		echo "Datei nicht gefunden!!!"
		exit 2
	fi
done < $UPDATEDIR/file_tree

[ ! -e $UPDATEFILESDIR/debconf ] && mkdir $UPDATEFILESDIR/debconf
debconf-get-selections > $UPDATEFILESDIR/debconf/selections
[ -e ${UPDATEDIR}/FILES.tar ] && rm ${UPDATEDIR}/FILES.tar

echo "VERSION:"$VERSION > $UPDATEDIR/UPDATE.info
echo "DATE:"$(date) >> $UPDATEDIR/UPDATE.info
echo "SIZE:"$(du -hs $UPDATEDIR --exclude=.git | awk '{ print $1 "B" }') >> $UPDATEDIR/UPDATE.info
echo "$(cat /$UPDATEDIR/UPDATE.info)"
}

upload_update()
{
UPDATEDIR="/usr/local/src/cplusplus/VDR/StreamingClient/UPDATE"
cd $UPDATEDIR
VERSION=$(cat $UPDATEDIR/UPDATE.info | grep VERSION | awk -F: '{ print $2 }')
[ x$VERSION == x ] && exit 2
echo -e "\n-- aktualisiere git ..."
git add -A -v
read -p "Commit Info: " COMMIT
echo
[ "x$COMMIT" == x ] && COMMIT=$VERSION
git commit -m "$COMMIT"
git push && echo "--- Version $VERSION hoch geladen"
[ -e $UPDATEDIR/UPDATE.info ] && rm $UPDATEDIR/UPDATE.info
}

install_update()
{
UPDATEDIR="/etc/vectra130/update/git_update_files"
UPDATEFILESDIR="$UPDATEDIR/FILES"
SYSTEMDDIR="/etc/systemd/system"
BINDIR="/usr/bin"
TTY="> /dev/tty1"
LOG="tee -a /dev/tty1 | tee -a /etc/vectra130/update.log"
DLOG="/etc/vectra130/update.log"
VERSION=$(cat /etc/vectra130/update/UPDATE.info | grep VERSION | awk -F: '{ print $2 }')

cd $UPDATEDIR
#updateinfos zeigen
chvt 1
echo -e "\e[3J" #| $LOG
echo -e "\n\e[34m############################## UPDATEVERLAUF ##############################\e[0m\n" #| $LOG
echo -e "\n\e[33m########## Updatefiles heruntergeladen\e[0m" #| $LOG

if [ x$VERSION == x ]; then
	echo "VERSIONSINFO NICHT VORHANDEN" >> $DLOG
	error_exit
fi

echo -e "\n\e[33m########## Erstelle read-write Filesystem ...\e[0m" #| $LOG
mount -o rw,remount /
if [ $? -ne 0 ]; then error_exit; fi
mount -o rw,remount /boot
if [ $? -ne 0 ]; then error_exit; fi
mount -o remount,size=256M /tmp
if [ $? -ne 0 ]; then error_exit; fi

#system
echo -e "\n\e[33m########## Aktualisiere Paket Quellen ...\e[0m" #| $LOG
cp -ra FILES/etc/apt/* /etc/apt/
if [ $? -ne 0 ]; then error_exit; fi
for i in 1..10; do
	apt-key adv --keyserver keyserver.ubuntu.com --recv-key 5243CDED
	if [ $? -eq 0 ]; then break; fi
	sleep 1
	if [ i == 10 ]; then error_exit; fi
done
aptitude -y update
dpkg --configure -a
debconf-set-selections FILES/debconf/selections
if [ $? -ne 0 ]; then error_exit; fi

#swapfile
if [ ! -e /etc/vectra130/swapfile ]; then
	FREE=$(df -m | grep mmcblk0p3 | awk '{ print $4 }')
	if [ x$FREE != x ]; then
		if [ $FREE -gt 5000 ]; then
			SWAPSIZE=2048
		elif [ $FREE -gt 100 ]; then
			SWAPSIZE=10
		fi
	fi
	if [ $FREE -gt 0 ]; then
		echo -e "\n\e[33m########## Erstelle Swap File (${FREE}MB ...\e[0m" #| $LOG
		dd if=/dev/zero of=/etc/vectra130/swapfile bs=1M count=$FREE
		chown root:root /etc/vectra130/swapfile
		chown 0600 /etc/vectra130/swapfile
		mkswap /etc/vectra130/swapfile
		swapon /etc/vectra130/swapfile
	fi
fi

#programme aktualisieren
echo -e "\n\e[33m########## Aktualisiere Programme ...\e[0m" #| $LOG
aptitude -y --no-gui install proftpd-basic kodi kodi-eventclients-common
if [ $? -ne 0 ]; then error_exit; fi

# dateien kopieren
echo -e "\n\e[33m########## Kopiere Files ($(du -hs | awk '{ print $1 }')B) ...\e[0m" #| $LOG
# up = update
# cf = force kopieren
# rc = original(ordner) vorher komplett löschen, dann kopieren
# rm = nur löschen
# nf = touch
# sl = symlink
# nd = ordner anlegen
# mv = verschieben

[ -e  /etc/vectra130/configs/sysconfig/config ] && mv /etc/vectra130/configs/sysconfig/config /etc/vectra130/configs/userconfig/config
while read -r line; do
	[ $(echo $line | grep -E "^up |^cf |^rc |^rm |^nf |^sl |^nd |^mv " | wc -l) == 0 ] && continue
	echo -n "."
	if [ x${line:0:2} == xup ]; then
		DIR="$(dirname ${line:3})"
		[ ! -e $DIR ] && mkdir -p $DIR
#		echo "--> kopiere ${line:3} (option:${line:0:2})" >> $DLOG
		cp -rauv $UPDATEFILESDIR/${line:3} $DIR >> $DLOG
		if [ $? -ne 0 ]; then error_exit; fi
	fi
	if [ x${line:0:2} == xcf ]; then
		DIR="$(dirname ${line:3})"
		[ ! -e $DIR ] && mkdir -p $DIR
#		echo "--> kopiere ${line:3} (option:${line:0:2})" >> $DLOG
		rm -r ${line:3} >> $DLOG
		cp -rafv $UPDATEFILESDIR/${line:3} $DIR >> $DLOG
		if [ $? -ne 0 ]; then error_exit; fi
	fi
	if [ x${line:0:2} == xrc ]; then
		rm -r ${line:3} >> $DLOG
		DIR="$(dirname ${line:3})"
		[ ! -e $DIR ] && mkdir -p $DIR
#		echo "--> kopiere ${line:3} (option:${line:0:2})" >> $DLOG
		cp -rav $UPDATEFILESDIR/${line:3} $DIR >> $DLOG
		if [ $? -ne 0 ]; then error_exit; fi
	fi
	if [ x${line:0:2} == xrm ]; then
		[ -e ${line:3} ] && rm -r ${line:3}
		echo "--> lösche ${line:3} (option:${line:0:2})" >> $DLOG
	fi
	if [ x${line:0:2} == xnf ]; then
		DIR="$(dirname ${line:3})"
		[ ! -e $DIR ] && mkdir -p $DIR
		echo "--> touch ${line:3} (option:${line:0:2})" >> $DLOG
		touch ${line:3}
	fi
	if [ x${line:0:2} == xsl ]; then
		line1=$(echo $line | awk '{ print $2 }')
		line2=$(echo $line | awk '{ print $3 }')
		DIR="$(dirname $line2)"
		[ ! -e $DIR ] && mkdir -p $DIR
#		echo "--> symlink $line1 -> $line2 (option:${line:0:2})" >> $DLOG
		ln -sfv $line1 $line2 >> $DLOG
	fi
	if [ x${line:0:2} == xmv ]; then
		line1=$(echo $line | awk '{ print $2 }')
		line2=$(echo $line | awk '{ print $3 }')
		[ ! -e $line1 ] && continue
		DIR="$(dirname $line2)"
		[ ! -e $DIR ] && mkdir -p $DIR
#		echo "--> mv $line1 -> $line2 (option:${line:0:2})" >> $DLOG
		mv $line1 $line2 >> $DLOG
	fi
	if [ x${line:0:2} == xnd ]; then
		DIR="${line:3}"
		[ ! -e $DIR ] && mkdir -p $DIR
		echo "--> mkdir ${line:3} (option:${line:0:2})" >> $DLOG
	fi
done < $UPDATEDIR/file_tree
echo
if [ $(cat /boot/config.txt | grep "^dtoverlay=lirc-rpi" | wc -l) != 1 ]; then
	echo "dtoverlay=lirc-rpi" >> /boot/config.txt
fi
if [ $(cat /boot/config.txt | grep "^dtparam=audio=on" | wc -l) != 1 ]; then
	echo "dtparam=audio=on" >> /boot/config.txt
fi
if [ $(cat /boot/config.txt | grep "^dtoverlay=pi3-act-led,gpio=11" | wc -l) != 1 ]; then
	echo "dtoverlay=pi3-act-led,gpio=11" >> /boot/config.txt
fi

# patche anwenden
echo -e "\n\e[33m########## Patche Dateien ...\e[0m" #| $LOG
for i in $(find $UPDATEDIR/PATCHES -type f | sed 's/.*PATCHES\(.*\).diff/\1/');
do
	echo -n "."
	patch -f --verbose "$i" < $UPDATEDIR/PATCHES/$i.diff >> $DLOG
done
echo

# systemctl
echo -e "\n\e[33m########## Aktualisiere systemctl ...\e[0m" #| $LOG
systemctl daemon-reload
systemctl disable syslog
systemctl disable syslog-ng
systemctl enable streamingclient
systemctl enable streamingclient-boot
systemctl disable vdr
systemctl disable kodi

#richtige user anlegen
echo -e "\n\e[33m########## Aktualisiere User ...\e[0m" #| $LOG
if [ $(cat /etc/passwd | grep ^"ftp:" | wc -l) == 1 ];then
	deluser ftp
	delgroup ftp
fi
if [ $(cat /etc/passwd | grep ^"vdr:x:1001:1001::/etc/vectra130/configs/userconfig:/bin/bash" | wc -l) != 1 ];then
	deluser vdr
	delgroup vdr
	addgroup --gid 1001 vdr >> $DLOG
	if [ $? -ne 0 ]; then error_exit; fi
	adduser --no-create-home --uid 1001 --gid 1001 --home /etc/vectra130/configs/userconfig --shell /bin/bash --disabled-password --disabled-login --system vdr >> $DLOG
	if [ $? -ne 0 ]; then error_exit; fi
fi
if [ $(cat /etc/passwd | grep ^"kodi:" | wc -l) == 1 ];then
	deluser kodi
	delgroup kodi
fi
echo "vdr:vdr" | chpasswd >> $DLOG
if [ $? -ne 0 ]; then error_exit; fi
usermod -a -G video,audio,sudo,cdrom,plugdev,users,dialout,dip,input vdr >> $DLOG
if [ $? -ne 0 ]; then error_exit; fi

#datei rechte vergeben
echo -e "\n\e[33m########## Aktualisiere User Rechte ...\e[0m" #| $LOG
chown -R vdr:vdr /etc/vectra130/configs/vdrconfig
if [ $? -ne 0 ]; then error_exit; fi
chown -R vdr:vdr /etc/vectra130/configs/kodiconfig
if [ $? -ne 0 ]; then error_exit; fi
chown -R vdr:vdr /etc/vectra130/configs/userconfig
if [ $? -ne 0 ]; then error_exit; fi
chown -R vdr:vdr /etc/vectra130/data/vdr
if [ $? -ne 0 ]; then error_exit; fi
chown -R vdr:vdr /etc/vectra130/data/kodi
if [ $? -ne 0 ]; then error_exit; fi
chown -R vdr:vdr /usr/*/vdr
if [ $? -ne 0 ]; then error_exit; fi
chown -R vdr:vdr /usr/*/kodi
if [ $? -ne 0 ]; then error_exit; fi
chown -R vdr:vdr /vdrvideo0?
if [ $? -ne 0 ]; then error_exit; fi
chmod 777 /vdrvideo0?
if [ $? -ne 0 ]; then error_exit; fi

#aufräumen
echo -e "\n\e[33m########## Räume auf uns schließe Update ab ...\e[0m" #| $LOG
apt-get -y autoclean
apt-get -y autoremove
apt-get clean
#echo $VERSION > /etc/vectra130/VERSION
rm -r /etc/vectra130/update/*
echo -e "\n\n\n\e[32m############################## Update beendet, starte neu ... ##############################\e[0m\n"

date >> $DLOG
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
