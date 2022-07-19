call plug#begin('~/.vim/plugged')

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
