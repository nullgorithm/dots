#!/bin/bash
# BASH fuzzyclock
# by Corey Mwamba
#
export TEXTDOMAINDIR="/usr/share/locale"
export TEXTDOMAIN=bash-fuzzy-clock


hour=`date +%H`
minute=`date +%M`

nearly=$"nearly "
justaft=$"just after "
oclock=$" o"$"'"$"clock"


case "$1" in

meri|m)
if [[ $((10#$hour)) -ge 12 ]]; then
 echo $"post meridiem"
exit 0
fi
if [[ $((10#$hour)) -le 12 ]]; then
 echo $"ante meridiem"
exit 0
fi

if [[ $((10#$hour)) -eq 0 && $((10#$minute)) -eq 0 ]]; then
 echo $"midnight"
exit 0
fi

if [[ $((10#$hour)) -eq 12 && $((10#$minute)) -eq 0 ]]; then
 echo $"noon"
exit 0
fi
;;

*)

if [[ $((10#$hour)) -eq 1 || $((10#$hour)) -eq 13 ]]; then
if [[ $((10#$minute)) -ge 0 &&  $((10#$minute)) -le 33 ]]; then
th=$"one"
else
th=$"two"
fi
fi

if [[ $((10#$hour)) -eq 2 || $((10#$hour)) -eq 14 ]]; then
if [[ $((10#$minute)) -ge 0 &&  $((10#$minute)) -le 33 ]]; then
th=$"two"
else
th=$"three"
fi
fi

if [[ $((10#$hour)) -eq 3 || $((10#$hour)) -eq 15 ]]; then
if [[ $((10#$minute)) -ge 0 &&  $((10#$minute)) -le 33 ]]; then
th=$"three"
else
th=$"four"
fi
fi

if [[ $((10#$hour)) -eq 4 || $((10#$hour)) -eq 16 ]]; then
if [[ $((10#$minute)) -ge 0 &&  $((10#$minute)) -le 33 ]]; then
th=$"four"
else
th=$"five"
fi
fi

if [[ $((10#$hour)) -eq 5 || $((10#$hour)) -eq 17 ]]; then
if [[ $((10#$minute)) -ge 0 &&  $((10#$minute)) -le 33 ]]; then
th=$"five"
else
th=$"six"
fi
fi

if [[ $((10#$hour)) -eq 6 || $((10#$hour)) -eq 18 ]]; then
if [[ $((10#$minute)) -ge 0 &&  $((10#$minute)) -le 33 ]]; then
th=$"six"
else
th=$"seven"
fi
fi

if [[ $((10#$hour)) -eq 7 || $((10#$hour)) -eq 19 ]]; then
if [[ $((10#$minute)) -ge 0 &&  $((10#$minute)) -le 33 ]]; then
th=$"seven"
else
th=$"eight"
fi
fi

if [[ $((10#$hour)) -eq 8 || $((10#$hour)) -eq 20 ]]; then
if [[ $((10#$minute)) -ge 0 &&  $((10#$minute)) -le 33 ]]; then
th=$"eight"
else
th=$"nine"
fi
fi

if [[ $((10#$hour)) -eq 9 || $((10#$hour)) -eq 21 ]]; then
if [[ $((10#$minute)) -ge 0 &&  $((10#$minute)) -le 33 ]]; then
th=$"nine"
else
th=$"ten"
fi
fi

if [[ $((10#$hour)) -eq 10 || $((10#$hour)) -eq 22 ]]; then
if [[ $((10#$minute)) -ge 0 &&  $((10#$minute)) -le 33 ]]; then
th=$"ten"
else
th=$"eleven"
fi
fi

if [[ $((10#$hour)) -eq 11 ]]; then
if [[ $((10#$minute)) -ge 0 &&  $((10#$minute)) -le 33 ]]; then
th=$"eleven"
else
th=$"midday"
fi
fi


if [[ $((10#$hour)) -eq 23 ]]; then
if [[ $((10#$minute)) -ge 0 &&  $((10#$minute)) -le 33 ]]; then
th=$"eleven"
else
th=$"midnight"
fi
fi


if [[ $((10#$hour)) -eq 12 ]]; then
if [[ $((10#$minute)) -ge 0 &&  $((10#$minute)) -le 33 ]]; then
th=$"midday"
else
th=$"one"
fi
fi

if [[ $((10#$hour)) -eq 0 ]]; then
if [[ $((10#$minute)) -ge 0 &&  $((10#$minute)) -le 33 ]]; then
th=$"midnight"
else
th=$"one"
fi
fi

if [[ $((10#$hour)) -ne 12 && $((10#$hour)) -ne 0 && $((10#$minute)) -eq 0 ]]; then
manner=$oclock
fi

if [[ $((10#$hour)) -eq 13 && $((10#$minute)) -eq 0 ]]; then
manner=$oclock
fi


if [[ $((10#$hour)) -ne 12 && $((10#$hour)) -ne 0 && $((10#$minute)) -gt 57 ]]; then
manner=$oclock
adv=$nearly
fi

if [[ $((10#$hour)) -eq 12 && $((10#$minute)) -gt 57 ]]; then
manner=$oclock
adv=$nearly
fi


if [[ $((10#$hour)) -eq 11 && $((10#$minute)) -gt 57 ]]; then
adv=$nearly
manner=""
fi

if [[ $((10#$hour)) -eq 23 && $((10#$minute)) -gt 57 ]]; then
adv=$nearly
manner=""
fi

if [[ $((10#$hour)) -ne 12 && $((10#$hour)) -ne 0 &&  $((10#$minute)) -gt 0 && $((10#$minute)) -le 3 ]]; then
manner=$oclock
adv=$justaft
fi


if [[ $((10#$hour)) -eq 12 &&  $((10#$minute)) -gt 0 &&  $((10#$minute)) -le 3 ]]; then
adv=$justaft
fi

if [[ $((10#$hour)) -eq 0 &&  $((10#$minute)) -gt 0 &&  $((10#$minute)) -le 3 ]]; then
adv=$justaft
fi


if [[ $((10#$minute)) -gt 3 && $((10#$minute)) -le 7 ]]; then
adj=$"five past "
fi

if [[ $((10#$minute)) -gt 3 && $((10#$minute)) -lt 5 ]]; then
adv=$nearly
fi

if [[ $((10#$minute)) -gt 5 && $((10#$minute)) -le 7 ]]; then
adv=$justaft
fi

if [[ $((10#$minute)) -gt 7 && $((10#$minute)) -le 13 ]]; then
adj=$"ten past "
fi

if [[ $((10#$minute)) -gt 7 && $((10#$minute)) -lt 10 ]]; then
adv=$nearly
fi

if [[ $((10#$minute)) -gt 10 && $((10#$minute)) -le 13 ]]; then
adv=$justaft
fi



if [[ $((10#$minute)) -gt 13 && $((10#$minute)) -le 17 ]]; then
adj=$"quarter past "
fi


if [[ $((10#$minute)) -gt 13 && $((10#$minute)) -lt 15 ]]; then
adv=$nearly
fi

if [[ $((10#$minute)) -gt 15 && $((10#$minute)) -le 17 ]]; then
adv=$justaft
fi


if [[ $((10#$minute)) -gt 17 && $((10#$minute)) -le 23 ]]; then
adj=$"twenty past "
fi


if [[ $((10#$minute)) -gt 17 && $((10#$minute)) -lt 20 ]]; then
adv=$nearly
fi

if [[ $((10#$minute)) -gt 20 && $((10#$minute)) -le 23 ]]; then
adv=$justaft
fi


if [[ $((10#$minute)) -gt 23 && $((10#$minute)) -le 27 ]]; then
adj=$"twenty-five past "
fi

if [[ $((10#$minute)) -gt 23 && $((10#$minute)) -lt 25 ]]; then
adv=$nearly
fi

if [[ $((10#$minute)) -gt 25 && $((10#$minute)) -le 27 ]]; then
adv=$justaft
fi


if [[ $((10#$minute)) -gt 27 && $((10#$minute)) -le 33 ]]; then
adj=$"half-past "
fi


if [[ $((10#$minute)) -gt 27 && $((10#$minute)) -lt 30 ]]; then
adv=$nearly
fi

if [[ $((10#$minute)) -gt 30 && $((10#$minute)) -le 33 ]]; then
adv=$justaft
fi


if [[ $((10#$minute)) -gt 33 && $((10#$minute)) -le 37 ]]; then
adj=$"twenty-five to "
fi

if [[ $((10#$minute)) -gt 33 && $((10#$minute)) -lt 35 ]]; then
adv=$nearly
fi

if [[ $((10#$minute)) -gt 35 && $((10#$minute)) -le 37 ]]; then
adv=$justaft
fi


if [[ $((10#$minute)) -gt 37 && $((10#$minute)) -le 43 ]]; then
adj=$"twenty to "
fi

if [[ $((10#$minute)) -gt 37 && $((10#$minute)) -lt 40 ]]; then
adv=$nearly

fi

if [[ $((10#$minute)) -gt 40 && $((10#$minute)) -le 43 ]]; then
adv=$justaft

fi



if [[ $((10#$minute)) -gt 43 && $((10#$minute)) -le 47 ]]; then
adj=$"quarter to "
fi

if [[ $((10#$minute)) -gt 43 && $((10#$minute)) -lt 45 ]]; then
adv=$nearly
fi

if [[ $((10#$minute)) -gt 45 && $((10#$minute)) -le 47 ]]; then
adv=$justaft
fi



if [[ $((10#$minute)) -gt 47 && $((10#$minute)) -le 53 ]]; then
adj=$"ten to "
fi

if [[ $((10#$minute)) -gt 47 && $((10#$minute)) -lt 50 ]]; then
adv=$nearly
fi

if [[ $((10#$minute)) -gt 50 && $((10#$minute)) -le 53 ]]; then
adv=$justaft
fi



if [[ $((10#$minute)) -gt 53 && $((10#$minute)) -le 57 ]]; then
adj=$"five to "
fi

if [[ $((10#$minute)) -gt 53 && $((10#$minute)) -lt 55 ]]; then
adv=$nearly
fi

if [[ $((10#$minute)) -gt 55 && $((10#$minute)) -le 57 ]]; then
adv=$justaft
fi

printf $"$adv$adj$th$manner\n"

esac
