#/bin/bash
#Updatefile zum updaten des StreamingClients

UPDATEDIR="/etc/vectra130/update/git_update_files"
GITREPO="https://github.com/Vectra130/streamingclient_update.git"

update_info()
{
#grafik anzeigen
/etc/vectra130/scripts/showscreenimage.sh update
}

clone_update()
{
	#update herunterladen
	[ -e $UPDATEDIR ] && rm -r $UPDATEDIR
	git clone --verbose --depth 1 $GITREPO $UPDATEDIR >> /etc/vectra130/update.log
}

pull_update()
{
	#pull
	cd $UPDATEDIR
	git pull --depth 1 >> /etc/vectra130/update.log
}

stop_streamingclient()
{
#StreamingClient beenden
if [ x$(cat /tmp/.frontendSet) != xsuspend ]; then
	echo suspend > /tmp/.frontendSet
	while [ $(pidof -xs vdr | wc -w) != 0 ]; do
		sleep 1
	done
	while [ $(pidof -xs kodi.bin | wc -w) != 0 ]; do
		sleep 1
	done
fi
systemctl stop streamingclient
systemctl stop lirc
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

}

install_update()
{
	# fuehre update aus
	[ ! -e $UPDATEDIR/update.sh ] && exit 1
	chmod +x $UPDATEDIR/update.sh
	$UPDATEDIR/update.sh
	if [ x$? == x0 ]; then
		echo OK
	fi
}

stop_streamingclient
update_info
#if [ -e $UPDATEDIR/.git ]; then
#	pull_update
#else
	clone_update
#fi
install_update

exit 0
