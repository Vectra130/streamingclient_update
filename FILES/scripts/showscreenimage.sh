#!/bin/bash
# v2.0 raspi

OPTIONS="-noverbose -T 3"
TYPE="$2"
[ "$2" == "" ] && TYPE="png"
if [ -e /etc/vectra130/images/screen_$1.$TYPE ]; then
        SHOWIMAGE=/etc/vectra130/images/screen_$1.$TYPE
        SHOWINFO="Zeige User Grafik: $1"
else
        SHOWIMAGE=/etc/vectra130/sysimages/screen_$1.$TYPE
        SHOWINFO="Zeige Sys Grafik: $1"
fi
fbset -depth 32; fbset -depth 16
logger -t "*"SHOWSCREENIMAGE $SHOWINFO
killall -9 -q fbi
fbi $OPTIONS $SHOWIMAGE &>/dev/null

exit 0
