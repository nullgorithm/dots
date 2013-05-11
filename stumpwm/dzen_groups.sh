#!/bin/bash

current='^bg(#334359)^fg(#A0A0A0)'
last='^bg(#282828)^fg(#757575)'
other='^bg(#161616)^fg(#454545)'

current2='^bg(#4A5D74)^fg(#acacac)'
last2='^bg(#404040)^fg(#A0A0A0)'
other2='^bg(#202020)^fg(#606060)'

groups=$(sh ~/Builds/stumpwm/contrib/stumpish groups)

for g in $groups; do
	n=$(echo $g | sed -e "s/^\([0-9]\).*/\1/")
	group=$(echo $g | sed -e "s/^[0-9]//")
	name=$(echo $group | sed -e "s/^[-+*]//")
	format1=$(echo $group | sed \
		-e "s/^-.*/$other /" \
		-e "s/^\+.*/$last /" \
		-e "s/^\*.*/$current /")
	format2=$(echo $group | sed \
		-e "s/^-.*/$other2 /" \
		-e "s/^\+.*/$last2 /" \
		-e "s/^\*.*/$current2 /")
	echo -n "^ca(1,stumpish go-group '$n')$format2$n $format1$name ^fg()^bg()^ca() "
done
