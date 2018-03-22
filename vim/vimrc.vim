set nocompatible		" be iMproved, required
set encoding=utf-8

execute pathogen#infect()
filetype plugin indent on	" required

set spell spelllang=en_us

syntax enable
set background=dark
hi CursorLine cterm=NONE ctermbg=darkblue ctermfg=white guibg=darkblue guifg=white
hi CursorColumn cterm=NONE ctermbg=darkblue ctermfg=white guibg=darkblue guifg=white
nnoremap <leader>c set cursorline! cursorcolumn!<CR>

" Set airline theme
let g:airline_theme='luna'

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

