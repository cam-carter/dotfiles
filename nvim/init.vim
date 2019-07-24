"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/dotfiles/nvim/plugged')

"Spacemacs (use local vim-spacemacs if possible)
if !empty(glob("~/repos/vim-spacemacs"))
  Plug '~/repos/vim-spacemacs'
else
  Plug 'cam-carter/vim-spacemacs'
endif

"Key binding menues
Plug 'hecal3/vim-leader-guide'

"Good defaults
Plug 'tpope/vim-sensible'
"Plug 'PreserveNoEOL' "required for editorconfig-vim
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'

"Navigation
Plug 'tpope/vim-vinegar'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'terryma/vim-multiple-cursors'

"Theme
"Plug 'romainl/Apprentice'
Plug 'chriskempson/base16-vim'
Plug 'ap/vim-css-color'
Plug 'sjl/vitality.vim' "needed for diminactive focus setting
Plug 'blueyed/vim-diminactive'

"Git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

"Syntax hightlighting
Plug 'sheerun/vim-polyglot'
Plug 'rhysd/vim-wasm'

"Better autochdir
Plug 'airblade/vim-rooter'

"Autocomplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
endif
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'andrewradev/splitjoin.vim'

" Plug 'sbdchd/neoformat'

"Colorschemes
Plug 'nightsense/cosmic_latte'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

Plug 'mtth/scratch.vim'
Plug 'lervag/vimtex'
Plug 'christoomey/vim-system-copy'

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" scratch.vim config
let g:scratch_no_mappings=1

let g:ale_competion_enabled=1

" fix copy paste error in osx sierra
set clipboard=unnamed

"enable mouse click/scroll
set mouse=a

"line numbers
set number

"tabs
set tabstop=2
set shiftwidth=2

"highlight search
set hlsearch

":e autocomplete settings
set wildmenu
set wildmode=longest:list,full

"don't create swap files
set nobackup
set nowritebackup
set noswapfile

"Ignores
set wildignore+=*tmp/*,*node_modules/*,*bower_components/*,*.git/*,*.pyc,*lib/python*

"EditorConfig settings
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

"better autochdir
let g:rooter_silent_chdir = 1

"folding
set foldmethod=indent
set nofoldenable

"autocomplete
if has('nvim')
  " Use deoplete.
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#enable_ignore_case = 1
  inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
endif
let g:closetag_filenames = "*.html,*.js,*.jsx,*.eex"

let g:deoplete#disable_auto_complete = 1

" function! Multiple_cursors_before()
" 	if exists('g:deoplete#disable_auto_complete') 
" 	 let g:deoplete#disable_auto_complete = 1
"  endif
" endfunction
" function! Multiple_cursors_after()
" 	if exists('g:deoplete#disable_auto_complete')
" 	  let g:deoplete#disable_auto_complete = 0
" 	endif
" endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Statusline/Tabline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ShortPath(path)
  let cwd = substitute(a:path, $HOME, "~", "")
  return substitute(cwd, "\\~/repos/", "", "")
endfunction
function! ShortFilepath()
  return ShortPath(expand("%f"))
endfunction
function! ShortCWD()
  return ShortPath(getcwd())
endfunction
function! IsModified()
  return &modified?"[+]":""
endfunction

"Statusline
function! StatusLine()
  let s = ''
  let s .= '%{IsModified()}%r' "File status
  let s .= ' %{ShortFilepath()}:%{line(".")}:%{col(".")}'
  let s .= '%=%L ' "Right align line numbers
  return s
endfunction
set statusline=%!StatusLine()

"Tabline
set showtabline=2
function! Tabline()
  let s = ''
  for i in range(tabpagenr('$'))
    let tab = i + 1
    let winnr = tabpagewinnr(tab)
    let buflist = tabpagebuflist(tab)
    let bufnr = buflist[winnr - 1]
    let bufname = bufname(bufnr)

    let s .= '%' . tab . 'T'
    let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
    let s .= (bufname != '' ? '['. fnamemodify(bufname, ':t') . ']' : '[No Name]')
  endfor

  let s .= '%#TabLineFill#'

  " right-align the CWD
  let s .= '%=%#TabLineSel#[%{ShortCWD()}]'

  return s
endfunction
set tabline=%!Tabline()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Style
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"diminactive settings
let g:diminactive_enable_focus = 1

"Syntax highlighting
"
if $TERM_PROGRAM == "iTerm.app" && filereadable(expand("~/.vimrc_bthanaelkane/vim-indent-guidesackground"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

"gvim options
if has("gui_running")
  "remove scrollbars
  set guioptions-=l
  set guioptions-=L
  set guioptions-=r
  set guioptions-=b

  "set fonts and background
  set transparency=5
  set lines=70
  set columns=250
endif

"Colorscheme

set termguicolors
set background=light
" colorscheme base16-atelierdune
colorscheme office-light
" colorscheme cosmic_latte

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Bindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "\<SPACE>"

let g:spacemacs#plugins = [
  \ 'tpope/vim-fugitive',
  \ 'junegunn/fzf.vim',
\ ]
let g:spacemacs#excludes = [
	\ '^ar',
  \ '^br',
  \ '^fed',
	\ '^feR',
  \ '^ff',
  \ '^pp',
\ ]

nnoremap <LEADER>ar :Ranger<CR>
nnoremap <LEADER>ag :Goyo<CR>
nnoremap <LEADER>as :Scratch<CR>
nnoremap <LEADER>aS :Scratch!<CR>
nnoremap <LEADER>br :checktime<CR>:e<CR>
nnoremap <LEADER>fed :e ~/dotfiles/nvim/init.vim<CR>
nnoremap <LEADER>feR :source ~/dotfiles/nvim/init.vim<CR>
nnoremap <LEADER>pp :e ~/repos/
nnoremap <LEADER>ff :e <C-R>=substitute(expand("%:p:h"), getcwd(), ".", "")<CR>/

"Key binding menues
nnoremap <silent> <LEADER> :<C-U>LeaderGuide '<SPACE>'<CR>
vnoremap <silent> <LEADER> :<C-U>LeaderGuideVisual '<SPACE>'<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Testing new things
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"F1 to see syntax highlight under cursor
nm <silent> <F1> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name")
    \ . '> trans<' . synIDattr(synID(line("."),col("."),0),"name")
    \ . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")
    \ . ">"<CR>

"italic
hi Comment cterm=italic
hi htmlArg cterm=italic
hi Include cterm=italic
hi jsReturn cterm=italic
hi jsThis cterm=italic
hi StorageClass cterm=italic
nmap <leader>gS <plug>
nmap <leader>gS <plug>
nmap <leader>gS <plug>
hi xmlAttrib cterm=italic

"bold
hi jsVariableDef cterm=bold

" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
nnoremap <LEADER>* :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
  let @/ = ''
  if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
    setl updatetime=4000
    return 0
  else
    augroup auto_highlight
      au!
      au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=50
    return 1
  endif
endfunction
hi Search ctermfg=242 ctermbg=222

" automatically reload changed files
augroup reload
  au!
  au FocusGained * :checktime
augroup end

" auto format on save
let g:ale_fixers = {
\	'elixir': ['mix_format'],
\}
" let g:ale_fix_on_save=1

" folding
set foldlevelstart=99

" testing helpers
nnoremap <LEADER>cp :let @+= ShortFilepath()<CR>
nnoremap <LEADER>mtt :wa<CR>:! mix test <C-R>=ShortFilepath().":".line(".")<CR><CR>
nnoremap <LEADER>mtb :wa<CR>:! mix test <C-R>=ShortFilepath()<CR><CR>

" formatting helpers
nnoremap <LEADER>mff :wa<CR>:! mix format <C-R>=ShortFilepath()<CR><CR>
nnoremap <LEADER>cff :wa<CR>:! crystal tool format <C-R>=ShortFilepath()<CR><CR>
