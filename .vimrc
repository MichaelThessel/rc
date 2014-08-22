" Set nocompatible mode
set nocompatible

" ##########################################
" ############# Vundle Settings ############
" ##########################################
filetype off
set rtp+=~/.vim/bundle/Vundle
call vundle#begin()
Plugin 'gmarik/Vundle'

Plugin 'https://github.com/vim-scripts/php.vim--Garvin.git'
Plugin 'https://github.com/sumpygump/php-documentor-vim.git'
Plugin 'https://github.com/MarcWeber/vim-addon-mw-utils.git'
Plugin 'https://github.com/tomtom/tlib_vim.git'
Plugin 'https://github.com/honza/vim-snippets.git'
Plugin 'https://github.com/garbas/vim-snipmate.git'
Plugin 'https://github.com/kien/ctrlp.vim.git'
Plugin 'https://github.com/scrooloose/syntastic.git'
Plugin 'https://github.com/bling/vim-airline.git'
Plugin 'https://github.com/tpope/vim-fugitive.git'
Plugin 'https://github.com/cakebaker/scss-syntax.vim.git'
Plugin 'https://github.com/scrooloose/nerdcommenter.git'
Plugin 'https://github.com/vim-scripts/DoxygenToolkit.vim'
Plugin 'https://github.com/mattn/emmet-vim.git'
Plugin 'https://github.com/altercation/vim-colors-solarized.git'
Plugin 'https://github.com/joonty/vdebug.git'
Plugin 'https://github.com/airblade/vim-gitgutter.git'
Plugin 'https://github.com/Valloric/YouCompleteMe.git'

call vundle#end()
filetype plugin indent on

" ###########################################
" ############# General Settings ############
" ###########################################

" Enable parenthesis matching plugin
runtime plugin/matchparen.vim

" Enable filtype plugins
filetype plugin on

" Set color scheme
set background=light
colorscheme solarized

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

" Tabs & Spaces for specific file formats
au BufNewFile,BufReadPre *.html setlocal shiftwidth=2 tabstop=2
au BufNewFile,BufReadPre *.phtml setlocal filetype=html shiftwidth=2 tabstop=2
au BufNewFile,BufReadPre *.tpl.php setlocal filetype=html shiftwidth=2 tabstop=2
au BufNewFile,BufReadPre *.js setlocal filetype=javascript shiftwidth=4 tabstop=4
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
highlight Linelength ctermbg=7 guibg=7
au BufWinEnter * 2match Linelength /\%81v.\+/
highlight Spacing ctermbg=darkred ctermfg=white
au BufWinEnter * match Spacing /\s\+$/

" Highlight matching parenthis
highlight MatchParen ctermbg=grey ctermfg=black

" Highlight tab characters
set list
set listchars=tab:>-,precedes:<,extends:>

" Parenthesis matching
let loaded_matchparen = 0

" File name completeion
set wildmode=longest,list

" Open file at line number file was left
au BufWinLeave ?* mkview
au BufWinEnter ?* silent loadview

" Disable folding
set nofoldenable

" Allow to switch buffers without saving
set hidden
set confirm

" Keep 3 lines visible above the cursor at any given time
set scrolloff=3


" Use xmllint to auto indent xml files http://goo.gl/N8wrXh
au BufRead,BufEnter *.xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

" Dont replace the paste puffer on paste
function! RestoreRegister()
    let @" = s:restore_reg
    return ''
endfunction
function! s:Repl()
    let s:restore_reg = @"
    return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

" ###########################################
" ############# Key Mappings ################
" ###########################################

"  General mappings
set pastetoggle=<leader>i
nmap <leader>w :set wrap <CR>
nmap <leader>W :set nowrap <CR>
vmap <leader>w :s/\s\+$//g <CR> " Whitepsace cleanup
nmap <leader><tab> :bn<CR>
nmap <leader><s-tab> :bp<CR>
nmap <leader>bd :bdelete<CR>
nmap <leader>v `[v`] " Select pasted text

" Disable help key
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" ##############################################
" ############# Plugin Settings ################
" ##############################################

" PHP Documentor
inoremap <C-D> <ESC>:call PhpDocSingle()<CR>
nnoremap <C-D> :call PhpDocSingle()<CR>
vnoremap <C-D> :call PhpDocRange()<CR>
let g:pdv_cfg_Package = ""
let g:pdv_cfg_Version = ""
let g:pdv_cfg_Author = "Michael Thessel"
let g:pdv_cfg_Copyright = "2013"
let g:pdv_cfg_License = ""

" Snipmate
let g:nsippet_no_indentation_settings = 1

" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp
let g:ctrlp_map = '\p'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'raw'
let g:ctrlp_clear_cache_on_exit = 0

" Syntastic
nmap <leader>s :w <CR> :SyntasticCheck <CR>
let g:syntastic_php_checkers=['php']
let g:syntastic_css_checkers=[]

" Airline
let g:airline_detect_whitespace = 0
let g:airline#extensions#tabline#enabled = 1

" Fugitive
nmap <leader>gd :Gdiff <CR>
nmap <leader>gs :Gstatus <CR>
nmap <leader>gb :Gblame <CR>
map <leader>g> :diffget <CR>

" Doxygen Toolkit
let g:DoxygenToolkit_briefTag_pre = ""

" Emmet
imap <leader>e <C-y>,

" GITGutter
highlight clear SignColumn

" ###############################################
" ############# Project Settings ################
" ###############################################

" PKP
augroup PKP
au BufRead,BufEnter /src/omp* setl nolist noet
au BufRead,BufEnter /src/ojs* setl nolist noet
au BufRead,BufEnter /src/omp* set tags=~/.vim/mytags/omp
au BufRead,BufEnter /src/ojs* set tags=~/.vim/mytags/ojs
au BufRead,BufEnter /src/ojs_stable* set tags=~/.vim/mytags/ojs_stable
au BufRead,BufEnter /src/omp* nmap <C-d> :Dox <CR>
au BufRead,BufEnter /src/ojs* nmap <C-d> :Dox <CR>
au BufRead,BufEnter /src/xmlps* set tags=~/.vim/mytags/xmlps
augroup end

" Paperdivas
augroup PAPERDIVAS
au BufRead,BufEnter /src/paperdivas* set tags=~/.vim/mytags/paperdivas
au BufRead,BufEnter /src/lovestruck* set tags=~/.vim/mytags/lovestruck
augroup end

" AC
augroup AC
au BufRead,BufEnter /src/ac* set tags=~/.vim/mytags/ac
augroup end
