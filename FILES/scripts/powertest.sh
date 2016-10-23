#!/bin/bash

echo $(date) SHUTDOWN RAUSZOEGERN > /etc/vectra130/systemd-test
logger -t TEST shutdown rauszoegern
sleep 15
echo $(date) SHUTDOWN GEHT WEITER > /etc/vectra130/systemd-test
logger -t TEST shutdown abbrechen
init 2
sleep 1
exit 0
