#!/usr/bin/env zsh

if [[ -f $ZSH/zsh-syntax-highlighting.zsh ]] {
  . $ZSH/zsh-syntax-highlighting.zsh

  ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern root)

  ZSH_HIGHLIGHT_STYLES[alias]='fg=green,bold'
  ZSH_HIGHLIGHT_STYLES[builtin]='fg=red,bold'
  ZSH_HIGHLIGHT_STYLES[function]='fg=blue,bold'
  ZSH_HIGHLIGHT_STYLES[command]='fg=blue,bold'
  ZSH_HIGHLIGHT_STYLES[path]='fg=brightwhite,underline'

  ZSH_HIGHLIGHT_PATTERNS+=('sudo' 'fg=brightwhite,bold,bg=red')
  ZSH_HIGHLIGHT_PATTERNS+=('pacman' 'fg=yellow,bold')
}
