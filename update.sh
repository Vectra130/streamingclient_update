#/bin/bash
#Updatefile zum updaten des StreamingClients

UPDATEDIR="/etc/vectra130/update/git_update_files"
SYSTEMDDIR="/etc/systemd/system"
BINDIR="/etc/vectra130/bin"

#StreamingClient beenden
logger -t UPDATE beende StreamingClient
if [ x$(cat /tmp/.frontendSet) != xsuspend ]; then
	echo stop > /tmp/.frontendSet
	while [ $(pidof -xs StreamingClient | wc -w) != 0 ]; do
		sleep 1
		killall StreamingClient
	done
fi

logger -t UPDATE installiere Files
cd $UPDATEDIR
./FILES/scripts/showscreenimage.sh update
install --mode=755 BootSequenz $BINDIR/
install --mode=755 StreamingClient $BINDIR/
install --mode=755 CheckServer $BINDIR/
cp FILES/streamingclient.service FILES/streamingclient-boot.service $SYSTEMDDIR/

logger -t UPDATE beendet

sleep 2
exit 0
