" emmet {{{
let g:user_emmet_install_global = 0
" autocmd FileType html,css EmmetInstall
" }}}
" ctrlp {{{
let g:ctrlp_map = '<C-f>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
" }}}
" neocomplcache {{{
" enable at startup
let g:neocomplcache_enable_at_startup = 1

" enable smartcase
let g:neocomplcache_enable_smart_case = 1

" keybindings
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y>  neocomplcache#close_popup()
"inoremap <expr><C-e>  neocomplcache#cancel_popup()
" }}}
" minibufexpl {{{
"nnoremap <C-b> :MBEToggle<CR>
"nnoremap <C-n> :MBEbn<CR>
"nnoremap <C-p> :MBEbp<CR>
" }}}
" vim-airline {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" }}}
" lightline.vim {{{
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"⭤":""}',
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }
" }}}
" vim-powerlne {{{
let g:Powerline_symbols = 'fancy'
let g:Powerline_colorscheme = 'default'
let g:Powerline_mode_n = 'N'
let g:Powerline_mode_i = 'I'
let g:Powerline_mode_R = 'R'
let g:Powerline_mode_v = 'V'
let g:Powerline_mode_V = 'V-L'
let g:Powerline_mode_cv = 'V-B'
let g:Powerline_mode_s = 'S'
let g:Powerline_mode_cs = 'S-B'
" }}}
