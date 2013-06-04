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
xset +fp /usr/share/fonts/TTF
xset +fp /usr/share/fonts/artwiz-fonts
xset +fp /usr/share/fonts/local
xset +fp /usr/share/fonts/misc
xset +fp /usr/local/share/fonts/terminus
xset +fp /usr/share/fonts/jmk
xset fp rehash

# Kill left programs
killall loliclip
killall compton
killall urxvtd

# Keyboard layout
( sleep 5 && xmodmap $HOME/.Xmodmap & ) &
# xbindkeys &
# ( sleep 5 && sxhkd & ) &

# Xresources
xrdb $HOME/.Xresources &

# Wallpaper
# nitrogen --restore &
# feh --bg-tile "/home/luizf/Patterns/escheresque/escheresque.png" &
xsetroot -solid "#5C6F69"

# Pointer hidding
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

pidof mpd >& /dev/null
if [ $? -ne 0 ]; then
  mpd &
fi

# Panels
# bmpanel2 --theme=darks &
# tint2&
# xfce4-panel &
# conky -c ~/.conkyrc &

# [ -e "$PANEL_FIFO" ] && rm "$PANEL_FIFO"
# mkfifo "$PANEL_FIFO"

# panel dzen2 &
# exec bspwm -s "$PANEL_FIFO" -p W

# VBoxClient-all &
# exec compiz
# exec openbox-session
# exec pekwm
# exec gnome-session
# exec herbstluftwm
# exec i3
# exec ratpoison
# exec fvwm
# exec sawfish
# exec subtle
# exec xmonad
# exec $HOME/bin/dwm-start
exec $HOME/bin/wmrun.sh
# exec $HOME/Builds/stumpwm/stumpwm

# vim: ft=sh
