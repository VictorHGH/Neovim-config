" Some basics:
set title "Muestra el titulo del archivo

" Basic syntax highlight
syntax enable
syntax on

"Numera las filas con el número relativo
set nu rnu 

"Muestra la columna límite a 120 caracteres
set colorcolumn=120 

"Insertar espacios en lugar de <TAB>'s
set expandtab 

"Permitir cambiar de buffers sin tener que guardar los cambios
set hidden 

"Corregir palabras usando diccionarios en inglés y español
set spelllang=en,es 

"Color de tema
autocmd vimenter * ++nested colorscheme gruvbox

"Permitir el posicionamietno con el mouse
set mouse=a

"Detect diferent filetypes
filetype on
filetype indent on
filetype plugin indent on
filetype plugin on

"On upper or lower case search
set ic
set smartcase

"No compatible with vi
set nocompatible

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

call plug#begin('~/.vim/plugged')

"themes
Plug 'morhetz/gruvbox'

" IDE
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rizzatti/dash.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'frazrepo/vim-rainbow'
Plug 'prettier/vim-prettier', {'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html']}
Plug 'sbdchd/neoformat'
Plug 'https://github.com/adelarsq/vim-matchit'
"statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'lervag/vimtex'
Plug 'metakirby5/codi.vim'

call plug#end()

autocmd BufWrite, TextChanged, InsertLeave *.js Neoformat
let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
let mapleader=" "
let NERDTreeQuitOnOpen=1
nmap <leader>nt :NERDTreeFind<CR>
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle
nmap j gj
nmap k gk
nnoremap j gj
nnoremap gj j
nnoremap k gk
nnoremap gk k

autocmd Filetype tex inoremap ;bf \textbf{}
autocmd Filetype tex inoremap ;em \emph{}
map <leader><leader>o :set spell<CR>
map <leader><leader>O :set nospell<CR>

" COC
source ~/.config/nvim/coc.nvim
let g:coc_global_extentions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-json',
  \ 'coc-python',
  \ 'coc-emmet',
  \ 'coc-css',
  \ 'coc-html',
  \ 'coc-prettier',
  \]

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
