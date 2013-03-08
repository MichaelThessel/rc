set makeprg=php\ -l\ %

let g:debuggerTimeout = 20
let g:debuggerMaxDepth = 10

highlight Formatting ctermbg=darkred ctermfg=white guibg=darkred
match Formatting /\%81v.\+\|\s\+$/
