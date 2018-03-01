set nocompatible		" be iMproved, required
filetype off			" required
set encoding=utf-8

set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdcommenter'
Plugin 'valloric/youcompleteme'
Plugin 'easymotion/vim-easymotion'
Plugin 'mattn/emmet-vim'
Plugin 'townk/vim-autoclose'
Plugin 'xuhdev/vim-latex-live-preview'

call vundle#end()		" required
filetype plugin indent on	" required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList		- lists configred plugins
" :PluginInstall	- installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foor	- searches for foo; append `!` to refresh local cache
" :PluginClean		- confirms removal of unused plguins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put you non-Plugin stuff after this line

" Enable solarized theme
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" Set airline theme
let g:airline_theme='luna'

" General Vim settings
set number relativenumber
let mapleader=","
set autoindent
set tabstop=4
set shiftwidth=4
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

