# Dir aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ~='cd ~'
alias b='cd /bin'
alias e='cd /etc'
alias d='cd /dev'
alias h='cd $HOME'
alias cfg='cd ${XDG_CONFIG_HOME}'
alias m='cd /media'
alias M='cd /mnt'
alias D='cd /mnt/data'
alias u='cd /usr'
alias us='cd /usr/share'
alias bsr='source $HOME/.bashrc'
alias sr='source $HOME/.zshrc'

# To make sudo aliases work
alias sudo='sudo '
alias s='sudo '

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
alias cdd='cower -d'
alias cs='cower -s'
alias ci='cower -i'
alias cm='cower -m'

# Configs aliases
alias v='vim'
alias sv='sudo vim'
alias t='todo -d ~/.config/todo.txt/config'
alias vv='vim ~/.vimrc'
alias xr='xrdb ~/.Xresources'
alias vx='vim ~/.Xresources'
alias xin='vim ~/.xinitrc'
alias xconf='sudo vim /etc/X11/xorg.conf'

# ls family
alias l='ls++'
alias ls='ls --color=auto'
alias lso='ls | pv -qL 10'
alias lsq='ls --color=always --time-style=full-iso -AlQ'
alias lsl='ls --color=auto   --group-directories-first -Ah'
alias lss='ls --color=auto -1 | grep "(^\w*[^_-])"'
alias ls1='ls -1'
alias lsa='ls --color=auto --time-style=full-iso'

# I prefer use git aliases on gitconfig
alias ga='git add'
alias gs='git status'
alias gc='git commit -m'

# Make aliases
alias mc='make clean'
alias mt='make test'
alias smi='sudo make install'
alias smci='sudo make clean install'

# Shell specific aliases
alias q='exit'
alias qq='exit'
alias :q='exit'
alias his='history'
alias cls='clear'
alias lg='logout'

# Misc
alias du='du -sh'
alias go='xinit -- vt01'
alias pkx='pkill X'
alias snl='sudo netctl start luizf'
alias starwars='telnet towel.blinkenlights.nl'

# reboot/shutdown
alias sd='sudo halt'
alias rb='sudo reboot'

# These names are too long
alias wee='weechat-curses'
alias wi='wicd-curses'
alias gfv='get_flash_videos'
alias yd='youtube-dl' 

# verbose mode for various commands
alias mk='mkdir -p'
alias mkdir='mkdir -p'
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'
alias ln='ln -sr'
alias grep='grep -Pi --color=auto'
alias grepp='grep -Pi --color=auto "^|$@"'
alias rmvi='rm *.sw*'
alias prename='prename -v'

# mpd binds
alias pl='mpc play'
alias pa='mpc pause'
alias st='mpc stop'
alias pr='mpc previous'
alias nx='mpc next'
alias sta='mpc status'
alias curr='mpc current'
