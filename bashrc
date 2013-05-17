#!/bin/bash

[[ $- = *i* ]] || return

# Alias
source ~/.alias

# Options {{{
shopt -s autocd
shopt -s cdspell
shopt -s cmdhist
shopt -s dotglob
shopt -s extglob
shopt -s globstar
shopt -s hostcomplete
shopt -s nocaseglob
shopt -s no_empty_cmd_completion
shopt -s no_empty_cmd_completion
shopt -s histappend cmdhist
shopt -s progcomp
shopt -s promptvars
shopt -s checkwinsize

set -o vi
set -o noclobber
set show-all-if-ambiguous on
# }}}

# Completion {{{
for f in '/usr/share/bash-completion/bash_completion' '/etc/bash_completion'; do
    if [ -e "$f" ]; then
        . "$f"
      fi
done

complete -cf pacman
complete -cf man
# }}}

# Functions {{{
spru() { curl -F "sprunge=<-" http://sprunge.us <"$1" ;}

cpf() { cp "$@" && goto "$_"; }
mvf() { mv "$@" && goto "$_"; }

ext() {
  if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2)   tar xvjf $1    ;;
          *.tar.gz)    tar xvzf $1    ;;
          *.tar.xz)    tar xvJf $1    ;;
          *.bz2)       bunzip2 $1     ;;
          *.rar)       7z x x $1     ;;
          *.gz)        gunzip $1      ;;
          *.tar)       tar xvf $1     ;;
          *.tbz2)      tar xvjf $1    ;;
          *.tgz)       tar xvzf $1    ;;
          *.zip)       7z x $1       ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1        ;;
          *.xz)        unxz $1        ;;
          *.exe)       cabextract $1  ;;
          *)           echo "\`$1': unrecognized file compression" ;;
      esac
  else
      echo "\`$1' is not a valid file"
  fi
}

# dir_colors
if [ -n "$(type -p dircolors)" ]; then
    eval $(dircolors -b ~/.config/LS_COLORS)
fi

mplayer() {
  /usr/bin/mplayer \
    -msgmodule 1 -msgcolor -include $HOME/.mplayer/config "$@"
}

cd() {
  builtin cd "$1"; ls++
}

# Notes
n() { 
  local arg files=()
  for arg; do 
      files+=( $HOME/".notes/$arg" )
  done
  ${EDITOR:-vi} "${files[@]}"; 
}

nls() {
  tree -CR --noreport $HOME/.notes | awk '{ 
    if (NF==1) print $1 
    else if (NF==2) print $2
    else if (NF==3) printf "  %s\n", $3 
  }'
}

# TAB completion for notes
_notes() {
  local files=($HOME/.notes/**/"$2"*)
  [[ -e ${files[0]} ]] && COMPREPLY=( "${files[@]##$HOME/.notes/}" )
}
complete -o default -F _notes n

. $HOME/.z_cd/z.sh
# }}}

# Prompt {{{
_prompt_command() {
    builtin history -a
    case "$TERM" in
        rxvt* | xterm*)
            echo -en "\e[m\e[1;33m$(git branch --no-color 2> /dev/null | grep '^\*' | sed 's/\* \(.*\)/ (\1)/') "
            ;;
    esac
tput ed
}

PS1="\[\e[1;35m\]$\[\e[0m\] "
PS2="\[\e[1;30m\]◀\[\e[0m\] "
PROMPT_COMMAND='_prompt_command'
# }}}

# Exports {{{
export LANG=pt_BR.UTF-8
export LC_ALL=
export LC_COLLATE='C'
export SHELL=/bin/bash
export EDITOR=vim
export BROWSER=dwb
export PAGER=less
export MOZ_DISABLE_PANGO=0
export FIREFOX_DSP=none
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'
export GROFF_NO_SGR=1
export LESS='FRSXQ'
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export LESS_TERMCAP_ue=$'\E[0m'
export XDG_CONFIG_HOME=$HOME/.config
export XDG_MUSIC_DIR=/mnt/data/Musics
export XDG_VIDEOS_DIR=/mnt/data/Videos
export XDG_PICTURES_DIR=/mnt/data/Pics
export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/bin/site_perl:/usr/bin/core_perl:/usr/bin/vendor_perl:$HOME/bin:$HOME/.gem/ruby/2.0.0/bin
# }}}

# vim: ft=sh:
