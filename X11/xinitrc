#!/bin/sh

# Mice/keyboard settings
xset m 0 0
xset r rate 250 50
xset s off
setxkbmap br
setxkbmap -option terminate:ctrl_alt_bksp
xsetroot -cursor_name left_ptr

# X font paths
xset +fp $HOME/.fonts
xset +fp /usr/share/fonts/artwiz-fonts
xset +fp /usr/share/fonts/misc
xset +fp /usr/share/fonts/jmk
xset fp rehash

# Kill all left programs
killall loliclip
# killall compton
killall urxvtd

# Keyboard layout
xmodmap $HOME/.Xmodmap
# xbindkeys &
# sxhkd &

# Xresources
xrdb $HOME/.Xresources &

# Wallpaper
nitrogen --restore &
# feh --bg-tile "/home/luizf/Patterns/escheresque/escheresque.png" &
# xsetroot -solid "#5C6F69"

# Kill the rodent
unclutter -noevents -root -idle 1 &

# Redshift
# ( sleep 1 && redshift -l 5.35:100.28 -t 5900:4000 -m vidmode ) &

# Desktop compositing
# compton -I 2 -O 2 -D 20 -m 2 -c -C -z -f -b &
# compton -cCGb &

# Daemons
# thunar --daemon &
urxvtd -q -o -f &
udiskie &
loliclip -d &
# VBoxClient-all &

pidof mpd >& /dev/null
if [ $? -ne 0 ]; then
  mpd &
fi

# Panels
# bmpanel2 --theme=darks &
# tint2 &
# conky -c ~/.conkyrc &

# [ -e "$PANEL_FIFO" ] && rm "$PANEL_FIFO"
# mkfifo "$PANEL_FIFO"

# panel dzen2 &
# exec bspwm -s "$PANEL_FIFO" -p W

# exec openbox-session
# exec pekwm
# exec herbstluftwm
# exec i3
# exec ratpoison
# exec fvwm
# exec sawfish
exec $HOME/bin/wmrun.sh
# exec $HOME/Builds/stumpwm/stumpwm

# vim: ft=sh:
