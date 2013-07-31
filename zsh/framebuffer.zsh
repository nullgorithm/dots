#!/bin/zsh

if [[ ${TERM} == linux ]] || [[ ${TERM} =~ screen && ${+DISPLAY} == 0 ]]; then
  echo -en "\e]P0000000" ; echo -en "\e]P83d3a3a" # 0: black/default
  echo -en "\e]P1d770af" ; echo -en "\e]P9d28abf" # 1: red
  echo -en "\e]P278a45c" ; echo -en "\e]PA9acc79" # 2: green
  echo -en "\e]P3c8bc45" ; echo -en "\e]PBd0d26b" # 3: yellow
  echo -en "\e]P477b6c5" ; echo -en "\e]PC8fa7b9" # 4: blue
  echo -en "\e]P5a488d9" ; echo -en "\e]PDbd89de" # 5: magenta
  echo -en "\e]P67ac0af" ; echo -en "\e]PE6ec2a8" # 6: cyan
  echo -en "\e]P7909090" ; echo -en "\e]PFdfdfdf" # 7: white
fi
