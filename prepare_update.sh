#/bin/bash
#Updatefile zum updaten des StreamingClients

UPDATEDIR="/etc/vectra130/update/git_update_files"
GITREPO="https://github.com/Vectra130/streamingclient_update.git"


download()
{
	#update herunterladen
	git clone --depth 1 $GITREPO $UPDATEDIR

	# fuehre update aus
	[ ! -e $UPDATEDIR/update.sh ] && exit 1
	$UPDATEDIR/update.sh
	if [ x$? == x0 ]; then
		echo OK
	fi
}

[ -e $UPDATEDIR ] && rm -r $UPDATEDIR
download

exit 0
