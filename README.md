```
 ______________
< cam carter's >
<   dotfiles   >
 --------------
           \   ^__^
	    \  (oo)\_______
	       (__)\       )\/\
		   ||----w |
		   ||     ||
				# another dotfiles repo? yes
```

**Disclaimer: these dotfiles are constantly changing, because I can never make up my mind on how things should work**

This repo contains my environment configurations. It also contains a deployment script to install neovim and zsh, if you do not have them already. The included software and there configuration files are meant to be a lightweight toolkit usable on any UNIX-based machine, *hopefully*.

  - A ton of vim plugins (and some zsh) all in one place, curated and customized for (my) your enjoyment!
  - A simple deployment scipt that (should work) works on every system!
  - Custom functions and aliases that will make life inside your terminal easier!

**Don't be afraid! Fork this repository!**

## Installation
```
cd ~
git clone https://github.com/cam-carter/dotfiles
cd dotfiles
./deploy
```

### Keeping things up to date.
You don't have to worry about updating these configuration files every time the master branch is changed. The following few lines of code, found in `~/dotfiles/zsh/lib/zshrc-manager.sh`, updates the main git repository and the included submodules whenever a new terminal is launched:
```
echo "Updating configuration..."
(cd $HOME/dotfiles && git pull && git submodule update --init --recursive)
source $HOME/dotfiles/zsh/zshrc.sh
```

## What's included?

#### Plugins
All Vim plugins in this package are managed with [vim-plug](https://github.com/junegunn/vim-plug).

##### Good defaults
- [editorconfig-vim](https://github.com/editorconfig/editorconfig-vim)
- [vim-abolish](https://github.com/tpope/vim-abolish)
- [vim-repeat](https://github.com/tpope/vim-repeat)
- [vim-sensible](https://github.com/tpope/vim-sensible)
- [vim-spacemacs](https://github.com/jimmay5469/vim-spacemacs)

##### Navigation
- [fzf](https://github.com/junegunn/fzf.vim)
- [ranger.vim](https://github.com/francoiscabrol/ranger.vim)
- [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)
- [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)
- [vim-vinegar](https://github.com/tpope/vim-vinegar)

##### Theme
- [Apprentice](https://github.com/romainl/Apprentice)
- [base16-vim](https://github.com/chriskempson/base16-vim)
- [cosmic_latte](https://github.com/nightsense/cosmic_latte)
- [polyglot](https://github.com/sheerun/vim-polyglot)
- [vim-css-color](https://github.com/ap/vim-css-color)
- [vim-diminactive](https://github.com/nightsense/cosmic_latte)
- [vitality.vim](https://github.com/tpope/sjl/vitality.vim)

##### Git
- [fugitive.vim](https://github.com/vim-fugitive)
- [vim-signify](https://github.com/mhinz/vim-signify)

##### Autocomplete
- [deoplete.nvim](https://github.com/Shougo/deoplete.nvim)
- [auto-pairs](https://github.com/jiangmiao/auto-pairs)
- [emmet-vim](https://github.com/mattn/emmet-vim)
- [vim-commentary](https://github.com/tpope/vim-commentary)
- [vim-endwise](https://github.com/tpope/vim-endwise)
- [vim-endwise](https://github.com/tpope/vim-surround)
- [sbdchd/neoformat](https://github.com/sdbchd/neoformat) - _currently experiencing issues with Crystal files_

##### Misc.
- [vim-rooter](https://github.com/airblade/vim-rooter)
- [goyo.vim](https://github.com/junegunn/goyo.vim)
	- [limelight.vim](https://github.com/junegunn/limelight.vim)
