" OPTIONS
" Colors
if has('termguicolors')
   set termguicolors
endif
syntax on
" Disable swapfile
set noswapfile
" Search options
set ignorecase
set smartcase
" Code preferences
set smartindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set splitbelow splitright
" Undodir
set undodir=/tmp
set undofile
set undoreload=10000
" mapleader
let mapleader = " "
" File manager
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_showhide=1
let g:netrw_winsize=20
" Completion
set omnifunc=syntaxcomplete#Complete
set complete+=k
set completeopt=menu,menuone
set shortmess+=c
" CSS defaults
autocmd FileType css setl iskeyword+=-
autocmd FileType css setl iskeyword+=@-@
" Disable auto-comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Term
command! Term :botright split term://$SHELL
autocmd TermOpen * setlocal listchars= nonumber norelativenumber nocursorline
autocmd TermOpen * startinsert
autocmd BufLeave term://* stopinsert
" MAPS
" Quickly returns to normal mode 
inoremap jj <Esc>
" Buffers
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>
" Term maps
nnoremap <F4> :Term<CR>
tnoremap <Esc><Esc> <C-\><C-n>
" Copy and paste
map <leader>p "+P
vnoremap <leader>y "*y :let @+=@*<CR>
" Surround word with a wanted character
nnoremap <leader>sw <cmd>echo "Press a character: " \| let c = nr2char(getchar()) \| exec "normal viwo\ei" . c . "\eea" . c . "\e" \| redraw<CR>
" Replace all occurrences of a word
nnoremap <leader>rw :%s/\<<c-r><c-w>\>//g<left><left>

