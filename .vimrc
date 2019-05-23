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
Plugin 'SirVer/ultisnips' " Snippets
Plugin 'mileszs/ack.vim' " ACK
Plugin 'tpope/vim-surround' " Surround
Plugin 'ludovicchabant/vim-gutentags' " Ctags generation
Plugin 'Shougo/deoplete.nvim' " Auto completion
Plugin 'roxma/nvim-yarp' " Deoplete dependency
Plugin 'roxma/vim-hug-neovim-rpc' " Deoplete dependency
Plugin 'mdempsky/gocode', {'rtp': 'vim/'} " Deoplete go dependency
Plugin 'zchee/deoplete-go' " Deoplete go dependency
Plugin 'ctrlpvim/ctrlp.vim' "File/buffer switching

" GIT
Plugin 'tpope/vim-fugitive' " GIT Wrapper
Plugin 'airblade/vim-gitgutter' " Diff in gutter

" PHP
Plugin 'StanAngeloff/php.vim' " PHP Syntax
Plugin 'sumpygump/php-documentor-vim' " DocComments
Plugin 'joonty/vdebug' " Debugging
Plugin 'shawncplus/phpcomplete.vim' " Omni complete

" SCSS / LESS
Plugin 'cakebaker/scss-syntax.vim' " SCSS Syntax
Plugin 'groenewege/vim-less' " LESS Syntax

" Markdown
Plugin 'godlygeek/tabular' " plasticboy/vim-markdown dependency
Plugin 'plasticboy/vim-markdown'

" Color schemes
Plugin 'morhetz/gruvbox'
Plugin 'NLKNguyen/papercolor-theme'

" Javascript
Plugin 'pangloss/vim-javascript'

"Go
Plugin 'fatih/vim-go'

call vundle#end()
filetype plugin indent on

" ###########################################
" ############# General Settings ############
" ###########################################

" Enable filtype plugins
filetype plugin on

" Set encoding to UTF-8
set encoding=utf-8

" Set color scheme
set t_Co=256
set termguicolors
set background=dark
colorscheme PaperColor

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
au BufNewFile,BufReadPre,BufWinEnter *.html setlocal shiftwidth=2 tabstop=2
au BufNewFile,BufReadPre,BufWinEnter *.phtml setlocal filetype=html.php shiftwidth=2 tabstop=2 syntax=php
au BufNewFile,BufReadPre,BufWinEnter *.tpl setlocal filetype=html shiftwidth=2 tabstop=2
au BufNewFile,BufReadPre,BufWinEnter *.tpl.php setlocal filetype=php.html shiftwidth=2 tabstop=2 syntax=php
au BufNewFile,BufReadPre,BufWinEnter *.js setlocal filetype=javascript shiftwidth=4 tabstop=4
au BufNewFile,BufReadPre,BufWinEnter *.less setlocal filetype=less shiftwidth=2 tabstop=2
au BufNewFile,BufReadPre,BufWinEnter *.scss setlocal filetype=scss shiftwidth=2 tabstop=2
au BufNewFile,BufReadPre,BufWinEnter *.css setlocal filetype=css shiftwidth=2 tabstop=2
au BufNewFile,BufReadPre,BufWinEnter *.xml setlocal filetype=xml shiftwidth=2 tabstop=2
au BufNewFile,BufReadPre,BufWinEnter *.twig setlocal filetype=html shiftwidth=2 tabstop=2
au BufNewFile,BufReadPre,BufWinEnter *.go setlocal filetype=go tabstop=4 expandtab! nolist
au BufNewFile,BufReadPre,BufWinEnter *.wiki setlocal spell wrap
au BufNewFile,BufReadPre,BufWinEnter *.txt setlocal spell wrap
au BufNewFile,BufReadPre,BufWinEnter *.md setlocal spell wrap

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
set formatoptions-=t

" Hightlight formatting issues (whitespace, lines 80+ chars)
highlight Spacing ctermbg=167 ctermfg=white guibg=orange
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
nmap <leader>] :cn<CR>
nmap <leader>[ :cp<CR>
nmap <leader>bd :bdelete<CR>
nmap <leader>v `[v`] " Select pasted text
imap jj <ESC>

" Disable help key
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Don't clear yank buffer on paste
vnoremap p "_dP

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

" UltiSnips
let g:UltiSnipsExpandTrigger="<leader><space>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"

"Vim-Go
let g:syntastic_go_checkers = ['golangci-lint']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

au FileType go nmap <Leader>god <Plug>(go-def)
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

"Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
autocmd InsertLeave * silent! pclose!

inoremap <silent><expr> <TAB>
\ pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
let col = col('.') - 1
return !col || getline('.')[col - 1] =~ '\s'
endfunction"}}}

"Gutentags
let g:gutentags_ctags_executable_php = 'ctags --fields=+l'

" Markdown
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_toc_autofit = 1
autocmd BufEnter *.md exe 'noremap <F5> :!xdg-open %:p<CR>'

" Ale
let g:ale_linters = {'php': ['php']}

" CtrlP
nmap <leader>bl :CtrlPBuffer<CR>
