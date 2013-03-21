set t_Co=256
colorscheme herald

" Make
map <C-T> :w<CR>:make <CR>

" Error format for make
set errorformat=%m\ in\ %f\ on\ line\ %l

" Copy indent from current line when starting a new line
set autoindent
" Automatically indent new lines after certain characters
set smartindent
" Expand tabs into spaces
set expandtab
" Handle expanded tab spaces
set smarttab
" Use a 4 space tab
set shiftwidth=4
" Number of spaces a <Tab> is displayed as
set tabstop=8

" Tabs & Spaces
au BufNewFile,BufReadPre *.html setlocal shiftwidth=2 tabstop=1
au BufNewFile,BufReadPre *.phtml setlocal filetype=html shiftwidth=2 tabstop=1
au BufNewFile,BufReadPre *.js setlocal filetype=javascript shiftwidth=2 tabstop=1
au BufNewFile,BufReadPre *.tpl.php setlocal filetype=html shiftwidth=2 tabstop=1
au BufNewFile,BufReadPre *.less setlocal filetype=less shiftwidth=2 tabstop=1

" Always show the status line
set laststatus=2

" Statusline
set statusline=%f\                           " path
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

" Hightlight formatting issues (whitespace, lines 80+ chars)
highlight Formatting ctermbg=darkred ctermfg=white guibg=darkred
au BufWinEnter * match Formatting /\%81v.\+\|\s\+$/

" List mode
set list
set listchars=tab:>-,precedes:<,extends:>
