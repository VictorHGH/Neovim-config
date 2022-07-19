" Basic options
source ~/.config/nvim/src/options.vim

" StatusLine
source ~/.config/nvim/src/statusline.vim

" Plugins
source ~/.config/nvim/src/plugins.vim

let $NVIM_TUI_ENABLE_TRUE_COLOR = 1

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
