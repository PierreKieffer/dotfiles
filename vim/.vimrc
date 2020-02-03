set laststatus=2
nmap <F6> :NERDTreeToggle<CR>
nmap <F5> :set number !<ENTER> 

call plug#begin('~/.vim/plugged')
Plug 'chrisbra/vim-commentary'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-markdown'
call plug#end()

