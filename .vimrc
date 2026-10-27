if has('termguicolors')
   set termguicolors
endif
syntax on
set noswapfile
set ignorecase
set smartcase
set incsearch
set hlsearch
set smartindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set splitbelow splitright
set undodir=/tmp
set undofile
set undoreload=10000
set ttyfast
set showmode
let mapleader = " "
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_showhide=1
let g:netrw_winsize=20
set nowrap
set omnifunc=syntaxcomplete#Complete
set completeopt=menu,menuone
set shortmess+=c
set wildmenu
set wildmode=longest,full
set wildoptions=pum
set laststatus=2
autocmd FileType css setl iskeyword+=-
autocmd FileType css setl iskeyword+=@-@
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
inoremap jj <Esc>
nnoremap H :bp<CR>
nnoremap L :bn<CR>
" Term maps
nnoremap <F4> :term<CR>
tnoremap <Esc><Esc> <C-\><C-n>
" Surround word with a wanted character
nnoremap <leader>sw <cmd>echo "Press a character: " \| let c = nr2char(getchar()) \| exec "normal viwo\ei" . c . "\eea" . c . "\e" \| redraw<CR>
" Replace all occurrences of a word
nnoremap <leader>rw :%s/\<<c-r><c-w>\>//g<left><left>
nnoremap <leader>e :Lex<CR>
nnoremap <leader>R :so $MYVIMRC<CR>
nnoremap <Esc><Esc> :noh<CR>
