#!/bin/zsh

zstyle ':completion:*' menu select=2
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*' verbose true
zstyle ':completion:*' use-cache on
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"
zstyle ':completion:*:descriptions' format "%{$c1%}%d%{$reset_color%}"
zstyle ':completion:*:corrections' format "%{$c3%}%d%{$reset_color%}"
zstyle ':completion:*:messages' format "%{$c1%}%d%{$reset_color%}"
zstyle ':completion:*:warnings' format "%{$c1%}%d%{$reset_color%}" 
