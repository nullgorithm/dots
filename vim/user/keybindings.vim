let mapleader=';'

map <C-q> :q<CR>

" syntax
nnoremap <silent> <leader>fv :set ft=vim<CR>
nnoremap <silent> <leader>fb :set ft=bash<CR>
nnoremap <silent> <leader>fz :set ft=zsh<CR>
nnoremap <silent> <leader>fc :set ft=conf<CR>
nnoremap <silent> <leader>fh :set ft=html<CR>
nnoremap <silent> <leader>fp :set ft=python<CR>

" tabs
nnoremap <F1> :tabclose<CR>
nnoremap <F2> :tabprev<CR>
nnoremap <F3> :tabnext<CR>
nnoremap <F4> :tabnew<CR>

" move between buffers
nnoremap <C-p> :bp!<CR>
nnoremap <C-n> :bn!<CR>
nnoremap <C-d> :bd<CR>

" movement
nnoremap j jzz
nnoremap k kzz
vnoremap j jzz
vnoremap k kzz

nnoremap J 10jzz
nnoremap K 10kzz
vnoremap J 10jzz
nnoremap K 10kzz

inoremap jj <Esc>
inoremap jk <Esc>

" space bar un-highligts search
noremap <silent> <Space> :silent noh<Bar>echo<CR>

" save file as sudo
cmap w!! w !sudo tee > /dev/null %

" emacs keybindings in commnadline
cmap <C-a> <Home>
cmap <C-e> <End>
cmap <C-b> <Left>
cmap <C-d> <Del>
cmap <C-f> <Right>
cmap <C-n> <Down>
cmap <C-p> <Up>

" insert current date/time
nnoremap <leader>d "=strftime("%d %b %Y %H:%M BRT")<CR>p

" delete previous word with C-BS
inoremap <C-BS> <C-W>

" text transformation
nnoremap <leader>cl :left<CR>
nnoremap <leader>cr :right<CR>
nnoremap <leader>cc :center<CR>

" window management
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

nnoremap \| :vsplit<CR>
nnoremap _ :split<CR>

nnoremap - <C-w>-
nnoremap + <C-w>+
nnoremap = <C-w>=
nnoremap < <C-w>8<
nnoremap > <C-w>8>
