#!/usr/bin/env zsh

# Dir aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ~='cd ~/'
alias b='cd ${HOME}/bin'
alias e='cd /etc'
alias E='cd ${XDG_CONFIG_HOME}'
alias m='cd /media'
alias M='cd /mnt'
alias D='cd /mnt/data'
alias u='cd /usr'

# Pacman/AUR aliases
alias sp='sudo pacman'
alias S='sudo pacman -S'
alias Ss='pacsearch'
alias se='pacman -Q | grep'
alias Syu='sudo pacman -Syu'
alias Syuu='sudo pacman -Syuu'
alias R='sudo pacman -R'
alias Rs='sudo pacman -Rs'
alias rsn='sudo pacman -Rsn `pacman -Qdtq`'
alias pacs='sudo pacman -Scc'
alias U='sudo pacman -U'

# ls family
alias ls='ls --color=auto'
alias la='ls -a'

# Shell specific aliases
alias q='exit'
alias cls='clear'
alias lg='logout'

# Misc
alias go='startx >/dev/null 2>&1'
alias snl='sudo netctl start luizf'
alias starwars='telnet towel.blinkenlights.nl'
alias clock='watch --no-title --color "date +'%H:%M' | toilet --filter metal --font ascii12"'

# systemd
alias rb='systemctl reboot'
alias sd='systemctl poweroff'
alias enbl='sudo systemctl enable'
alias dsbl='sudo systemctl disable'

# These names are too long
alias wee='weechat-curses'
alias wi='wicd-curses'
alias gfv='get_flash_videos'
alias yd='youtube-dl'

# coreutils
alias rm='rm -v'
alias mv='mv -v'
alias cp='cp -v'
alias du='du -sh'
alias df='df -h'
alias ln='ln -sr'
alias locate='locate -i'
