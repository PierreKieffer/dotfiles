" -----------------------------------------
" |           VIM CONFIGURATION           |
" -----------------------------------------

" -----------------------------------------
" - std configuration -
" -----------------------------------------
syntax on
set laststatus=2
set incsearch
set scrolloff=8
set splitbelow splitright
set showtabline=2
set indentkeys-=0#
filetype plugin on
set expandtab shiftwidth=4 tabstop=4 softtabstop=4
set colorcolumn=80
set tabpagemax=100
set wildmenu
set wildmode=longest:full,full
set wildoptions=pum


" -----------------------------------------
" - key mapping -
" -----------------------------------------
" leader
let mapleader = " "

" save & quit 
nnoremap :s :update<cr>
nnoremap :q :q<cr>
nnoremap <leader>qq :q!<cr>
nnoremap <leader>qa :qa!<cr>

" utils 
nnoremap <leader>b :bn<cr>
" nnoremap <leader>l :ls<cr>
nnoremap <leader>c :wincmd c<cr>
nnoremap <leader>n :set number!<cr>
nnoremap <leader>N :call Notes()<cr>
nnoremap <leader>h :sp<cr>
nnoremap <leader>v :vsp<cr>
nnoremap <leader>w :wincmd w<cr>
nnoremap <leader>t :tabnew<cr>
nnoremap <leader>s :set hlsearch<cr> *bN
nnoremap <leader>S :set hlsearch!<cr>  
nnoremap <leader>f :<C-f>k
nnoremap tg gT
nnoremap <C-l> gt
nnoremap <C-h> gT
nnoremap ù %
vnoremap ù %
nnoremap <leader>r qr
nnoremap <leader>R q
nnoremap <leader>à @r
vnoremap <leader>à :normal @r<cr>
nnoremap "" yi"
nnoremap (( yi(
nnoremap ye vg_y$
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
nnoremap <C-j> 20j
nnoremap <C-k> 20k
vnoremap e g_
vnoremap f ^
nnoremap L e
nnoremap H b

nnoremap :t :NERDTreeToggle<cr>

nnoremap <F7> :%!python -mjson.tool<cr>

" insert new line out of insert mode 
" nnoremap m o<ESC>k
"

" map esc key 
imap kj <ESC>l

" go to the first non-blank character in a line
nnoremap F ^
" go to the last non-blank character in a line
nnoremap E $

" auto closing brackets 
inoremap " ""<left>
inoremap ' ''<left>
inoremap ` ``<left>
inoremap ( ()<left>
inoremap (<CR> (<CR>)<ESC>O
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
inoremap /*<CR> /*<CR>*/<ESC>O

" disable recording
map q <Nop>

vnoremap p "_dP

" -----------------------------------------
" - pluggins -
" -----------------------------------------
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary'
Plug 'mzlogin/vim-markdown-toc'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'fatih/vim-go'
" Plug 'chriskempson/base16-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'NLKNguyen/papercolor-theme'
" Plug 'rust-lang/rust.vim'
" Plug '~/.vim/plugged/flag.vim'
" Plug 'morhetz/gruvbox'
call plug#end()

" -----------------------------------------
" - special settings -
" -----------------------------------------
" set line numbers 
set number

" vim-go
let g:go_template_use_pkg = 1
let g:go_highlight_functions = 1
" let g:go_highlight_function_calls = 1

" ctrlp 
let g:ctrlp_working_path_mode = 0
let g:ctrlp_use_caching = 0
nnoremap <silent> <C-b> :CtrlPBuffer<CR>
let g:ctrlp_prompt_mappings = {
    \ 'PrtHistory(-1)':       ['<c-t>'],
    \ 'AcceptSelection("t")': ['<c-n>'],
    \ }

" multiple cursor
let g:multi_cursor_exit_from_insert_mode = 1
let g:multi_cursor_exit_from_visual_mode = 1
let g:multi_cursor_select_all_word_key = '<C-a>'
let g:multi_cursor_quit_key='<C-k>'

" vim-fugitive
nnoremap <leader>gs :G<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gl :Git log<CR>
nnoremap <leader>gk :diffget //3<CR>
nnoremap <leader>gj :diffget //2<CR>

" Goyo
let g:goyo_width = 120

" -----------------------------------------
" - file init -
" -----------------------------------------
" bash
autocmd BufNewFile *.sh 0r ~/.vim/templates/template.sh | :2
function BashTemp()
   :read ~/.vim/templates/template.sh
endfunction

" python
autocmd BufNewFile *.py 0r ~/.vim/templates/template.py | :2
function PyTemp()
   :read ~/.vim/templates/template.py
endfunction

" json
autocmd BufRead,BufNewFile *.json set cursorline!

function Json()
	:silent! %s/None/null/g
	:silent! %s/True/true/g
	:silent! %s/False/false/g
	:silent! %s/'/"/g
	:silent! %!python -mjson.tool
endfunction

" Search
function Search(param_1, param_2)
    exec 'vimgrep /'.a:param_1.'/j **/*.'.a:param_2 
    copen
    wincmd J
    resize 30
endfunction
command! -nargs=* Search call Search(<f-args>)


" flask template
function FlaskTemp()
   :1,$d
   :read ~/.vim/templates/flask_template.py
endfunction

" fastapi template
function FastAPITemp()
   :1,$d
   :read ~/.vim/templates/fastapi_template.py
endfunction

" fastapi template
function SocketTemp()
   :1,$d
   :read ~/.vim/templates/socket_template.py
endfunction

" clean 
function Clear()
   :1,$d
endfunction

" open all target files 
function OpenAllFilesFromDir(dir)
    exec 'argadd '.a:dir.'/* | tab all'
endfunction
command! -complete=file_in_path -nargs=+ T call OpenAllFilesFromDir(<f-args>)


" -----------------------------------------
" - utils -
" -----------------------------------------
" Mapping to highlight selected lines in yellow
vnoremap <Leader>h :call HighlightSelectedLines()<CR>

" Mapping to clear all highlights
nnoremap <Leader>H :call clearmatches()<CR>

" Function to highlight selected lines
function! HighlightSelectedLines()
    " Save the current cursor position
    let l:cursor_pos = getpos(".")
    
    " Get the visual selection range
    let l:start_line = line("'<")
    let l:end_line = line("'>")
    
    " Highlight the selected lines with yellow background
    for l:line_number in range(l:start_line, l:end_line)
        " call matchadd('VisualCustom', '\%'.l:line_number.'l')
        call matchadd('Visual', '\%'.l:line_number.'l')
    endfor
    
    " Restore the cursor position
    call setpos('.', l:cursor_pos)
endfunction
"  vimgrep 
"
 function! Grep(pattern, location)
    exec ":vimgrep /" . a:pattern . "/gj " . a:location 
endfunction

command! -nargs=+ Grep :call Grep(<f-args>)

augroup myvimrc
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l*    lwindow
augroup END

" find and replace all  
function FindAndReplaceAll(source, target)
    exe silent! '%s/' . a:source . '/' . a:target . '/g'
endfunction

" notes
function VimReminder()
" :silent! mkdir -p /tmp/notes && touch /tmp/notes/notes.md
" :tabnew /tmp/notes/notes.md
  :tabnew ~/.vim/templates/reminder.md
endfunction


" -----------------------------------------
" - theme -
" -----------------------------------------
" custom nord

 " set termguicolors
 " set t_Co=256
 " set cursorline
 " colorscheme nord
 " let g:lightline = {'colorscheme': 'nord',}
 " set background=dark

" gruvbox
" set background=light
" let g:gruvbox_contrast_light = 'hard'
" colorscheme gruvbox
" let g:lightline = {'colorscheme': 'gruvbox',}

" " custom PaperColor light
" set termguicolors
set t_Co=256
set cursorline
set background=light
colorscheme PaperColor
let g:lightline = {'colorscheme': 'PaperColor',}


" set background=light
" colorscheme intellij
" let g:lightline = {'colorscheme': 'intellij',}


" colorscheme base16-tomorrow
" let g:lightline = {'colorscheme': 'Tomorrow',}
" set background=dark

" show hi groups : 
" so $VIMRUNTIME/syntax/hitest.vim
"
"
"
"grep :vim /pattern/ **/*.go :resize 40 
