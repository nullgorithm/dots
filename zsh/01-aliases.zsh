#!/usr/bin/env zsh

# Dir aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ~='cd ~'
alias b='cd /bin'
alias e='cd /etc'
alias d='cd /dev'
alias h='cd $HOME'
alias c='cd $XDG_CONFIG_HOME'
alias m='cd /media'
alias M='cd /mnt'
alias D='cd /media/data'
alias u='cd /usr'
alias us='cd /usr/share'

# Pacman/AUR aliases
alias sp='sudo pacman'
alias S='sudo pacman -S'
alias Ss='sudo pacman -Ss'
alias se='pacman -Q | grep'
alias Syu='sudo pacman -Syu'
alias Syuu='sudo pacman -Syuu'
alias R='sudo pacman -R'
alias rsn='sudo pacman -Rsn $(pacman -Qdtq)'
alias pacs='sudo pacman -Scc'
alias U='sudo pacman -U'

# ls family
alias l='ls --color=auto'
alias la='ls -a'

# Shell specific aliases
alias q='exit'
alias cls='clear'
alias lg='logout'

# Misc
alias du='du -sh'
alias df='df -h'
alias go='startx'
alias pkx='pkill X'
alias snl='sudo netctl start luizf'
alias starwars='telnet towel.blinkenlights.nl'
alias ln='ln -sr'

# reboot/shutdown
alias rb='systemctl reboot'
alias sd='systemctl poweroff'
alias hi='systemctl hibernate'

# These names are too long
alias wee='weechat-curses'
alias wi='wicd-curses'
alias gfv='get_flash_videos'
alias yd='youtube-dl'
