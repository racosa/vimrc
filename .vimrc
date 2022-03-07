" vim-plug
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'

Plug 'dense-analysis/ale'

Plug 'tpope/vim-fugitive'

Plug 'airblade/vim-gitgutter'

Plug 'junegunn/fzf.vim'

" deoplete (asynchronous completion)
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

Plug 'jiangmiao/auto-pairs'

Plug 'tpope/vim-surround'

Plug 'lifepillar/vim-solarized8'

" Initialize plugin system
call plug#end()

" Set theme
set termguicolors
set background=dark
colorscheme solarized8 

" Setting airline theme
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

" Set UTF-8 encoding
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
" In insert mode F2 will exit insert, save, enter insert again
imap <F2> <ESC>:w<CR>i

" In normal mode F5 will indent the whole file automatically
nmap <F5> gg=G<CR> 
" In insert mode F5 will exit insert, indent the whole file automatically and enter insert again
imap <F5> <ESC>gg=G<CR>i

" Cycling through buffers
:nnoremap <F4> :bnext<CR>
:nnoremap <F3> :bprevious<CR>

" Toggle signs and line numbers
nmap <F10> :set nu! <bar> :GitGutterToggle <bar> :ALEToggle <CR>

" Check file types
filetype on
filetype plugin indent on

" Set spelllang on .tex files
autocmd FileType tex setlocal spell spelllang=en_us

" NERDTree config
map <F9> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" air-line config
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1

" ALE config
let g:ALEErrorSign = '#073642'

" deoplete config
let g:deoplete#enable_at_startup = 1

let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'html': ['prettier'],
\   'css': ['prettier'],
\}

function! RemoveTrailingWhiteSpaces()
    %s/\s\+$//e
endfunction
autocmd BufWritePre *.js :call RemoveTrailingWhiteSpaces()
