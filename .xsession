#!/bin/bash

# File .xsession by Rob Hunter

#eval $(gnome-keyring-daemon)

#export GNOME_KEYRING_SOCKET
#export GNOME_KEYRING_PID
#export SSH_AUTH_SOCK

#/usr/bin/gnome-keyring-daemon -d --login

xbacklight -set 25

xset b off

xrdb -merge .Xresources

xscreensaver -no-splash -no-capture-stderr &

xrandr --output LVDS-1 --off --output HDMI-1 --mode 1920x1080i --pos 0x0 --rotate normal --output VGA-1 --off

feh --bg-fill ~/Dropbox/Photos/io-jupiter.png

trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 11 --transparent true --heighttype pixel --height 24 --alpha 0 --tint 0x002b36 & 

#if [ -x /usr/bin/gnome-settings-daemon ] ; then
#   gnome-settings-daemon &
#fi

#if [ -x /usr/bin/xfce4-power-manager ] ; then
#   xfce4-power-manager &
#fi

if [ -x /usr/bin/nm-applet ] ; then
   nm-applet --sm-disable &
fi

if [ -x /usr/bin/transmission-gtk ] ; then
   transmission-gtk -m &
fi

if [ -x /usr/bin/xfce4-volumed ] ; then
   xfce4-volumed &
fi

unclutter -root & ### unnecessary if starting xmonad

autocutsel &

urxvtd -q -f -o

dropbox start

#synclient TapButton1=1

gtk-redshift -l 40.3679:-74.9335 -t 6500:5000 -m randr &

###  xmonad  ###

exec xmonad

###   dwm    ###

#conky -c ~/.conkyDwm | while read -r; do xsetroot -name "$REPLY"; done &

#while true; do
#   xsetroot -name "$( date +"%F | %I:%M %p" )"
#   sleep 10    # Update time every 10 seconds 
#done &

#exec dwm
