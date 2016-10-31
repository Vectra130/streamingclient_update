#!/bin/bash
# v1.2 raspi

[ -z "$1" ] && clear
[ -z "$1" ] && echo "Sammle Informationen ..."
while true; do

SERVERIP="192.168.1.80"
VDR_CLIENT=""
VDR_LOKAL=""
DAEMONS=""
FRONTEND=""
CPU_CORES=$(nproc --all)
CPU_USAGE_IDLE=$(top -n5 -d1 | grep Cpu\(s\)\: | grep -v grep | awk '{ print $8 }' | sed -e 's/,[0-9]//')
CPU_USAGE_IDLE=$(echo $CPU_USAGE_IDLE | sed -e 's/.* //')
CPU_USAGE=$[ 100-CPU_USAGE_IDLE ]
CPU_FREQ=$(vcgencmd measure_clock arm | cut -d "=" -f 2)
CORE_FREQ=$(vcgencmd measure_clock core | cut -d "=" -f 2)
CORE_V=$(vcgencmd measure_volts core | cut -d "=" -f 2)
cpuTemp0=$(cat /sys/class/thermal/thermal_zone0/temp)
cpuTemp1=$(($cpuTemp0/1000))
cpuTemp2=$(($cpuTemp0/100))
cpuTempM=$(($cpuTemp2 % $cpuTemp1))
cpuTemp=$cpuTemp1"."$cpuTempM"°C"
gpuTemp0=$(/opt/vc/bin/vcgencmd measure_temp)
gpuTemp0=${gpuTemp0//\'/°}
gpuTemp=${gpuTemp0//temp=/}
cpuMem=$(vcgencmd get_mem arm)
cpuMem=${cpuMem//arm=/}
cpuMem=${cpuMem//M/}
gpuMem=$(vcgencmd get_mem gpu)
gpuMem=${gpuMem//gpu=/}
gpuMem=${gpuMem//M/}

MEM_USAGE_TOTAL=$(free -m | grep Mem\: | grep -v grep | awk '{ print $2 }') 
MEM_USAGE_FREE=$(free -m | grep Mem\: | grep -v grep | awk '{ print $3 }')
MEM_USAGE=$[ MEM_USAGE_FREE*100/MEM_USAGE_TOTAL ]
CODEC_H264=$(vcgencmd codec_enabled H264)
CODEC_MPG2=$(vcgencmd codec_enabled MPG2)
CODEC_WVC1=$(vcgencmd codec_enabled WVC1)
BROADCOM=$(vcgencmd version | grep [0-9][0-9]:[0-9][0-9]:[0-9][0-9])
UNAME=$(uname -r)
VDR_VERSION=$(/usr/bin/vdr -V -L/usr/bin/vdr 2>/dev/null | sed 's/.*(\(.*\)\/.*/\1/')
FRONTEND=$(cat /tmp/.StreamingClientStatus)
if [ x"$FRONTEND" == x"suspend"  ]; then
    FRONTEND="*** System ist im StandBy ***"
else
    FRONTEND="Aktuelles Frontend: $FRONTEND"
fi
if [ "$SERVERIP" != "127.0.0.1" ];  then
	VDR_LOKAL=" Client"
	if [ "$(echo QUIT | nc -w 1 $SERVERIP 2004 | grep '220')" != "" ];
		then DAEMONS+="\nVDR Server ($SERVERIP) laeuft"
	fi
fi
if pidof -xs vdr > /dev/null; then
	DAEMONS+="\nVDR (v$VDR_VERSION) laeuft"
	PLUGINS=$(svdrpsend PLUG | grep 214- | grep -v Available | sed -e 's/214-/\* /g' -e 's/[ ]-.*//g')
fi
if pidof -xs StreamingClient > /dev/null; then DAEMONS+="\nStreamingClient laeuft"; fi
if pidof -xs kodi.bin > /dev/null; then DAEMONS+="\nKODI laeuft"; fi
if pidof -xs lircd > /dev/null; then DAEMONS+="\nLirc laeuft"; fi
if pidof -xs irexec > /dev/null; then DAEMONS+="\nirexec laeuft"; fi
if pidof -xs lighttpd > /dev/null; then DAEMONS+="\nLightTpd laeuft"; fi
if pidof -xs smbd > /dev/null; then DAEMONS+="\nSamba laeuft"; fi

[ -z "$1" ] && clear
[ -z "$1" ] && echo -e "\n#####################################################"
echo "#         RASPBERRY PI SYSTEM INFORMATIONEN         #"
[ -z "$1" ] && echo "#####################################################"

echo -e "\nCPU Frequenz       : $[ CPU_FREQ/1000000 ] Mhz"
echo "CPU Cores          : $CPU_CORES"
echo "CORE Frequenz      : $[ CORE_FREQ/1000000 ] Mhz"
echo "CORE Spannung      : $CORE_V"
echo -e "\nCPU Temperatur     : $cpuTemp"
echo "GPU Temperatur     : $gpuTemp"

echo -e "\nSpeicher           : $((cpuMem + gpuMem))MB (CPU:${cpuMem}MB / GPU:${gpuMem}MB)"
echo -e "\nCPU Auslastung     : $CPU_USAGE"%
echo "Speicher Nutzung   : $MEM_USAGE"%
#echo "SWAP Nutzung       : $SWAP_USAGE"%

echo -e "\nFirmware Version   : $BROADCOM"
echo -e "Linux Kernel       : $UNAME\n"

echo -e "Codecs Status:"
echo $CODEC_H264
echo $CODEC_MPG2
echo $CODEC_WVC1

[ "$FRONTEND" ] && echo -e "\n$FRONTEND"
[ "$DAEMONS" ] && echo -e $DAEMONS

echo

[ "$PLUGINS" ] && echo "Aktivierte Plugins:"
[ "$PLUGINS" ] && echo -e "$PLUGINS"

[ ! -z "$1" ] && exit 0
sleep 1
done
