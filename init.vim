" Some basics:
"Muestra el titulo del archivo
set title 

" Basic syntax highlight
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

" Set clipboard
set clipboard=unnamed

"Detect diferent filetypes
filetype on
filetype indent on
filetype plugin indent on
filetype plugin on

" Python mode
let g:pymode_python = 'python3'

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

call plug#begin('~/.vim/plugged')
" Own Plugings
Plug '~/Documents/programacion_2.0/nvim/quote.nvim'

"themes
Plug 'morhetz/gruvbox'

" IDE
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'

" Completition
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'github/copilot.vim'

" Nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
"
" Comenter
Plug 'scrooloose/nerdcommenter'
"
" Formating
Plug 'sbdchd/neoformat'
Plug 'tpope/vim-surround'
Plug 'AndrewRadev/tagalong.vim'
Plug 'Yggdroot/indentLine'
Plug 'kkharji/sqlite.lua'

" Match quots, curlybraces etc
Plug 'https://github.com/adelarsq/vim-matchit'

" Statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Latex
Plug 'lervag/vimtex'

" React, JSX, javascript
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'

" Python
Plug 'sheerun/vim-polyglot'

" highlight
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
Plug 'p00f/nvim-ts-rainbow'
Plug 'ap/vim-css-color'

" Format
Plug 'sbdchd/neoformat'

" Dash
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'mrjones2014/dash.nvim', { 'do': 'make install' }

" Css
Plug 'stephenway/postcss.vim'

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
let NERDTreeQuitOnOpen = 0
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
nmap <leader>n :noh<CR>

" indent/unindent with tab/shift-tab
nmap <Tab> >>
nmap <S-Tab> <<
imap <S-Tab> <Esc><<i
vmap <Tab> >gv
vmap <S-Tab> <gv

" Move through windows
nmap <leader>h gT
nmap <leader>l gt

autocmd Filetype tex inoremap ;bf \textbf{}<esc>i
autocmd Filetype tex inoremap ;em \emph{}<esc>i
autocmd Filetype tex inoremap ;img \begin{figure}[h!]<CR>\center<CR>\includegraphics[width=0.4\textwidth]{img}<CR>\caption{}<CR>\end{figure}<ESC>/img<CR>cw
autocmd Filetype tex inoremap n;' <C-k>~n
autocmd Filetype tex inoremap ;? <C-k>~?
nmap <leader><leader>o :set spell<CR>
nmap <leader><leader>O :set nospell<CR>
nmap <leader><leader>vm :VimtexTocOpen<CR>

" COC
source ~/.config/nvim/coc.nvim

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader><leader>h :TSEnable highlight<CR>

" Moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-j> <esc>:m .-2<CR>==
nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==

" Dash
nmap <leader><leader>d :Dash<CR>
nmap <leader><leader>DW :DashWord<CR>

" vimtex
let g:latex_view_general_viewer = 'skim'
let g:vimtex_view_method = 'skim'
let g:vimtex_quickfix_mode=0

let g:vimtex_compiler_latexmk = { 
        \ 'executable' : 'latexmk',
        \ 'options' : [ 
        \   '-xelatex',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}

let g:vimtex_grammar_vlty = {'lt_command': 'languagetool'}
set spelllang=es

" Airline
source ~/.config/nvim/themes/airline.vim

lua << EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
}
EOF
