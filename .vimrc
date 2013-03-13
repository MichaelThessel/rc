set t_Co=256
colorscheme herald

" Make
map <C-T> :w<CR>:make <CR>

" Error format for make
set errorformat=%m\ in\ %f\ on\ line\ %l

" Identation
set autoindent
set smartindent

" Tabs & Spaces
au BufNewFile,BufReadPre *.html setlocal shiftwidth=2 tabstop=1
au BufNewFile,BufReadPre *.phtml setlocal filetype=html shiftwidth=2 tabstop=1 
au BufNewFile,BufReadPre *.js setlocal filetype=javascript shiftwidth=2 tabstop=1 
au BufNewFile,BufReadPre *.tpl.php setlocal filetype=html shiftwidth=2 tabstop=1
au BufNewFile,BufReadPre *.less setlocal filetype=less shiftwidth=2 tabstop=1

" Statisline 
set statusline= 
set statusline+=%f\                          " path
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=col\:\ %c\                   " Current col 
set statusline+=row\:\ %l/%L                 " Current line

" Line numbers
set number

" Don't redraw while executing macros
set lazyredraw

" Undo levels
set undolevels=1000

" No swap files
set noswapfile

" Don't wrap lines
set nowrap
