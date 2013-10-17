" Autoload modules
call pathogen#incubate()
call pathogen#helptags()

" Enable parenthesis matching plugin
runtime plugin/matchparen.vim

" Enable filtype plugins
filetype plugin on

" Set nocompatible mode
set nocompatible

" Set color scheme
set t_Co=256
colorscheme womprat

" Search while you type
set incsearch

" Error format for make
set errorformat=%m\ in\ %f\ on\ line\ %l

" Copy indent from current line when starting a new line
set autoindent
" Expand tabs into spaces
set expandtab
" Handle expanded tab spaces
set smarttab
" Use a 4 space tab
set shiftwidth=4
" Number of spaces a <Tab> is displayed as
set tabstop=4

" Tabs & Spaces
au BufNewFile,BufReadPre *.html setlocal shiftwidth=2 tabstop=2
au BufNewFile,BufReadPre *.phtml setlocal filetype=html shiftwidth=2 tabstop=2
au BufNewFile,BufReadPre *.js setlocal filetype=javascript shiftwidth=2 tabstop=2
au BufNewFile,BufReadPre *.tpl.php setlocal filetype=html shiftwidth=2 tabstop=2
au BufNewFile,BufReadPre *.less setlocal filetype=less shiftwidth=2 tabstop=2
au BufNewFile,BufReadPre *.scss setlocal filetype=scss shiftwidth=2 tabstop=2
au BufNewFile,BufReadPre *.css setlocal filetype=scss shiftwidth=2 tabstop=2

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
highlight Linelength ctermbg=236 guibg=236
au BufWinEnter * 2match Linelength /\%81v.\+/
highlight Spacing ctermbg=darkred ctermfg=white
au BufWinEnter * match Spacing /\s\+$/

" Highlight matching parenthis
highlight MatchParen ctermbg=grey ctermfg=black

" List mode
set list
set listchars=tab:>-,precedes:<,extends:>

" Parenthesis matching
let loaded_matchparen = 0

" File name completeion
set wildmode=longest,list

" Open file at line number file was left
au BufWinLeave ?* mkview
au BufWinEnter ?* silent loadview

" PHP Documentor
inoremap <C-D> <ESC>:call PhpDocSingle()<CR>
nnoremap <C-D> :call PhpDocSingle()<CR>
vnoremap <C-D> :call PhpDocRange()<CR>
let g:pdv_cfg_Package = ""
let g:pdv_cfg_Version = ""
let g:pdv_cfg_Author = "Michael Thessel"
let g:pdv_cfg_Copyright = "2013"
let g:pdv_cfg_License = ""

" Disable folding
set nofoldenable

" Allow to switch buffers without saving
set hidden
set confirm

" Regular Key Mappings
set pastetoggle=<leader>i
nmap <leader>w :set wrap <CR>
nmap <leader>W :set nowrap <CR>
vmap <leader>w :s/\s\+$//g <CR> " Whitepsace cleanup
nmap <leader><tab> :bn<CR>
nmap <leader><s-tab> :bp<CR>
nmap <leader>bd :bdelete<CR>

" I keep pressing shift while saving
cmap W :w<CR>
cmap Wq :wq<CR>
cmap WQ :wq<CR>

" Disable help key
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Prevent snippets from overwriting identation settings
let g:nsippet_no_indentation_settings = 1

" CtrlP Plugin
set runtimepath^=~/.vim/bundle/ctrlp
let g:ctrlp_map = '\p'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'raw'
let g:ctrlp_clear_cache_on_exit = 0

" Syntastic Plugin
nmap <leader>s :w <CR> :SyntasticCheck <CR>
let g:syntastic_php_checkers=['php']
let g:syntastic_css_checkers=[]

" Airline plugin
let g:airline_detect_whitespace = 0
let g:airline#extensions#tabline#enabled = 1

" Fugitive plugin
nmap <leader>gd :Gdiff <CR>
nmap <leader>gs :Gstatus <CR>
nmap <leader>gb :Gblame <CR>
map <leader>g> :diffget <CR>

" NERDTree plugin
nmap <leader>t :NERDTreeToggle <CR>

" Tagbar plugin
nmap <leader>l :TagbarToggle<CR>

" Doxygen Toolkit plugin
let g:DoxygenToolkit_briefTag_pre = ""

" PKP specific settings
augroup PKP
au BufRead,BufEnter /src/omp* setl nolist noet
au BufRead,BufEnter /src/ojs* setl nolist noet
au BufRead,BufEnter /src/omp* set tags=~/.vim/mytags/omp
au BufRead,BufEnter /src/ojs* set tags=~/.vim/mytags/ojs
au BufRead,BufEnter /src/ojs_stable* set tags=~/.vim/mytags/ojs_stable
au BufRead,BufEnter /src/omp* nmap <C-d> :Dox <CR>
au BufRead,BufEnter /src/ojs* nmap <C-d> :Dox <CR>
au BufRead,BufEnter /src/xmlps* set tags=~/.vim/mytags/xmlps
