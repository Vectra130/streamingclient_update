#/bin/bash
#Updatefile zum updaten des StreamingClients

UPDATEDIR="/etc/vectra130/update/git_update_files"
SYSTEMDDIR="/etc/systemd/system"
BINDIR="/etc/vectra130/bin"

#StreamingClient beenden
if [ x$(cat /tmp/.frontendSet) != xsuspend ]; then
	echo stop > /tmp/.frontendSet
	while [ $(pidof -xs StreamingClient | wc -w) != 0 ]; do
		sleep 1
	done
fi

cd $UPDATEDIR
./FILES/scripts/showscreenimage.sh update
cp BootSequenz StreamingClient CheckServer $BINDIR/
cp FILES/streamingclient.service FILES/streamingclient-boot.service $SYSTEMDDIR/

exit 0
