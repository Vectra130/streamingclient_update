#!/bin/bash

#StreamingClient Update Script


ACTION=$1
UPDATEDIR="/etc/vectra130/update"
GITREPO="https://github.com/Vectra130/streamingclient_update.git"


if [ x$ACTION == xcheck ]; then
	# pruefe git auf update
	[ -e $UPDATEDIR ] && rm -r $UPDATEDIR
	wget https://raw.githubusercontent.com/Vectra130/streamingclient_update/master/VERSION -P $UPDATEDIR
	VERSNOW=$(cat /etc/vectra130/VERSION)
	VERSNEW=$(cat $UPDATEDIR/VERSION)
	[ x$VERSNOW == x$VERSNEW ] && exit 1
	echo $VERSNEW
fi

if [ x$ACTION == xupdate ]; then
	wget https://raw.githubusercontent.com/Vectra130/streamingclient_update/master/prepare_update.sh -P $UPDATEDIR
	if [ -e $UPDATEDIR/prepare_update.sh ]; then
		chmod +x $UPDATEDIR/prepare_update.sh
		echo OK
	fi
fi

exit 0
