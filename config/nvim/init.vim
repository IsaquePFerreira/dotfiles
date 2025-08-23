colorscheme minimalist

set termguicolors
syntax on
set number
set cursorline
set noswapfile
set mouse=a
set clipboard=unnamedplus

highlight clear StatusLine

set ignorecase

set guicursor=

set smartindent

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set shortmess+=c

set splitbelow splitright

autocmd FileType css setl iskeyword+=-
autocmd FileType css setl iskeyword+=@-@

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

command! Term :botright split term://$SHELL

autocmd TermOpen * setlocal listchars= nonumber norelativenumber nocursorline
autocmd TermOpen * startinsert
autocmd BufLeave term://* stopinsert

inoremap jj <esc>

nnoremap [b :bp<cr>
nnoremap ]b :bn<cr>

nnoremap <f4> :Term<cr>

