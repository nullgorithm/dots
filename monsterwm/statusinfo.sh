#!/usr/bin/env sh

# expects a line from monsterwm's output as argument ("$1")
# prints formatted output to be used as input for bar
# reference: bar by LemonBoy -- https://github.com/LemonBoy/bar

# desktop status
for desk; do
    d="${desk%%:*}" desk="${desk#*:}" # desktop id
    w="${desk%%:*}" desk="${desk#*:}" # window count
    l="${desk%%:*}" desk="${desk#*:}" # layout mode
    c="${desk%%:*}" desk="${desk#*:}" # is current desktop
    u="${desk%%|*}" desk="${desk#*|}" # has urgent hint


    # desktop id
    case "$d" in
        0) d=" main" ;; 1) d=" web" ;;
      2) d=" im" ;; 3) d=" misc" ;;
    esac

    # current desktop
    if [ $c -ne 0 ]
    then bg="\b7" un="\u2" fg="\f2"
        case "$l" in
            0) s="" ;; 1) s="" ;; 2) s="" ;;
            3) s="" ;; 4) s="" ;;
        esac && s="\b7\u7 $s \br\ur"
    fi

    # has urgent hint or no windows
    [ $u -ne 0 ] && un="\u2"
    [ $w -eq 0 ] && w="-"

    in="$in$bg$fg$un $d \f8$w \ur\br\fr"
    unset bg fg un
done

# music status
music="$(mpc current -f "%title% by %artist% on %album%")"
if [ -z "$music" ]; then music="not playing" mstat=""
else
    mstat="$(mpc | sed -rn '2s/\[([[:alpha:]]+)].*/\1/p')"
    [ "$mstat" == "paused" ] && mstat="" || mstat=""
fi

# volume status
if [ "$(amixer get Master | sed -nr '$ s:.*\[(.+)]$:\1:p')" == "off" ]
then vol="[M]" vstat=""
else
    vol="$(amixer get PCM | sed -nr '$ s:.*\[(.+%)].*:\1:p')"
    if   [ "${vol%\%}" -le 10 ]; then vstat=""
    elif [ "${vol%\%}" -le 20 ]; then vstat=""; else vstat=""; fi
fi

# battery
bat="$(acpi | awk '{ print $4 }' | sed s/","//g)" batstat=""

# cpu
cpu="$(cut -d " " -f 1-3 /proc/loadavg)" cpustat=""

# temp
temp="$(sensors | grep -P "(temp1)" | cut -b 16-19)" cputemp="$(echo -n $temp)" tempstat=""

# date and time
date="$(date +"%I:%M, %d.%m.%Y")" dstat=""

# window title
wname=$(xdotool getactivewindow getwindowname)

# symbols
arrow=""

printf '%s %s %s' "$in" "$arrow" "$s" "\c" "\\b7\\u7 $wname \\b0\\f0\\u0" "\r"
printf ' \\b4\\u4\\f0 %s \\br\\ur\\fr %s' "$batstat" "$bat" "$cpustat" "$cpu \\f8- \\f1$cputemp" "$mstat" "$music \\f8($vol)" "$dstat" "$date "
printf '\n'
