#!/usr/bin/env zsh

export EDITOR="nano"
export PAGER="less"
export BROWSER="firefox"
export LANG="en_US.UTF-8"
export SHELL="/bin/zsh"
export GREP_COLOR="1;33"

export XDG_CONFIG_HOME="${HOME}/.config"
#export XDG_DATA_HOME="${HOME}/var"
#export XDG_DOWNLOAD_DIR="${HOME}/junk"
#export XDG_MUSIC_DIR="/data/Musics"
#export XDG_PICTURES_DIR="/data/Pics"

#export BSPWM_TREE="${XDG_DATA_HOME}/bspwm/bspwm.tree"
#export BSPWM_HISTORY="${XDG_DATA_HOME}/bspwm/bspwm.history"
#export BSPWM_STACK="${XDG_DATA_HOME}/bspwm/bspwm.stack"
#export BSPWM_PANEL_FIFO="${XDG_DATA_HOME}/bspwm/bspm.fifo"
#export BSPWM_SOCKET="${XDG_DATA_HOME}/bspwm/bspwm.socket"

export HISTSIZE="1000"
export SAVEHIST="1000"
export HISTFILE="${HOME}/.zshhist"

PATHS=(
  /bin
  /sbin
  /usr/bin
  /usr/bin/site_perl
  /usr/bin/vendor_perl
  /usr/local/bin
  #${HOME}/bin
)

export PATH=${(j_:_)PATHS}
