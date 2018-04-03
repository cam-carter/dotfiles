# dotfiles

This repo contains my dotfile configurations. It also contains a deployment script to install Vim, zsh, and tmux, if you do not have them already. The included software and there configuration files are meant to be a lightweight toolkit usable on any UNIX-based machine.

If you like these dotfiles so much so that you fork the repo for yourself, go right ahead! Feel free to let me know of any fun and interesting functions you come up with.

## Installation
To install and deploy, copy and paste the following commands into your terminal:
```
cd ~ && git clone https://github.com/cam-carter/dotfiles
cd dotfiles && ./deploy
```

Requires Vim version 8 and curl.

### Keeping things up to date.
You don't have to worry about updating these configuration files every time the master branch is changed. The following few lines of code, found in `~/dotfiles/zsh/lib/zshrc-manager.sh`, updates the main git repository and the included submodules whenever a new terminal is launched:
```
echo "Updating configuration..."
(cd $HOME/dotfiles && git pull && git submodule update --init --recursive)
source $HOME/dotfiles/zsh/zshrc.sh
```

## Included Software

### Vim
Vim is an open-source and highly configurable text-editor.  Before Vim there was "vi", originally released as part of 2BSD in May 1979. Vim stands for "Vi IMproved", and it is just that.

The configuration files included in this repo provide some improved key-bindings for my own day-to-day use and also a bundle of plugins I find most useful for editing with Vim. Vim is a very difficult program to learn and get used to, but once you are able to conquer the steep learning curve, the power you command is incomparable (except for maybe Emacs).

#### Plugins
All Vim plugins in this package are managed by [pathogen.vim](https://github.com/tpope/vim-pathogen).

To add new plugins to Vim you can either place them inside `~/.vim/bundle` or you can add them as a submodule under `~/dotfiles/vim/.vim/bundle`. For example, to install [fugitive.vim](https://github.com/tpope/vim-fugitive) (which is included with these dotfiles), run the following commands:
```
cd ~/dotfiles/vim/.vim/bundle
git submodule add https://github.com/tpope/vim-fugitive
```

The plugins are currently sourced using a symbolic link between `~/.vim/bundle` and `~/dotfiles/vim/.vim/bundle`.

- [fugitive.vim](https://github.com/vim-fugitive)
- [vim-gitgutter](https://github.com/vim-gitgutter)
- [vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides)
- [vim-multiple-cursors](https"//github.com/terryma/vim-multiple-cursors")
- [rails.vim](https://github.com/tpope/vim-rails)
- [UtliSnips](https://github.com/SirVer/ultisnips)
- [vim-snippets](https://github.com/honza/vim-snippets)
- [surround.vim](https://github.com/tpope/vim-surround)
- [vim-flake8](https://github.com/nvie/vim-flake8)
- [vim-colors-solarized](https://github.com/altercation/vim-colors-solarized)
- [vim-autoclose](https://github.com/vim-scripts/AutoClose)
- [vim-airline](https://github.com/vim-airline/vim-airline)
	- [vim-airline-themes](https://github.com/vim-airline/vim-airline-themes)
- [undotree](https://github.com/mbbill/undotree)
- [tabular](https://github.com/godlygeek/tabular)
- [syntastic](https://github.com/vim-syntastic/syntastic)
- [SimpylFold](https://github.com/tmhedberg/SimpylFold)
- [NERDTree](https://github/scrooloose/nerdtree) - a tree explorer plugin for vim
- [nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-status) - a plugin for NERDTree showing git status
- [NERDCommenter](https://github.com/scrooloose/nerdcommenter)- vim plugin for improved commenting functionality
- [goyo.vim](https://github.com/junegunn/goyo.vim) - distraction-free writing in vim
- [limelight.vim](https://github.com/junegunn/limelight.vim) - hyperfocus-writing in vim
- [indentpython.vim](https://github.com/vim-scripts/indentpython.vim) - an alternative indentation script for python
- [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim) - Fuzzy file, buffer, mru, tag, etc finder

### Zsh
Zsh (Z shell) is a Unix shell that can be used as a powerful command interpreter for shell scripting. The first version of Zsh was written by Paul Falstad in 1990.

Attached with these dotfiles include an assortment of Zsh plugins, managed with Oh My Zsh, and custom aliases and functions.

### tmux

tmux is a terminal multiplexer, allowing a user to access multiple terminal sessions inside a single terminal window or a remote terminal session. It is extremely useful for handling multiple running terminal sessions.

