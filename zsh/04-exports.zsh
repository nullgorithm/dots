#!/bin/zsh

export SHELL=/bin/zsh
export EDITOR=vim
export PAGER=less

export BROWSER=firefox
export MOZ_DISABLE_PANGO=1
export FIREFOX_DSP=none

export LANG=en_US.UTF-8
#export LANG="pt_BR.UTF-8"
export LC_ALL=""
export LC_CTYPE="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_PAPER="en_US.UTF-8"
export LC_NAME="en_US.UTF-8"
export LC_ADDRESS="en_US.UTF-8"
export LC_TELEPHONE="en_US.UTF-8"
export LC_MEASUREMENT="en_US.UTF-8"
export LC_IDENTIFICATION="en_US.UTF-8"

export LESS="-RS~gIsw"
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export LESS_TERMCAP_ue=$'\E[0m'

export MPD_HOST=localhost
export MPD_PORT=6600

export FONT='-windows-montecarlo-medium-r-normal--0-0-72-72-c-0-microsoft-cp1252'
export FONT_B='-windows-montecarlo-bold-r-normal--0-0-72-72-c-0-microsoft-cp1252'
export FONT_I='-misc-fixed-medium-r-normal--8-80-75-75-c-50-iso8859-1'

export GDK_USE_XFT=1
export QT_XFT=1
export GDK_NATIVE_WINDOWS=0
export SCREENRC=$HOME/.screenrc

export XDG_CONFIG_HOME=$HOME/.config
export XDG_DESKTOP_DIR=${HOME}/junk/tmp
export XDG_DOCUMENTS_DIR=${HOME}/doc
export XDG_DOWNLOAD_DIR=${HOME}/junk
export XDG_MUSIC_DIR=/mnt/data/Musics
export XDG_VIDEOS_DIR=/mnt/data/Videos
export XDG_PICTURES_DIR=/mnt/data/Pics

export KEYTIMEOUT=50
export HISTFILE=$HOME/.zsh/history
export HISTIGNORE="&:ls:[bf]g:exit:reset:cls:cd*:gs:gd:calc:du1:l:make"
export HISTSIZE=128000
export SAVEHIST=126000

export PATH=/usr/share/perl5/site_perl/auto/share/dist/Cope:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/bin/site_perl:/usr/bin/core_perl:/usr/bin/vendor_perl:$HOME/bin:$HOME/.gem/ruby/2.0.0/bin

# export INFINALITY_FT_FILTER_PARAMS="10 22 38 22 10"
# export INFINALITY_FT_GRAYSCALE_FILTER_STRENGTH="0"
# export INFINALITY_FT_FRINGE_FILTER_STRENGTH="0"
# export INFINALITY_FT_AUTOHINT_HORIZONTAL_STEM_DARKEN_STRENGTH="10"
# export INFINALITY_FT_AUTOHINT_VERTICAL_STEM_DARKEN_STRENGTH="25"
# export INFINALITY_FT_WINDOWS_STYLE_SHARPENING_STRENGTH="50"
# export INFINALITY_FT_CHROMEOS_STYLE_SHARPENING_STRENGTH="25"
# export INFINALITY_FT_STEM_ALIGNMENT_STRENGTH="25"
# export INFINALITY_FT_STEM_FITTING_STRENGTH="25"
# export INFINALITY_FT_GAMMA_CORRECTION="0 100"
# export INFINALITY_FT_BRIGHTNESS="18"
# export INFINALITY_FT_CONTRAST="35"
# export INFINALITY_FT_USE_VARIOUS_TWEAKS="true"
# export INFINALITY_FT_AUTOHINT_INCREASE_GLYPH_HEIGHTS="true"
# export INFINALITY_FT_AUTOHINT_SNAP_STEM_HEIGHT="50"
# export INFINALITY_FT_STEM_SNAPPING_SLIDING_SCALE="30"
# export INFINALITY_FT_USE_KNOWN_SETTINGS_ON_SELECTED_FONTS="true"

export BSPWM_SOCKET=/tmp/bspwm-socket

#eval $( dircolors -b $HOME/.dir_colors )
eval $( dircolors -b $HOME/.config/LS_COLORS )
export LS_COLORS
export GREP_OPTIONS='-I --color=auto'
