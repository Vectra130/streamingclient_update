#!/bin/bash

#StreamingClient Update Script


ACTION=$1
UPDATEDIR="/etc/vectra130/update"
GITREPO="https://github.com/Vectra130/streamingclient_update.git"


if [ x$ACTION == xcheck ]; then
	# pruefe git auf update
	[ -e $UPDATEDIR/UPDATE.info ] && rm $UPDATEDIR/UPDATE.info
	wget https://raw.githubusercontent.com/Vectra130/streamingclient_update/master/UPDATE.info -P $UPDATEDIR
	VERSNOW=$(cat /etc/vectra130/VERSION)
	VERSNOW1=$(printf "%02d" $(echo $VERSNOW | awk -F. '{ print $1 }'))
	VERSNOW2=$(printf "%02d" $(echo $VERSNOW | awk -F. '{ print $2 }'))
	VERSNOW3=$(printf "%02d" $(echo $VERSNOW | awk -F. '{ print $3 }'))
	VERSNOWNUM=$VERSNOW1$VERSNOW2$VERSNOW3

	VERSNEW=$(cat $UPDATEDIR/UPDATE.info | grep "^VERSION:" | awk -F: '{ print $2 }')
	VERSNEW1=$(printf "%02d" $(echo $VERSNEW | awk -F. '{ print $1 }'))
	VERSNEW2=$(printf "%02d" $(echo $VERSNEW | awk -F. '{ print $2 }'))
	VERSNEW3=$(printf "%02d" $(echo $VERSNEW | awk -F. '{ print $3 }'))
	VERSNEWNUM=$VERSNEW1$VERSNEW2$VERSNEW3
	[ "x$VERSNOWNUM" == "x" ] && exit 1
	[ "x$VERSNEWNUM" == "x" ] && exit 1
	if [ x$(cat /etc/vectra130/configs/userconfig/config | grep "C:STABLEONLY" | awk -F: '{ print $3 }') == x1 ]; then
		if [ $[ VERSNEW2 / 2 * 2 ] -ne $VERSNEW2 ]; then
			exit 1
		fi
	fi
	[ $VERSNOWNUM -ge $VERSNEWNUM ] && exit 1

	cat $UPDATEDIR/UPDATE.info | sed 's/.*[A-Z][:]\(.*\)/\1/'
fi

if [ x$ACTION == xupdate ]; then
	date > /etc/vectra130/update.log
	[ -e $UPDATEDIR/prepare_update.sh ] && rm $UPDATEDIR/prepare_update.sh
	wget https://raw.githubusercontent.com/Vectra130/streamingclient_update/master/prepare_update.sh -P $UPDATEDIR
	if [ -e $UPDATEDIR/prepare_update.sh ]; then
		chmod +x $UPDATEDIR/prepare_update.sh
		echo OK
	fi
fi

exit 0
