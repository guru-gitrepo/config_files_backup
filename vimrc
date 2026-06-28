
" Enable syntax highlighting
syntax on

" Set color scheme to a high-visibility one
colorscheme industry

" Specifically override the comment color to something bright
highlight Comment ctermfg=LightCyan

" Plugin for markdown preview
call plug#begin('~/.vim/plugged')

" The 'do' ensures the server is built automatically
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

call plug#end()

" Enable line numbers
set number

" Enable syntax highlighting
syntax on

" Wrap lines logically (without breaking words)
set textwidth=80
set linebreak

set autoindent
set smartindent
augroup groff
    autocmd!
    autocmd BufWritePost *.ms silent !groff -ms -dpaper=a4 -U -e -t -p % -Tpdf > %:r.pdf
augroup END
