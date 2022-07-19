" Status Line

function! GritBranch()
    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
    let l:branchname = GritBranch()
    if l:branchname == ""
        return $USER
    else
        return strlen(l:branchname) > 0?' '.l:branchname.' ':''
    end
endfunction

function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction

hi user1 ctermfg=237 ctermbg=NONE guifg=#3a3a3a  guibg=NONE

set statusline=
set statusline+=\ %#IncSearch#
set statusline+=\ %{StatuslineGit()}
set statusline+=\ %#SpecialKey#

set statusline+=\ %#DiffChange#
set statusline+=\ %{GitStatus()}
set statusline+=\ %#SpecialKey#

set statusline+=\ %#QuickFixLine#
set statusline+=\ %{''.(&fenc!=''?&fenc:&enc).''}
set statusline+=\ %#SpecialKey#

set statusline+=%1*\ 
set statusline+=%#TabLineSel#
set statusline+=%=\%f%=
set statusline+=%#SpecialKey#
set statusline+=%1*\

set statusline+=\ %#CursorLine#
set statusline+=\ %Y
set statusline+=\ %#SpecialKey#

set statusline+=\ %#QuickFixLine#
set statusline+=\ row:%l/%L
set statusline+=\ %#SpecialKey#

set statusline+=\ %#DiffChange#
set statusline+=\ col:%c
set statusline+=\ %#SpecialKey#

set statusline+=\ %#IncSearch#
set statusline+=\ Up-Down:%p%%
set statusline+=\ %#SpecialKey#
set statusline+=\ 
