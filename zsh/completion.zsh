zstyle '*'                                          single-ignored show
zstyle ':completion:*'                              verbose true
zstyle ':completion:*:functions'                    ignored-patterns '_*'
zstyle ':completion:*:descriptions'                 format "- %d -"
zstyle ':completion:*' 								menu select=2
zstyle ':completion:*:descriptions'                 format "%{$c1%}%d%{$reset_color%}"
zstyle ':completion:*:corrections'                  format "%{$c3%}%d%{$reset_color%}"
zstyle ':completion:*:messages'                     format "%{$c1%}%d%{$reset_color%}"
zstyle ':completion:*:warnings'                     format "%{$c1%}%d%{$reset_color%}"
zstyle ':completion:*:default'                      list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:(cd):*'                       group-order 'named-directories'
zstyle ':completion:*:(cd):*'                       ignore-parents parent pwd
zstyle ':completion:*:*:(cd):*'                     completer _history
zstyle ':completion:*:*:(cd):*'                     menu select auto
zstyle ':completion:*:manuals'                      separate-sections true
zstyle ':completion:*'                              squeeze-slashes true
zstyle ':completion:*:cd:*'                         ignored-patterns '(*/)#lost+found'
zstyle ':completion:*:*:(vim|rview|vimdiff|xxd):*'  file-sort name
zstyle ':completion:*:*:(vim|rview|vimdiff|xxd):*'  tag-order files
zstyle ':completion:*:*:kill:*'                     menu yes select
zstyle ':completion:*:*:kill:*:processes'           list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:processes'                    command 'ps -axw'
zstyle ':completion:*:processes-names'              command 'ps -awxho command'
zstyle ':completion:*:*:mplayer:*'                  tag-order files
zstyle ':completion:*:*:mplayer:*'                  file-patterns \
       '*.(rmvb|mkv|mpg|wmv|mpeg|avi|flv|mp3|mp4|flac|ogg):video' \
       '*:all-files' '*(-/):directories'
zstyle ':completion:*:descriptions'                 format $'%{- \e[38;5;137;1m\e[48;5;234m%}%B%d%b%{\e[m%}'
zstyle ':completion:*:warnings'                     format $'%{No match for \e[38;5;240;1m%}%d%{\e[m%}'
