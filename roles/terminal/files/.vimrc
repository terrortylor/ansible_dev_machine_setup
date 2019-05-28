" Always show the tab line
set showtabline=2
" Show line numbers
set number

" Format the status line
set laststatus=2
set statusline=%f       "Path of the file
set statusline+=%=      "left/right separator
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%3c,     "cursor column
set statusline+=%4l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

" Configure netrw plugin to show file ls details
" See: https://shapeshed.com/vim-netrw/
let g:netrw_liststyle = 1

" Enable mouse support
:set mouse=a

" enable syntax highlighting
syntax enable

" set the theme
set background=dark
" solarized options
let g:solarized_termcolors = 256
colorscheme solarized

" enable spell checking
set spell spelllang=en_gb

" Create some shortcuts
" NOTE: leader is default '\'
" Toggle spell checking
nnoremap <leader>s :set spell!<CR>

nnoremap <leader>E :Texplore<CR>
