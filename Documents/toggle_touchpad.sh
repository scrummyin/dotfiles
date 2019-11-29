#!/bin/bash

declare -i ID
ID=`xinput list | grep -Eo 'Touchpad\s*id\=[0-9]{1,2}' | grep -Eo '[0-9]{1,2}'`
echo $ID
declare -i STATE
STATE=`xinput list-props $ID|grep 'Device Enabled'|awk '{print $4}'`
if [ $STATE -eq 1 ]
then
    xinput disable $ID
    notify-send -t 7000 -i /usr/share/icons/gnome/scalable/status/touchpad-disabled-symbolic.svg "Touchpad" "disabled"
    unclutter -idle 0
    echo "Touchpad disabled."
else
    xinput enable $ID
    pkill unclutter
    notify-send -t 7000 -i /usr/share/icons/Adwaita/scalable/devices/input-touchpad-symbolic.svg "Touchpad" "enabled"
    echo "Touchpad enabled."
fi
