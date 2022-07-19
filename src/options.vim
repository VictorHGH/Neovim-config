"Muestra el titulo del archivo
set title 

" Map leader
let mapleader=" "
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>

" Basic syntax highlight
syntax on

"Numera las filas con el número relativo
set nu rnu 

"Muestra la columna límite a 120 caracteres
set colorcolumn=120 

"Insertar espacios en lugar de <TAB>'s
set expandtab 

" Fold
set foldmethod=indent
set nofoldenable

"Permitir cambiar de buffers sin tener que guardar los cambios
set hidden 

"Corregir palabras usando diccionarios en inglés y español
set spelllang=en,es 

"Color de tema
autocmd vimenter * ++nested colorscheme gruvbox

"Permitir el posicionamiento con el mouse
set mouse=a

" Set clipboard
set clipboard=unnamed

"Detect diferent filetypes
filetype on
filetype indent on
filetype plugin indent on
filetype plugin on

"On upper or lower case search
set ic
set smartcase

"No compatible with vi
"set nocompatible

"show commands in screen
set showcmd

"Auto change directory
set autochdir

"Encoding
set encoding=utf-8

"Backspace through anything
set backspace=indent,eol,start

"show corresponding open and close words, parentesis
set showmatch
set sw=4
set laststatus=2

"search down into sub-folders / Provides tab completion for all file-related tasks
set path+=** 

"Display all matching files when we tab complete
set wildmenu 

"Scroll padding of 15 lines
set scrolloff=15

"Splits open at bottom and right, which is non-retarded, like vim defaults
set splitbelow splitright 
set rtp+=/usr/local/opt/fzf
