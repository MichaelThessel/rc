
" ##########################################
" ############# Vundle Settings ############
" ##########################################
filetype off
set rtp+=~/.vim/bundle/Vundle
call vundle#begin()
Plugin 'gmarik/Vundle'

Plugin 'https://github.com/vim-scripts/php.vim--Garvin.git'
Plugin 'https://github.com/sumpygump/php-documentor-vim.git'
Plugin 'https://github.com/scrooloose/syntastic.git'
Plugin 'https://github.com/bling/vim-airline.git'
Plugin 'https://github.com/vim-airline/vim-airline-themes.git'
Plugin 'https://github.com/tpope/vim-fugitive.git'
Plugin 'https://github.com/cakebaker/scss-syntax.vim.git'
Plugin 'https://github.com/scrooloose/nerdcommenter.git'
Plugin 'https://github.com/mattn/emmet-vim.git'
Plugin 'https://github.com/altercation/vim-colors-solarized.git'
Plugin 'https://github.com/joonty/vdebug.git'
Plugin 'https://github.com/airblade/vim-gitgutter.git'
Plugin 'https://github.com/groenewege/vim-less.git'
Plugin 'https://github.com/sudar/vim-arduino-syntax.git'
Plugin 'https://github.com/kien/ctrlp.vim.git'
Plugin 'https://github.com/unblevable/quick-scope.git'
Plugin 'https://github.com/Shougo/vimproc.vim.git'
Plugin 'https://github.com/m2mdas/phpcomplete-extended.git'
Plugin 'https://github.com/Valloric/YouCompleteMe.git'
Plugin 'https://github.com/elixir-lang/vim-elixir.git'
Plugin 'https://github.com/SirVer/ultisnips.git'
Plugin 'https://github.com/leafgarland/typescript-vim.git'

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
set background=dark
colorscheme solarized

" Enable syntax highlighting
syntax on

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
au BufNewFile,BufReadPre *.css setlocal filetype=css shiftwidth=2 tabstop=2
au BufNewFile,BufReadPre *.xml setlocal filetype=xml shiftwidth=2 tabstop=2
au BufNewFile,BufReadPre *.twig setlocal filetype=html shiftwidth=2 tabstop=2

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
set relativenumber

" Don't redraw while executing macros
set lazyredraw

" Undo levels
set undolevels=1000

" No swap files
set noswapfile

" Don't wrap lines
set nowrap

" Hightlight formatting issues (whitespace, lines 80+ chars)
highlight Linelength ctermbg=235 guibg=235
au BufWinEnter * 2match Linelength /\%81v.\+/
highlight Spacing ctermbg=darkred ctermfg=white
au BufWinEnter * match Spacing /\s\+$/

" Highlight matching parenthis
highlight MatchParen ctermbg=166 ctermfg=166

" Highlight tab characters
set list
set listchars=tab:>-,precedes:<,extends:>

" Parenthesis matching
let loaded_matchparen = 0

" File name completion
set wildmode=longest,list

" Open file at line number file was left
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Disable folding
set nofoldenable

" Allow to switch buffers without saving
set hidden
set confirm

" Keep 3 lines visible above the cursor at any given time
set scrolloff=3

" Use xmllint to auto indent xml files http://goo.gl/N8wrXh
au BufRead,BufEnter *.xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

" Dont replace the paste buffer on paste
function! RestoreRegister()
    let @" = s:restore_reg
    return ''
endfunction
function! s:Repl()
    let s:restore_reg = @"
    return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

" Open Quickfix window after grep and close it after file is selcted
autocmd QuickFixCmdPost *grep* cwindow
autocmd FileType qf nmap <buffer> <CR> <CR> :ccl <CR>

" ###########################################
" ############# Key Mappings ################
" ###########################################

"  General mappings
set pastetoggle=<leader>i
nmap <leader>w :set wrap <CR>
nmap <leader>W :set nowrap <CR>
nmap <leader>c :set wrap <CR> :set norelativenumber <CR> :set nonumber <CR> :set nolist <CR> :GitGutterDisable <CR> " Copy mode
vmap <leader>w :s/\s\+$//g <CR> :%s/[^ ]\zs  \+/ /g <CR> " Whitepsace cleanup
nmap <leader><tab> :bn<CR>
nmap <leader><s-tab> :bp<CR>
nmap <leader>bd :bdelete<CR>
nmap <leader>v `[v`] " Select pasted text
imap jj <ESC>

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

" Syntastic
nmap <leader>s :w <CR> :SyntasticCheck <CR>
let g:syntastic_php_checkers=['php']
let g:syntastic_css_checkers=[]
let g:syntastic_javascript_checkers = ['jshint']

" Airline
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1

" Fugitive
nmap <leader>gd :Gdiff<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gb :Gblame<CR>
nmap <leader>gc :Gread<CR>
nmap <leader>gg :Ggrep! <C-R><C-W><CR><CR>
nmap <leader>g> :diffget<CR>

" GITGutter
highlight clear SignColumn

" Emmet plugin
imap <leader>e <C-y>,
let g:user_emmet_leader_key='<leader>e'

" Fugitive
map <leader>t :NERDTreeToggle <CR>

" CtrlP
map <leader>p :CtrlP<CR>

"Quick Scope

function! Quick_scope_selective(movement)
    let needs_disabling = 0
    if !g:qs_enable
        QuickScopeToggle
        redraw
        let needs_disabling = 1
    endif

    let letter = nr2char(getchar())

    if needs_disabling
        QuickScopeToggle
    endif

    return a:movement . letter
endfunction

let g:qs_enable = 0

nnoremap <expr> <silent> f Quick_scope_selective('f')
nnoremap <expr> <silent> F Quick_scope_selective('F')
nnoremap <expr> <silent> t Quick_scope_selective('t')
nnoremap <expr> <silent> T Quick_scope_selective('T')
vnoremap <expr> <silent> f Quick_scope_selective('f')
vnoremap <expr> <silent> F Quick_scope_selective('F')
vnoremap <expr> <silent> t Quick_scope_selective('t')
vnoremap <expr> <silent> T Quick_scope_selective('T')

" Phpcomplete
autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP

" UltiSnips
let g:UltiSnipsExpandTrigger="<leader><space>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"
