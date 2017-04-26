" ##########################################
" ############# Vundle Settings ############
" ##########################################
filetype off
set rtp+=~/.vim/bundle/Vundle
call vundle#begin()
Plugin 'gmarik/Vundle'

" General
Plugin 'w0rp/ale' " Syntax checker
Plugin 'bling/vim-airline' " Status line
Plugin 'unblevable/quick-scope' " Left right movements
Plugin 'SirVer/ultisnips' " Snippets
Plugin 'mileszs/ack.vim' " ACK
Plugin 'tpope/vim-surround' " Surround
Plugin 'tpope/vim-unimpaired' " Extra mappings
Plugin 'ludovicchabant/vim-gutentags' " Ctags generation
Plugin 'Valloric/YouCompleteMe' " Auto completion

" GIT
Plugin 'tpope/vim-fugitive' " GIT Wrapper
Plugin 'airblade/vim-gitgutter' " Diff in gutter

" PHP
Plugin 'vim-scripts/php.vim--Garvin' " PHP Syntax
Plugin 'sumpygump/php-documentor-vim' " DocComments
Plugin 'joonty/vdebug' " Debugging
Plugin 'shawncplus/phpcomplete.vim' " Omni complete

" SCSS / LESS
Plugin 'cakebaker/scss-syntax.vim' " SCSS Syntax
Plugin 'groenewege/vim-less' " LESS Syntax

" CSS / HTML
Plugin 'mattn/emmet-vim' " CSS/HTML auto completion

" Markdown
Plugin 'godlygeek/tabular' " plasticboy/vim-markdown dependency
Plugin 'plasticboy/vim-markdown'

" Color schemes
Plugin 'morhetz/gruvbox'

" Javascript
Plugin 'pangloss/vim-javascript'

"Go
Plugin 'fatih/vim-go'

" Octave
Plugin 'jvirtanen/vim-octave'

"VimWiki
Plugin 'vimwiki/vimwiki'

"GDB
Plugin 'vim-scripts/Conque-GDB'

call vundle#end()
filetype plugin indent on

" ###########################################
" ############# General Settings ############
" ###########################################

" Enable filtype plugins
filetype plugin on

" Set color scheme
set termguicolors
set background=dark
colorscheme gruvbox
let g:gruvbox_invert_selection = 0
let g:gruvbox_contrast_dark = "hard"

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
au BufNewFile,BufReadPre *.wiki setlocal spell wrap
au BufNewFile,BufReadPre *.txt setlocal spell wrap
au BufNewFile,BufReadPre *.md setlocal spell wrap

" Always show the status line
set laststatus=2

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
highlight Spacing ctermbg=167 ctermfg=white
au BufWinEnter * match Spacing /\s\+$/
set textwidth=80
set colorcolumn=+1
highlight ColorColumn ctermbg=235 guibg=gray14

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

" General mappings
set pastetoggle=<leader>i
nmap <leader>w :set wrap <CR>
nmap <leader>W :set nowrap <CR>
nmap <leader>C :set wrap <CR> :set norelativenumber <CR> :set nonumber <CR> :set nolist <CR> :GitGutterDisable <CR> " Copy mode
vmap <leader>w :s/\s\+$//g <CR> :%s/[^ ]\zs \+/ /g <CR> " Whitepsace cleanup
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

" Airline
let g:airline_right_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep= ''
let g:airline_left_sep = ''

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''

" Fugitive
nmap <leader>gd :Gdiff<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gb :Gblame<CR>
nmap <leader>gc :Gread<CR>
nmap <leader>gg :Ggrep! <C-R><C-W><CR><CR>
nmap <leader>g> :diffget<CR>
autocmd QuickFixCmdPost *grep* cwindow

" GITGutter
highlight clear SignColumn

" Emmet plugin
imap <leader>e <C-y>,
let g:user_emmet_leader_key='<leader>e'

"Quick Scope
let g:qs_highlight_on_keys = []

" UltiSnips
let g:UltiSnipsExpandTrigger="<leader><space>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"

"Vim-Go
let g:syntastic_go_checkers = ['metalinter']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

au FileType go nmap <Leader>god <Plug>(go-def-vertical)
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

"GDB
let g:ConqueTerm_Color = 2
let g:ConqueTerm_CloseOnEnd = 1
let g:ConqueTerm_StartMessages = 0

function DebugSession()
    silent make -o vimgdb -gcflags "-N -l"
    redraw!
    if (filereadable("vimgdb"))
        ConqueGdb vimgdb
    else
        echom "Couldn't find debug file"
    endif
endfunction
function DebugSessionCleanup(term)
    if (filereadable("vimgdb"))
        let ds=delete("vimgdb")
    endif
endfunction
call conque_term#register_function("after_close", "DebugSessionCleanup")
nmap <leader>d :call DebugSession()<CR>

"YouCompleteMe
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_collect_identifiers_from_tags_files = 1
