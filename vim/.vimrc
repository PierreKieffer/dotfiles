
" status bar settings
set laststatus=2

" special caract settings + indent lines guides for vim-go 
set list lcs=tab:\¦\
set list!

" indent line 
let g:indentLine_enabled = 0
let g:indentLine_color_term = 252

" key mapping 
nmap <F12> :q!<ENTER>
nmap <F10> :wq!<ENTER>
nmap <F9> :w!<ENTER>

nmap <F7> :%!python -mjson.tool<ENTER>
nmap <F6> :NERDTreeToggle<CR>
nmap <F5> :set number !<ENTER>
nmap <F4> :set list!<ENTER> :hi SpecialKey ctermfg=grey guifg=grey54 <ENTER>
nmap <F3> :IndentLinesToggle <ENTER>

" map esc key 
imap kj <ESC>

" auto closing brackets 
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O


" pluggins 
call plug#begin('~/.vim/plugged')
Plug 'chrisbra/vim-commentary'
Plug 'mzlogin/vim-markdown-toc'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-markdown'
Plug 'fatih/vim-go'
Plug 'Yggdroot/indentLine'
Plug 'ayu-theme/ayu-vim'
Plug 'arcticicestudio/nord-vim'
call plug#end()

" ctrlp 
let g:ctrlp_working_path_mode = 0

set termguicolors
let ayucolor="mirage"
colorscheme ayu
let g:lightline = {'colorscheme': 'wombat',}




""" other configs
" gruvbox colorscheme settings  
" call plug#begin('~/.vim/plugged')
" Plug 'morhetz/gruvbox'
" call plug#end()
" let g:gruvbox_contrast_dark = 
"soft"
" set t_Co=256
" set background=dark
" colorscheme gruvbox
