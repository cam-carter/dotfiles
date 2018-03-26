set nocompatible		" be iMproved, required
set termencoding=utf-8
set encoding=utf-8
set updatetime=100

execute pathogen#infect()
filetype plugin indent on	" required

set spell spelllang=en_us

" Solarized settings
syntax enable
set background=dark
colorscheme solarized

hi CursorLine cterm=NONE ctermbg=darkblue ctermfg=white guibg=darkblue guifg=white
hi CursorColumn cterm=NONE ctermbg=darkblue ctermfg=white guibg=darkblue guifg=white
nnoremap <leader>c set cursorline! cursorcolumn!<CR>

" Set airline theme
let g:airline_theme='luna'

autocmd StdinReadPre * let s:std_in=1
" Open NERDTree when vim starts up on opening a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Plugin keybindings
nmap <C-n> :NERDTreeToggle<CR>
nmap <F10> :Goyo<CR>
nmap <leader>l :Limelight!!<CR>
xmap <leader>l <plug>(Limelight)

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%#{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Goyo settings
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Limelight settings
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" General Vim settings
set number relativenumber
let mapleader=","
let maplocalleader="\\"
set autoindent
set tabstop=2
set shiftwidth=2
set cursorline

nnoremap n nzzzv
nnoremap N Nzzzv

nnoremap H 0
nnoremap L $
nnoremap J G
nnoremap K gg

map <tab> %

nnoremap <space> za
nnoremap <leader>z zMzvzz

nnoremap vv 0v$

" exit INSERT mode without moving cursor (press fj or jf)
set timeoutlen=300 
inoremap fj <Esc>l
inoremap jf <Esc>l


