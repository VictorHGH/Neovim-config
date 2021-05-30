set title "Muestra el titulo del archivo
set nu rnu "Numera las filas con el número relativo
set colorcolumn=120 "Muestra la columna límite a 80 caracteres
set expandtab "	Insertar espacios en lugar de <TAB>'s
set hidden "Permitir cambiar de buffers sin tener que guardar los cambios
set spelllang=en,es "Corregir palabras usando diccionarios en inglés y español
colorscheme delek
syntax enable
set showcmd
set ruler
set encoding=utf-8
set showmatch
set sw=2
set path+=** "serch down into subfolders / Provides tab completition for all file-related tasks
set wildmenu " Display all matching files when we tab complete
set scrolloff=10

call plug#begin('~/.vim/plugged')

"Themes
Plug 'morhetz/gruvbox'

" IDE
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rizzatti/dash.vim'
"Plug 'tsony-tsonev/nerdtree-git-plugin'"
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'

call plug#end()

let mapleader=" "
let NERDTreeQuitOnOpen=1
nmap <leader>nt :NERDTreeFind<CR>
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>

" kite
let g:kite_supported_lenguagers = ["javascipt", "python"]

" COC
autocmd FileType python let b:coc_suggest_disable = 1
autocmd FileType javascript let b:coc_suggest_disable = 1
autocmd FileType scss setl iskeyword+=@-@
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

" Use <c-space> ti tigger completion.
if &filetype == "javascipt" || &filetype "python"
  inormap <c-space> <C-x><C-u>
else
  inoremap <silent><expr> <c-spase> coc#refresh()
endif
