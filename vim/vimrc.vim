set nocompatible		" be iMproved, required
set termencoding=utf-8
set encoding=utf-8
set updatetime=100
set spell spelllang=en_us

execute pathogen#infect()
filetype plugin indent on	" required

" Colorscheme settings
if has('gui_running')
	set background=light
	colorscheme solarized
else
	set background=dark 
	colorscheme solarized
endif
syntax enable

set t_8b=[48;2;%lu;%lu;%lum
set t_8f=[38;2;%lu;%lu;%lum

" Enable indent guides by default
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:inden_guides_guide_size = 1

" Set airline theme
let g:airline_theme='one'
let g:airline#extensions#tabline#enabled=1

" NERDTree settings
" ignore .pyc files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$']
autocmd StdinReadPre * let s:std_in=1
" Open NERDTree when vim starts up on opening a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Plugin keybindings
nnoremap <C-n> : NERDTreeToggle<CR>
nnoremap <F9> : Goyo<CR>
nnoremap <F5>  : UndotreeToggle<CR>
call togglebg#map('<F4>')

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%#{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

" Goyo settings
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Limelight settings
let g:limelight_conceal_ctermfg='gray'
let g:limelight_conceal_ctermfg=240
let g:limelight_conceal_guifg='DarkGray'
let g:limelight_conceal_guifg='#777777'

" SimpylFold settings
let g:SimpylFold_docstring_preview=1

" YouCompleteMe settings
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" General Vim settings
set number relativenumber
let mapleader=","
let maplocalleader="\\"
set autoindent
set cursorline
" enable code folding
set foldmethod=indent
set foldlevel=99

" PEP8 standards config
au BufNewFile,BufRead *.py, *.md, *.markdown, *.ex, *.exs
	\ set tabstop=4
	\ set softtabstop=4
	\ set shiftwidth=4
	\ set textwidth=79
	\ set expandtab
	\ set autoindent
	\ set fileformat=unix
au BufNewFile,BufRead *.js, *.html, *.css, *.scss, *.sass 
	\ set tabstop=2
	\ set softtabstop=2
	\ set shiftwidth=2
au BufNewFile,BufRead *.py, *.pyc, *.c, *.h, *.rb, *.ex, *.exs match BadWhiteSpace /\s\+$/ 

" Python with virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
	project_base_dir = os.environ['VIRTUAL_ENV']
	activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
	execfile(activate_this, dict(__file__=activate_this))
EOF

let python_highlight_all=1
syntax on 

set tabstop=2
set softtabstop=2
set shiftwidth=2 
" Key bindings

" Split navigations
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

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


