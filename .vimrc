
" ##########################################
" ############# Vundle Settings ############
" ##########################################
filetype off
set rtp+=~/.vim/bundle/Vundle
call vundle#begin()
Plugin 'gmarik/Vundle'

" General
Plugin 'https://github.com/scrooloose/syntastic.git' " Syntax checker
Plugin 'https://github.com/bling/vim-airline.git' " Status line
Plugin 'https://github.com/vim-airline/vim-airline-themes.git' " Status line themes
Plugin 'https://github.com/unblevable/quick-scope.git' " Left right movements
Plugin 'https://github.com/Valloric/YouCompleteMe.git' " Auto completion
Plugin 'https://github.com/xolox/vim-easytags.git' " Automatic ctags generation
Plugin 'https://github.com/xolox/vim-misc.git' " Easytags dependency
Plugin 'https://github.com/SirVer/ultisnips.git' " Snippets
Plugin 'https://github.com/mileszs/ack.vim.git' " ACK
Plugin 'https://github.com/tpope/vim-surround.git' " Surround

" GIT
Plugin 'https://github.com/tpope/vim-fugitive.git' " GIT Wrapper
Plugin 'https://github.com/airblade/vim-gitgutter.git' " Diff in gutter

" PHP
Plugin 'https://github.com/vim-scripts/php.vim--Garvin.git' " PHP Syntax
Plugin 'https://github.com/sumpygump/php-documentor-vim.git' " DocComments
Plugin 'https://github.com/joonty/vdebug.git' " Debugging
Plugin 'https://github.com/shawncplus/phpcomplete.vim.git' " Auto completion

" SCSS / LESS
Plugin 'https://github.com/cakebaker/scss-syntax.vim.git' " SCSS Syntax
Plugin 'https://github.com/groenewege/vim-less.git' " LESS Syntax

" CSS / HTML
Plugin 'https://github.com/mattn/emmet-vim.git' " CSS/HTML auto completion

" Markdown
Plugin 'https://github.com/godlygeek/tabular.git' " plasticboy/vim-markdown dependency
Plugin 'https://github.com/plasticboy/vim-markdown.git'

" Color schemes
Plugin 'https://github.com/morhetz/gruvbox.git'

" Javascript
Plugin 'https://github.com/pangloss/vim-javascript.git'

"GO
Plugin 'https://github.com/fatih/vim-go.git'

" Octave
Plugin 'https://github.com/jvirtanen/vim-octave.git'

"VimWiki
Plugin 'https://github.com/vimwiki/vimwiki.git'

call vundle#end()
filetype plugin indent on

" ###########################################
" ############# General Settings ############
" ###########################################

" Enable filtype plugins
filetype plugin on

" Set color scheme
set background=dark
colorscheme gruvbox

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
au BufNewFile,BufReadPre *.tpl setlocal filetype=html shiftwidth=2 tabstop=2
au BufNewFile,BufReadPre *.tpl.php setlocal filetype=html shiftwidth=2 tabstop=2
au BufNewFile,BufReadPre *.js setlocal filetype=javascript shiftwidth=4 tabstop=4
au BufNewFile,BufReadPre *.less setlocal filetype=less shiftwidth=2 tabstop=2
au BufNewFile,BufReadPre *.scss setlocal filetype=scss shiftwidth=2 tabstop=2
au BufNewFile,BufReadPre *.css setlocal filetype=css shiftwidth=2 tabstop=2
au BufNewFile,BufReadPre *.xml setlocal filetype=xml shiftwidth=2 tabstop=2
au BufNewFile,BufReadPre *.twig setlocal filetype=html shiftwidth=2 tabstop=2
au BufNewFile,BufReadPre *.go setlocal filetype=go tabstop=4 expandtab! nolist

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
highlight Spacing ctermbg=darkred ctermfg=white
au BufWinEnter * match Spacing /\s\+$/
set textwidth=80
set colorcolumn=+1

" Highlight tab characters
set list
set listchars=tab:>-,precedes:<,extends:>

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
let g:pdv_cfg_Copyright = "2016"
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

let g:qs_enable = 1

nnoremap <expr> <silent> f Quick_scope_selective('f')
nnoremap <expr> <silent> F Quick_scope_selective('F')
nnoremap <expr> <silent> t Quick_scope_selective('t')
nnoremap <expr> <silent> T Quick_scope_selective('T')
vnoremap <expr> <silent> f Quick_scope_selective('f')
vnoremap <expr> <silent> F Quick_scope_selective('F')
vnoremap <expr> <silent> t Quick_scope_selective('t')
vnoremap <expr> <silent> T Quick_scope_selective('T')

" Phpcomplete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" UltiSnips
let g:UltiSnipsExpandTrigger="<leader><space>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"

"YouCompleteMe
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_auto_trigger = 1
let g:ycm_collect_identifiers_from_tags_files = 1

"Easytags
let g:easytags_async = 1
let g:easytags_auto_highlight = 0
set tags=./tags;
let g:easytags_dynamic_files = 1

"Vim-Go
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

au FileType go nmap <Leader>gov <Plug>(go-def-vertical)
au FileType go nmap <Leader>godv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>goi <Plug>(go-info)

au FileType go nmap <leader>gor <Plug>(go-run)
au FileType go nmap <leader>gob <Plug>(go-build)
au FileType go nmap <leader>got <Plug>(go-test)
au FileType go nmap <leader>goc <Plug>(go-coverage)

"VimWiki
let g:vimwiki_list = [{
            \'path':'/data/thesi/wiki',
            \'path_html':'~/.wiki/',
            \'template_path':'/data/thesi/wiki/templates',
            \'template_default':'default',
            \'template_ext':'.html',
            \'auto_export': 1}]
let g:vimwiki_text_ignore_newline = 0
nmap <leader>wwc :VimwikiAll2HTML<CR>
au BufNewFile,BufReadPre *.wiki setlocal textwidth=0 wrapmargin=0 wrap

"Ack/Ag
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif
