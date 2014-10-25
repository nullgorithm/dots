#!/bin/bash

#======~===~==============~===========~==
# GEOMETRY
#==~==========~=========~=============~~=
monitor=${1:-0}
geometry=( $(herbstclient monitor_rect "$monitor") )
if [ -z "$geometry" ] ;then
    echo "Invalid monitor $monitor"
    exit 1
fi
# geometry has the format: WxH+X+Y
x=${geometry[0]}
y=${geometry[1]}
width=${geometry[2]}
height=12
font="lemon-8"

sep="^fg(#000000)^ro(1x$height)^fg()"

#======~===~==============~===========~==
# COLORS
#==~==========~=========~=============~~=

xrdb=( $(xrdb -query | grep -P "color[0-9]*:" | sort | cut -f 2-) )

declare -A color
index=0

for name in black brightgreen brightyellow brightblue brightmagenta brightcyan brightwhite red green yellow blue magenta cyan white grey brightred; do
  color[${name}]=${xrdb[$index]}
  ((index++))
done

bgcolor='#151515'
separator_color='#000000'
hint_color_separator='#202020'
tag_active_color_fg='#151515'
tag_active_color_bg='#607B8B'
tag_active_color_separator=${color["brightblue"]}
#tag_active_color_separator='#ffdf7f'
tag_populated_color_fg='#efefef'
tag_populated_color_bg='#282828'
tag_populated_color_separator='#404040'
tag_notice_color_fg='#efefef'
tag_notice_color_bg=${color["red"]}
tag_notice_color_separator=${color["brightred"]}

#======~===~==============~===========~==
# ICONS
#==~==========~=========~=============~~=
iconpath="~/dots/icons"

function icon() {
  echo -n "^fg(#000000)^ro(1x$height)^fg(#404040)^ro(1x$height)^fg()^bg(#000000)^fg(${color[${2}]}) ^i(${iconpath}/${1}.xbm) ^fg(#404040)^ro(1x$height)^fg()^bg()^fg(#000000)^ro(1x$height)^fg()"
}

#======~===~==============~===========~==
# BATTERY
#==~==========~=========~=============~~=
function battery() {
  bat="$(acpi | awk '{ print $4 }' | sed s/","//g | sed s/"%"//g)"
  echo -n "$(icon ac1 red) ${bat}^fg(#606060)%"
}

#======~===~==============~===========~==
# CPU
#==~==========~=========~=============~~=
function temperature() {
  temp=$(sensors | grep "Core" | cut -b 16-19)
  cpu=$(cut -d " " -f 1-3 /proc/loadavg)
  echo -n $(icon cpu yellow) ${cpu} / ${temp}
}

#======~===~==============~===========~==
# MPD
#==~==========~=========~=============~~=
function m() {
  mpc -f %${1}% current | sed 's/ä/ae/g' | sed 's/ö/oe/g' | sed 's/ü/ue/g'
}

function vol() {
  amixer get PCM | sed -nr '$ s:.*\[(.+%)].*:\1:p'
}

function nowplaying() {
  echo -n "$(icon note1 blue) $(m title) ^fg(#606060)by^fg() $(m artist) ^fg(#606060)on^fg() $(m album) ^fg(#606060)($(vol))"
}

#======~===~==============~===========~==
# MEM
#==~==========~=========~=============~~=
function mem() {
  memory=$(free -om | awk '/Mem:/ {print int($3 - $7 - $6)}')
  echo -n "$(icon memory magenta) ^fg(#606060)used ^fg()${memory} ^fg(#606060)Mb"
}


#======~===~==============~===========~==
# GET TO WORK
#==~==========~=========~=============~~=
function uniq_linebuffered() {
  awk '$0 != l { print ; l=$0 ; fflush(); }' "$@"
}

herbstclient pad $monitor $height
{
  mpc idleloop player &
  while true ; do
    date +'date ^fg(#efefef)%I:%M^fg(#909090), ^fg(#efefef)%d^fg(#909090)-%m-%Y'
    sleep 1 || break
  done | (uniq_linebuffered)  &
  childpid=$!
  herbstclient --idle
  kill $childpid
} 2> /dev/null | {
  TAGS=( $(herbstclient tag_status $monitor) )
  date=""
  while true ; do
    bordercolor="#000000"
    hintcolor="#050505"

    # draw tags
    for i in "${TAGS[@]}" ; do
      case ${i:0:1} in
        '#')
          echo -n "^fg($tag_active_color_separator)^ro(1x$height)^fg()^bg($tag_active_color_bg)^fg($tag_active_color_fg)" ;;
        '+')
          echo -n "^fg()^ro(1x$height)^fg()^bg(#9CA668)^fg(#141414)";;
        ':')
          echo -n "^fg($tag_populated_color_separator)^ro(1x$height)^fg()^bg($tag_populated_color_bg)^fg($tag_populated_color_fg)";;
        '!')
          echo -n "^fg($tag_notice_color_separator)^ro(1x$height)^fg()^bg($tag_notice_color_bg)^fg($tag_notice_color_fg)";;
        *)
          echo -n "^fg(#252525)^ro(1x$height)^fg()^bg()^fg()";;
      esac
      echo -n "^ca(1,herbstclient focus_monitor $monitor && "'herbstclient use "'${i:1}'") '"${i:1} ^ca()"
      echo -n "^fg($separator_color)^ro(1x$height)^fg()"
    done
    echo -n "^fg(#252525)^ro(1x$height)^fg()"
    echo -n "^bg()^p(_CENTER)"

    # small adjustments
    right=""
    for func in battery mem temperature nowplaying; do
      right="${right} $(${func})"
    done
    right="${right} ^bg($hintcolor)$(icon clock1 green) $date"
    right_text_only=$(echo -n "$right"|sed 's.\^[^(]*([^)]*)..g')

    # get width of right aligned text.. and add some space..
    width=$(textwidth "$font" "$right_text_only                    ")
    echo -n "^p(_RIGHT)^p(-$width)$right"
    echo

    # wait for next event
    read line || break
    cmd=( $line )

    # find out event origin
    case "${cmd[0]}" in
      tag*)
        #echo "reseting tags" >&2
        TAGS=( $(herbstclient tag_status $monitor) );;
      date)
        #echo "reseting date" >&2
        date="${cmd[@]:1}";;
      quit_panel)
        exit;;
      reload)
        exit;;
    esac
  done
} 2> /dev/null | dzen2 -w $width -x $x -y $y -fn "$font" -h $height \
  -ta l -bg "$bgcolor" -fg '#cccccc'
