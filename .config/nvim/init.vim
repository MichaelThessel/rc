" ##########################################
" ############# Plugins ####################
" ##########################################

call plug#begin('~/.local/share/nvim/plugged')

" General
Plug 'w0rp/ale' " Syntax checker
Plug 'bling/vim-airline' " Status line
Plug 'mileszs/ack.vim' " ACK
Plug 'neoclide/coc.nvim', {'branch': 'release'} "Auto completion
Plug 'tpope/vim-surround' " Wrapping
Plug 'tpope/vim-repeat' " Vim Surround dependency
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/1.x',
  \ 'for': [
    \ 'javascript',
    \ 'typescript',
    \ 'css',
    \ 'less',
    \ 'scss',
    \ 'json',
    \ 'graphql',
    \ 'markdown',
    \ 'vue',
    \ 'lua',
    \ 'php',
    \ 'python',
    \ 'ruby',
    \ 'html',
    \ 'swift' ] } " Autoformat

" GIT
Plug 'tpope/vim-fugitive' " GIT Wrapper
Plug 'airblade/vim-gitgutter' " Diff in gutter

" PHP
Plug 'StanAngeloff/php.vim' " PHP Syntax
Plug 'honza/vim-snippets' " PHP Snippets for UltiSnips
Plug 'alvan/vim-php-manual' " PHP Manual

" SCSS / LESS
Plug 'cakebaker/scss-syntax.vim' " SCSS Syntax
Plug 'groenewege/vim-less' " LESS Syntax

" Markdown
Plug 'godlygeek/tabular' " plasticboy/vim-markdown dependency
Plug 'plasticboy/vim-markdown'

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
set nofoldenable

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
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_toc_autofit = 1
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

" Prettier
"let g:prettier#autoformat =  0
"autocmd BufWritePre *.php,.*.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
"autocmd FileType php let b:prettier_ft_default_args = {
"    \ 'parser': 'php',
"    \ }
