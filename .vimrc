" ##########################################
" ############# Vundle Settings ############
" ##########################################
filetype off
set rtp+=~/.vim/bundle/Vundle
call vundle#begin()
Plugin 'gmarik/Vundle'

" General
Plugin 'bling/vim-airline' " Status line
Plugin 'mileszs/ack.vim' " ACK

" GIT
Plugin 'tpope/vim-fugitive' " GIT Wrapper
Plugin 'airblade/vim-gitgutter' " Diff in gutter

" Color schemes
Plugin 'morhetz/gruvbox'

"Go
Plugin 'fatih/vim-go'

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
au BufNewFile,BufReadPre *.go setlocal filetype=go tabstop=4 expandtab! nolist

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
nmap <leader><tab> :bn<CR>
nmap <leader><s-tab> :bp<CR>
nmap <leader>bd :bdelete<CR>
imap jj <ESC>

" Disable help key
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" ##############################################
" ############# Plugin Settings ################
" ##############################################

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
