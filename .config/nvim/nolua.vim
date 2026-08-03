" OPTIONS
" Colors
if has('termguicolors')
   set termguicolors
   colorscheme dracula
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
" Editor
set number
set ttyfast
set noshowmode
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
nnoremap H :bp<CR>
nnoremap L :bn<CR>
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

" Statusbar
hi statusline   gui=bold guibg=#50FA7B guifg=#282A36
hi statuslinenc gui=NONE cterm=NONE guibg=#44475A guifg=#F8F8F2

augroup ModeEvents
    autocmd!
    au InsertEnter * hi statusline guibg=#8BE9FD
    au InsertLeavePre * hi statusline guibg=#50FA7B
    au ModeChanged *:[vV\x16]* hi statusline guibg=#BD93F9
    au Modechanged [vV\x16]*:* hi statusline guibg=#50FA7B
    au ModeChanged *:[R]* hi statusline guibg=#FF5555
    au ModeChanged [R]* hi statusline guibg=#50FA7B
augroup end

function! ActiveStatusLine()

    let g:currentmode={
        \ 'n'  : 'Normal',
        \ 'no' : 'Normal-Operator Pending',
        \ 'v'  : 'Visual',
        \ 'V'  : 'V-Line',
        \ '' : 'V-Block',
        \ 's'  : 'Select',
        \ 'S'  : 'S-Line',
        \ '' : 'S-Block',
        \ 'i'  : 'Insert',
        \ 'R'  : 'Replace',
        \ 'Rv' : 'V-Replace',
        \ 'c'  : 'Command',
        \ 'cv' : 'Vim Ex',
        \ 'ce' : 'Ex',
        \ 'r'  : 'Prompt',
        \ 'rm' : 'More',
        \ 'r?' : 'Confirm',
        \ '!'  : 'Shell',
        \ 't'  : 'Terminal'
        \}
    set statusline=%0*\ %{toupper(g:currentmode[mode()])}
    set statusline+=\ %1*\ [%n]\ %t%{&modified!=''?'\ \|\ +':''}
    set statusline+=\ %2*%=
    
    set statusline+=%{&ff}\ \|\ %{&fenc!=''?&fenc:&enc}
    set statusline+=\ \|\ %{&filetype!=''?tolower(&filetype):'no\ ft'}
    set statusline+=\ %1*\ %p%%\ %0*\ \ %l:%c\ \ 
    hi User1 gui=NONE cterm=NONE guifg=#F8F8F2 guibg=#44475A
    hi User2 gui=NONE cterm=NONE guifg=#F8F8F2 guibg=#21222C

endfunction

call ActiveStatusLine()
