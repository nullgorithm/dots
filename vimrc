" vim: ft=vim et ts=2 fdm=marker fmr="<,">

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"<Bundles
" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'kien/ctrlp.vim'
" Bundle 'Lokaltog/vim-powerline'
Bundle 'w0ng/vim-hybrid'
Bundle 'scrooloose/syntastic'
Bundle 'baskerville/vim-sxhkdrc'
">

syntax on
filetype plugin indent on

"<Colorscheme
colorscheme forst
"let g:hybrid_use_Xresources = 1
">

"<Options
set autochdir
set autoindent
set autoread
set cmdheight=1
set completeopt=longest
set confirm
set cursorline
set encoding=utf-8
set expandtab
set hidden
set history=70
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set linebreak
set list
set listchars=tab:->,trail:·,precedes:«,extends:»
set magic
set mouse=a
set mousemodel=popup
set nobackup
set nocursorcolumn
set noerrorbells
set ofu=syntaxcomplete#Complete
set showmode
set noswapfile
set nowrap
set number
set pastetoggle=<C-p>
set shell=/bin/zsh
set shiftwidth=2
set shortmess=aTItoO
set showcmd
set showmatch
set smartcase
set smartindent
set smarttab
set splitbelow
set statusline=[%n]\ %<%f%m%r\ %w\ %y\ \ %=\ %l,%c%V\/%L\ \ %P
set tabstop=2
set title
set ttyfast
set virtualedit=all
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildmenu
">

"<Binds
" Mapleader
let mapleader = ' '

nmap Y y$

nnoremap ' `
nnoremap ` '

" Window management
nmap =  <C-W>-
nmap +  <C-W>+
nmap _  :split<CR>
nmap \| :vsplit<CR>

" Tabs
nmap <F1> :tabclose<CR>
nmap <F2> :tabprev<CR>
nmap <F3> :tabnext<CR>
nmap <F4> :tabnew<CR>

" Buffers
nnoremap b1 :b1<CR>
nnoremap b2 :b2<CR>
nnoremap b3 :b3<CR>
nnoremap b4 :b4<CR>
nnoremap b5 :b5<CR>
nnoremap b6 :b6<CR>
nnoremap b7 :b7<CR>
nnoremap b8 :b8<CR>
nnoremap b9 :b9<CR>
nnoremap b0 :b10<CR>
nnoremap bd :bdelete<CR>

nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprev<CR>

nmap <leader>cd :cd %:p:h<CR>

" Text transformation
nmap <leader>cl :left<CR>
nmap <leader>cr :right<CR>
nmap <leader>cc :center<CR>

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Keep cursor centered
nnoremap j jzz
nnoremap k kzz
vnoremap j jzz
vnoremap k kzz
nnoremap J 10jzz
nnoremap K 10kzz
vnoremap J 10jzz
vnoremap K 10kzz

" :set ft=
nmap <leader>1 :set ft=bash<CR>
nmap <leader>2 :set ft=zsh<CR>
nmap <leader>3 :set ft=vim<CR>
nmap <leader>4 :set ft=lua<CR>
nmap <leader>5 :set ft=c<CR>
nmap <leader>0 :set ft=conf<CR>

" Edit vimrc
nmap <C-,> :tabnew ~/.vimrc<CR>

" Quit, now!
cmap qq qa!<CR>
">

"< Junk
" Restore cursor position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" Allows writing to files with root priviledges
cmap sw w !sudo tee % > /dev/null
">

"<Plugins
" Powerline
let g:Powerline_symbols = 'fancy'

" Ctrlp
let g:ctrlp_map = '<C-f>'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_show_hidden = 1

" Colorizer
let g:cssColorVimDoNotMessMyUpdateTime = 1

" NERDTree
" map <C-f> :NERDTreeToggle<CR>
let NERDTreeChDirMode = 2
let NERDTreeShowBookmarks = 1
let NERDTreeMinimalUI = 1

" NeoComplCache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
inoremap <expr><C-e> neocomplcache#close_popup()
">
