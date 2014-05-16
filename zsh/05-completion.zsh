#!/usr/bin/env zsh

autoload -U compinit && compinit -C

# Case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' \
        'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Ignore completion to unavailable commands
zstyle ':completion:*:functions' ignored-patterns '_*'

# Show completion menu if more than 2 items to select
zstyle ':completion:*' menu select=2

# Zstyles
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' separate-sections 'yes'
zstyle ':completion:*' list-dirs-first true
zstyle ':completion:*' use-perl 1
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"
zstyle ':completion:*:processes' command 'ps -axw --forest'
zstyle ':completion:*:processes-names' command 'ps -awxho command'
zstyle ':completion:*:*:(cd):*' menu select

zstyle ':completion:*:descriptions' format "%{$c1%}%d%{$reset_color%}"
zstyle ':completion:*:corrections' format "%{$c3%}%d%{$reset_color%}"
zstyle ':completion:*:messages' format "%{$c1%}%d%{$reset_color%}"
zstyle ':completion:*:warnings' format "%{$c1%}%d%{$reset_color%}"
