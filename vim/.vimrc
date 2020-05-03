" status bar settings
set laststatus=2

" special caract settings + indent lines guides for vim-go 
hi SpecialKey ctermfg=grey guifg=grey42
set list lcs=tab:\¦\
set list!

" indent line 
let g:indentLine_enabled = 0
let g:indentLine_color_term = 242



" key mapping 
nmap <F10> :wq!<ENTER>
nmap <F9> :w!<ENTER>

nmap <F7> :%!python -mjson.tool<ENTER>
nmap <F6> :NERDTreeToggle<CR>
nmap <F5> :set number !<ENTER>
nmap <F4> :set list!<CR>
nmap <F3> :IndentLinesToggle <ENTER>


" pluggins 
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'chrisbra/vim-commentary'
Plug 'mzlogin/vim-markdown-toc'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-markdown'
Plug 'fatih/vim-go'
Plug 'Yggdroot/indentLine'
call plug#end()


" colorscheme
let g:gruvbox_contrast_dark = "soft"
set t_Co=256
set background=dark
colorscheme gruvbox

let g:lightline = {'colorscheme': 'wombat',}


