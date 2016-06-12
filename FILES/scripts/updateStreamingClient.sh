#!/bin/bash

#StreamingClient Update Script


ACTION=$1
UPDATEDIR="/etc/vectra130/update"
GITREPO="https://github.com/Vectra130/streamingclient_update.git"


if [ x$ACTION == xcheck ]; then
	# pruefe git auf update
	[ -e $UPDATEDIR ] && rm -r $UPDATEDIR
	wget https://raw.githubusercontent.com/Vectra130/streamingclient_update/master/VERSION -P $UPDATEDIR
	VERSNOW=$(cat /etc/vectra130/VERSION | awk -F_ '{ print $1 }')
	VERSNOW1=$(echo $VERSNOW | awk -F. '{ print $1 }')
	VERSNOW2=$(echo $VERSNOW | awk -F. '{ print $2 }')
	VERSNOW3=$(echo $VERSNOW | awk -F. '{ print $3 }')
	VERSNUMNOW=$[ VERSNOW1 * 10000 + VERSNOW2 * 100 + VERSNOW3 ]
	VERSNEW=$(cat $UPDATEDIR/VERSION | awk -F_ '{ print $1 }')
	VERSNEW1=$(echo $VERSNEW | awk -F. '{ print $1 }')
	VERSNEW2=$(echo $VERSNEW | awk -F. '{ print $2 }')
	VERSNEW3=$(echo $VERSNEW | awk -F. '{ print $3 }')
	VERSNUMNEW=$[ VERSNEW1 * 10000 + VERSNEW2 * 100 + VERSNEW3 ]
	[ "$VERSNUMNOW" -ge "$VERSNUMNEW" ] && exit 1
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
