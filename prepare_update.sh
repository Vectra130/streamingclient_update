#/bin/bash
#Updatefile zum updaten des StreamingClients

UPDATEDIR="/etc/vectra130/update/git_update_files"
GITREPO="https://github.com/Vectra130/streamingclient_update.git"


download_update()
{
	#update herunterladen
	git clone --depth 1 $GITREPO $UPDATEDIR
}

stop_streamingclient()
{
#StreamingClient beenden
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

[ -e $UPDATEDIR ] && rm -r $UPDATEDIR
stop_streamingclient
download_update
install_update

exit 0
