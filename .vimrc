" vim-plug
call plug#begin('~/.vim/plugged')
" NERDTree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Airline
Plug 'vim-airline/vim-airline'

" Airline themes
Plug 'vim-airline/vim-airline-themes'

" Solarized Themes
Plug 'altercation/vim-colors-solarized'

" Verilog/SystemVerilog syntax
Plug 'vhda/verilog_systemverilog.vim'

" Syntastic
Plug 'scrooloose/syntastic'

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Goyo
Plug 'junegunn/goyo.vim'

" Initialize plugin system
call plug#end()

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" Disable vi compatibility (emulation of old bugs)
set nocompatible

" Use indentation of previous line
set autoindent

" Use intelligent indentation for C
set smartindent

" Configure tabwidth and insert spaces instead of tabs
set tabstop=2        " tab width is 4 spaces
set shiftwidth=2     " indent also with 4 spaces
set expandtab        " expand tabs to spaces
set textwidth=80

" Highlight matching braces
set showmatch

" Intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" Line numbers
set number

" In normal mode F2 will save the file
nmap <F2> :w<CR> 
" In insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i
" Cycling through buffers
:nnoremap <F4> :bnext<CR>
:nnoremap <F3> :bprevious<CR>

filetype on
filetype plugin indent on

" Setting airline theme
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

" Configuring solarized theme
set t_Co=256
syntax enable
set background=dark
colorscheme solarized

" NERDTree config
map <F9> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" air-line config
let g:airline#extensions#tabline#enabled = 1

" Syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Enabling verilator checker
let g:syntastic_verilog_checkers = ['verilator']

" YCM config - installed from AUR vim-youcompleteme-git
let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_server_python_interpreter = '/usr/bin/python2'


