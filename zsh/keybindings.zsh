#!/bin/zsh

bindkey -v
bindkey ' ' magic-space
bindkey "^[[3~" delete-char
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^H" backward-delete-char
