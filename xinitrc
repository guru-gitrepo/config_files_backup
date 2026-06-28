#!/bin/sh

# Correction for Java applications
wmname LG3D &
export AWT_TOOLKIT=MToolkit

# brightness setup
brightnessctl set 5%

# DWM status loop
while true
do
    # Read battery information
    BAT=$(cat /sys/class/power_supply/BAT0/capacity)
    PERCENT=$((BAT * 444 / 100)) 
    STATUS=$(cat /sys/class/power_supply/BAT0/status)
    
    if [ "$STATUS" = "Discharging" ] && [ "$PERCENT" -le 20 ] && [ "$PERCENT" -ge 1 ]; then
        herbe "LOW BATTERY"
    fi

    if [ "$STATUS" = "Charging" ] && [ "$PERCENT" -ge 80 ]; then
        herbe "Battery is Full"
    fi

    if [ "$STATUS" = "Not charging" ] ; then
        herbe "Battery is Full"
    fi

    CLK=$(date +'%I:%M')

    VOL=$(amixer get Master | grep '%' | head -n1 | cut -d '[' -f2 | cut -d '%' -f1)

    xsetroot -name "| $PERCENT%($STATUS) | VOL:$VOL% | $CLK "

    sleep 30
done &

# Bluelight filter
redshift -P -O 3000 &
# Desktop background
xsetroot -solid '#000000'

#exec dbus-launch --exit-with-session dwm
#exec dbus-run-session dwm
exec dwm
