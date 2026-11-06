if has('termguicolors')
   set termguicolors
   colorscheme catppuccin
endif
syntax on
set noswapfile
set ignorecase
set smartcase
set smartindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set splitbelow splitright
set undodir=/tmp
set undofile
set undoreload=10000
set number
set ttyfast
set noshowmode
let mapleader = " "
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_showhide=1
let g:netrw_winsize=20
set omnifunc=syntaxcomplete#Complete
set completeopt=menu,menuone
set shortmess+=c
set clipboard=unnamedplus
set mouse=a
set wrap
autocmd FileType css setl iskeyword+=-
autocmd FileType css setl iskeyword+=@-@
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
command! Term :botright split term://$SHELL
autocmd TermOpen * setlocal listchars= nonumber norelativenumber nocursorline
autocmd TermOpen * startinsert
autocmd BufLeave term://* stopinsert
inoremap jj <Esc>
nnoremap H :bp<CR>
nnoremap L :bn<CR>
nnoremap <F4> :Term<CR>
tnoremap <Esc><Esc> <C-\><C-n>
nnoremap <leader>sw <cmd>echo "Press a character: " \| let c = nr2char(getchar()) \| exec "normal viwo\ei" . c . "\eea" . c . "\e" \| redraw<CR>
nnoremap <leader>rw :%s/\<<c-r><c-w>\>//g<left><left>
map <leader>p "+P
vnoremap <leader>y "*y :let @+=@*<CR>
nnoremap <leader>R :so $MYVIMRC<CR>
map j gj
map k gk

