" ##########################################
" ############# Plugins ####################
" ##########################################

call plug#begin('~/.local/share/nvim/plugged')

" General
Plug 'w0rp/ale' " Syntax checker
Plug 'vim-airline/vim-airline' " Status line
Plug 'vim-airline/vim-airline-themes' " Status line themes

Plug 'mileszs/ack.vim' " ACK
Plug 'neoclide/coc.nvim', {'branch': 'release'} "Auto completion
Plug 'Shougo/denite.nvim' " Fuzzy file finding
Plug 'sheerun/vim-polyglot' "Multi language syntax highlighting

" GIT
Plug 'tpope/vim-fugitive' " GIT Wrapper
Plug 'airblade/vim-gitgutter' " Diff in gutter

" PHP
Plug 'honza/vim-snippets' " PHP Snippets for UltiSnips
Plug 'alvan/vim-php-manual' " PHP Manual
Plug 'vim-vdebug/vdebug' " Xdebug support

" Markdown
Plug 'godlygeek/tabular' " Markdown requirement
Plug 'gabrielelana/vim-markdown'

" Color schemes
Plug 'morhetz/gruvbox'

" Javascript
Plug 'pangloss/vim-javascript'

"Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'tag': 'v1.20'}

call plug#end()

" ###########################################
" ############# General Settings ############
" ###########################################

" Enable filtype plugins
filetype plugin on

" Set color scheme
set termguicolors
set background=dark
colorscheme gruvbox

" Enable syntax highlighting
syntax on

" Include all subdirectories when using find
set path+=**

" Show matching files when tab completing
set wildmenu

" Error format for make
set errorformat=%m\ in\ %f\ on\ line\ %l

" Expand tabs into spaces
set expandtab

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

" Line numbers
set number

" Relative line numbers
set nu rnu

" Don't redraw while executing macros
set lazyredraw

" No swap files
set noswapfile

" Don't wrap lines
set nowrap
set formatoptions-=t

" Don't highlight search results
set nohls

" Hightlight formatting issues (whitespace, lines 80+ chars)
highlight Spacing ctermbg=167 ctermfg=white guibg=orange
au BufWinEnter * match Spacing /\s\+$/
set textwidth=80
set colorcolumn=+1
highlight ColorColumn ctermbg=235 guibg=gray14

" File name completion
set wildmode=longest,list

" Highlight tab characters
set list
set listchars=tab:>-,precedes:<,extends:>

" Open file at line number file was left
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Disable folding
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=2

" Allow to switch buffers without saving
set hidden
set confirm

" Keep 3 lines visible above the cursor at any given time
set scrolloff=3

" Use xmllint to auto indent xml files http://goo.gl/N8wrXh
au BufRead,BufEnter *.xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 25
autocmd FileType netrw setl bufhidden=delete " don't ask to save on close

" ###########################################
" ############# Key Mappings ################
" ###########################################

" General mappings
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

" ##############################################
" ############# Plugin Settings ################
" ##############################################

" Airline
let g:airline_theme='minimalist'

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

" Markdown
autocmd BufEnter *.md exe 'noremap <F5> :!xdg-open %:p<CR>'

" Ale
let g:ale_linters = {'php': ['php']}

" Coc.nvim
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Coc Snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" VDebug
let g:vdebug_options = {'ide_key': 'vim-xdebug'}
let g:vdebug_options = {'break_on_open': 0}
let g:vdebug_options = {'server': '127.0.0.1'}
let g:vdebug_options = {'port': '9000'}

nmap <leader>f :Denite file/rec<CR>
nmap ; :Denite buffer<CR>
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfuncti

call denite#custom#var('file/rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
