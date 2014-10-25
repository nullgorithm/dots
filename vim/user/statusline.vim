" Functions {{{
function! FileSize()
  let bytes = getfsize(expand("%:p"))
  if bytes <= 0
    return ""
  endif
  if bytes < 1024
    return bytes
  else
    return (bytes / 1024) . "K"
  endif
endfunction

function! SetStatusLeaveBuffer()
  setl statusline=""
  call SetStatus()
endfunction
au BufLeave * call SetStatusLeaveBuffer()

au VimEnter    * call SetStatusInsertMode('normal')
au InsertEnter * call SetStatusInsertMode(v:insertmode)
au InsertLeave * call SetStatusInsertMode('normal')
au BufEnter    * call SetStatusInsertMode('normal')

function! StatusExpandtabON()
  if &expandtab
    return "⇄"
  else
    return ""
  endif
endfunction "

function! StatusExpandtabOFF()
  if &expandtab
    return ""
  else
    return "⇄"
  endif
endfunction

function! StatusTabstop()
  let str = "" . &tabstop
  " show softtabstop or shiftwidth if not equal tabstop
  if   (&softtabstop && (&softtabstop != &tabstop))
  \ || (&shiftwidth  && (&shiftwidth  != &tabstop))
    if &softtabstop
      let str = str . ":sts" . &softtabstop
    endif
    if &shiftwidth != &tabstop
      let str = str . ":sw" . &shiftwidth
  endif
  endif
  return str
endfunction

function! StatusInvisiblesON()
  "if exists("g:LIST") && g:LIST == 1
  if &list
    if     &encoding == "latin1"
      return "¶"
    elseif &encoding == "utf-8"
      return "¶"
    else
      return "$"
    endif
  else
    return ""
  endif
endfunction

function! StatusInvisiblesOFF()
  "if exists("g:LIST") && g:LIST == 1
  if &list
    return ""
  else
    if     &encoding == "latin1"
      return "¶"
    elseif &encoding == "utf-8"
      return "¶"
    else
      return "$"
    endif
  endif
endfunction

function! StatusWrapON()
  if &wrap
    return "↪"
  else
    return ""
  endif
endfunction

function! StatusWrapOFF()
  if &wrap
    return ""
  else
    return "↪"
  endif
endfunction

function! SetStatusInsertMode(mode)
  setl statusline=%4*
  if a:mode == 'i'
    setl statusline+=%1*\ I\ 
  elseif a:mode == 'r'
    setl statusline+=\ R\ 
  elseif a:mode == 'normal'
    setl statusline+=%2*\ N\ 
  endif
  call SetStatus()
  call SetRightStatus()
endfunction 

function! SetStatus()
  setl statusline+=%3*\ %F%H%M%R%W\ %4*\ %Y\ %9*\ %{FileSize()}
endfunction

function! SetRightStatus()
  setl statusline+=
        \%3*\%=%<
        \%6*\ %{StatusWrapON()}
        \%5*%{StatusWrapOFF()}\
        \%6*\ %{StatusInvisiblesON()}
        \%5*%{StatusInvisiblesOFF()}\
        \%6*\ %{StatusExpandtabON()}
        \%5*%{StatusExpandtabOFF()}\
        \%6*\ w%{StatusTabstop()}\ \
        \%7*\ %l-%c/%L
        \\ 
endfunction

let g:NCstatusline='%3*%f'
" }}}

" Colors {{{
hi User1 ctermfg=000 ctermbg=012 cterm=none guifg=#151515 guibg=#9B8D74
hi User2 ctermfg=233 ctermbg=002 cterm=bold guifg=#151515 guibg=#598A76
hi User3 ctermfg=251 ctermbg=000 cterm=none guifg=#ddddee guibg=#202020
hi User4 ctermfg=015 ctermbg=008 cterm=none guifg=#606060 guibg=#282828
hi User5 ctermfg=007 ctermbg=008 cterm=none guifg=#505050 guibg=#282828
hi User6 ctermfg=015 ctermbg=008 cterm=none guifg=#F1F1BC guibg=#282828
hi User7 ctermfg=235 ctermbg=255 cterm=none guifg=#151515 guibg=#eeeeee
hi User8 ctermfg=008 ctermbg=239 cterm=none
hi User9 ctermfg=007 ctermbg=000 cterm=none
hi! StatusLine       ctermbg=000 ctermfg=234 cterm=none
hi! StatusLineNC     ctermbg=000 ctermfg=232 cterm=none
" }}}
