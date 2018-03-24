# dotfiles

This repo contains my dotfile configurations. It also contains a deployment script to install Vim, zsh, and tmux, if you do not have them already. The included software and there configuration files are meant to be a lightweight toolkit usable on any UNIX-based machine.

## Installation
To install and deploy, copy and paste the following commands into your terminal:
```
cd ~ && git clone https://github.com/cam-carter/dotfiles
cd dotfiles && ./deploy
```

You don't have to worry about updated these configuration files everytime the master branch is updated either. The following command, found in `~/dotfiles/zsh/lib/zshrc-manager.sh`, updates the main git repository and the included submodules whenever a new terminal is launched:
```
echo "Updating configuration..."
(cd $HOME/dotfiles && git pull && git submodule update --init --recursive)
source $HOME/dotfiles/zsh/zshrc.sh
```

If you like these dotfiles so much so that you fork the repo for yourself, go right ahead! Feel free to let me know of any fun and interesting functions you come up with.

## Included Software

### Vim
Vim is an open-source and highly configurable text-editor.  Before Vim there was "vi", originally released as part of 2BSD in May 1979. Vim stands for "Vi IMproved", and it is just that.

The associated configuration files provide some improved key-bindings for my own day-to-day use and also a bundle of plugins I find most useful for editing with Vim. Vim is a very difficult program to learn and get used to, but once you are able to conquer the steep learning curve, the power you command is incomparable (except for maybe Emacs).

#### Plugins
All Vim plugins in this package are managed by [pathogen.vim](https://github.com/tpope/vim-pathogen).

To add new plugins to Vim you can either place them inside `~/.vim/bundle` or you can add them as a submodule under `~/dotfiles/vim/.vim/bundle`. For example, to install [fugitive.vim](https://github.com/tpope/vim-fugitive) (which is included with these dotfiles), run the following commands:
```
cd ~/dotfiles/vim/.vim/bundle
git submodule add https://github.com/tpope/vim-fugitive
```

### Zsh
Zsh (Z shell) is a Unix shell that can be used as a powerful command interpreter for shell scripting. The first version of Zsh was written by Paul Falstad in 1990. It makes a valueable resource when you're trapped inside of the a CLI all day.

Attached with these dotfiles include an assortment of Zsh plugins, managed with Oh My Zsh, and custom aliases and functions.

### tmux

tmux is a terminal multiplexer, allowing a user to access multiple terminal sessions inside a single terminal window or a remote terminal session. It is extremely useful for handling multiple running terminal sessions.

Currently I don't use tmux very often, because I mainly work within the i3wm which allows for very powerful tiling of various programs. The reason I included tmux in this curated toolkit, was for potential use on systems that did not belong to me or to work on remote servers.

