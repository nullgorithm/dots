#!/bin/zsh

. $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

ZSH_HIGHLIGHT_MATCHING_BRACKETS_STYLES=(
  'fg=blue,bold'
  'fg=green,bold'
  'fg=magenta,bold'
  'fg=cyan,bold'
  'fg=white,bold'
  'fg=blue'
  'fg=green'
  'fg=magenta'
  'fg=cyan'
  'fg=white'
)

ZSH_HIGHLIGHT_STYLES[default]='none'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red,bold,underline'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=green'
ZSH_HIGHLIGHT_STYLES[alias]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=blue'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=red,bold,standout'
ZSH_HIGHLIGHT_STYLES[path]='fg=white,underline'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=white,bold'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=blue'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=blue'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=blue'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=blue'
ZSH_HIGHLIGHT_STYLES[assign]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=red,bold'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=blue,bold'

ZSH_HIGHLIGHT_PATTERNS+=('sudo ' 'fg=red,bold')
