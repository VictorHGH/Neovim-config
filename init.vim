" Some basics:
"Muestra el titulo del archivo
set title 

" Basic syntax highlight
syntax on

" textwidth
"set textwidth=80

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
" Completition
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
" Comenter
Plug 'scrooloose/nerdcommenter'
" Prettier
"Plug 'prettier/vim-prettier', {'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html', 'python']}
" Formating
Plug 'sbdchd/neoformat'
" Match quots, curlybraces etc
Plug 'https://github.com/adelarsq/vim-matchit'
"syntax highlight
Plug 'HerringtonDarkholme/yats.vim'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
" Statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Latex
Plug 'lervag/vimtex'
" Preview outputs
Plug 'metakirby5/codi.vim'
" Vimwiki
"Plug 'vimwiki/vimwiki'
" Tagbar
"Plug 'majutsushi/tagbar'
" Indent lines
Plug 'yggdroot/indentline'

Plug 'csscomb/vim-csscomb'
    
call plug#end()

let g:vimwiki_folding = 'list'
let g:vimwiki_table_mappings = 0
autocmd BufWrite, TextChanged, InsertLeave *.js Neoformat
let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
let mapleader=" "
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>

" Pylint
set makeprg=pylint\ --reports=n\ --output-format-parseable\ %:p
set errorformat=%f:%l:\ %m

" Nerdtree
let NERDTreeQuitOnOpen = 1
nmap <leader>nt :NERDTreeFind<CR>
let g:nerdtree_open = 1
let NerdtreeIgnore = ['\.pyc$', '\.pyo$', '__pycache__[[dir]]']
let NerdtreeMinimalUI = 1
let NerdtreeShowLineNumbers = 1
let NerdtreeWinSize = 40

vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle
noremap j gj
noremap k gk
noremap j gj
noremap gj j
noremap k gk
noremap gk k
nmap <leader>r :NERDTree<CR>
nmap <leader>vw :vs ~/vimwiki/index.wiki<CR>
map <leader>t :TagbarToggle<CR>
nmap <leader>n :noh<CR>

" indent/unindent with tab/shift-tab
nmap <Tab> >>
nmap <S-Tab> <<
imap <S-Tab> <Esc><<i
vmap <Tab> >gv
vmap <S-Tab> <gv

nmap <leader>h gT
nmap <leader>l gt

autocmd Filetype tex inoremap ;bf \textbf{}<esc>i
autocmd Filetype tex inoremap ;em \emph{}<esc>i
autocmd Filetype tex inoremap ;img \begin{figure}[h!]<CR>\center<CR>\includegraphics[width=0.4\textwidth]{img}<CR>\caption{}<CR>\end{figure}<ESC>/img<CR>cw
map <leader><leader>o :set spell<CR>
map <leader><leader>O :set nospell<CR>
nmap <leader><leader>c :Codi<CR>
nmap <leader><leader>vm :VimtexTocOpen<CR>

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

" Moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-j> <esc>:m .-2<CR>==
nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==

" add csscomb
" Automatically comb your CSS on save
autocmd BufWritePre,FileWritePre *.css,*.less,*.scss,*.sass silent! :CSScomb
