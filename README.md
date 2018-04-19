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
				# another dotfile repo? yes
```

## What the heck is this? This is a test

**Disclaimer: these dotfiles are constantly changing, because I can never make up my mind on how things should work**

This repo contains dotfile configurations. It also contains a deployment script to install Vim, zsh, and tmux, if you do not have them already. The included software and there configuration files are meant to be a lightweight toolkit usable on any UNIX-based machine, *hopefully*.

  - A ton of vim plugins (and some zsh) all in one place, curated and customized for (my) your enjoyment!
  - A simple deployment scipt that (should work) works on every system!
  - Custom functions and aliases that will make (my) your life easier!

**Don't be afraid! Fork this repository!**

## Installation
To install and deploy, copy and paste the following commands into your terminal:
```
cd ~
git clone https://github.com/cam-carter/dotfiles
cd dotfiles
./deploy
```

Requires Vim version 8 and for macOS users, [Homebrew](https://brew.sh)

*Everything should work with Neovim (which I will be transitioning to in the coming months), if you switch over all the config files*

### Keeping things up to date.
You don't have to worry about updating these configuration files every time the master branch is changed. The following few lines of code, found in `~/dotfiles/zsh/lib/zshrc-manager.sh`, updates the main git repository and the included submodules whenever a new terminal is launched:
```
echo "Updating configuration..."
(cd $HOME/dotfiles && git pull && git submodule update --init --recursive)
source $HOME/dotfiles/zsh/zshrc.sh
```

## What's included?

### Vim
Your grandpa's text editor! [Vim](https://www.vim.org) has been in active development since 1979 with the release of vi in 2BSD. It is open-source and highly configurable... what's not to love?

The configuration files included in this repo provide some improved key-bindingsand also a bundle of plugins useful for editing with Vim. Vim is a very difficult program to learn and get used to, but once you are able to conquer the steep learning curve, the power you command is incomparable (except for maybe Emacs).

#### Plugins
All Vim plugins in this package are managed by [pathogen.vim](https://github.com/tpope/vim-pathogen).

To add new plugins to Vim you can either place them inside `~/.vim/bundle` or you can add them as a submodule under `~/dotfiles/vim/.vim/bundle`. For example, to install [fugitive.vim](https://github.com/tpope/vim-fugitive) (which is included with these dotfiles), run the following commands:
```
cd ~/dotfiles/vim/.vim/bundle
git submodule add https://github.com/tpope/vim-fugitive
```

The plugins are currently sourced using a symbolic link between `~/.vim/bundle` and `~/dotfiles/vim/.vim/bundle`.

- [fugitive.vim](https://github.com/vim-fugitive) - a Git wrapper so awesome, it should be illegal
- [vim-gitgutter](https://github.com/vim-gitgutter) - a vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks
- [vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides) - true Sublime Text style multiple selections for vim
- [vim-multiple-cursors](https"//github.com/terryma/vim-multiple-cursors")
- [rails.vim](https://github.com/tpope/vim-rails) - Ruby on Rails power tools
- [UtliSnips](https://github.com/SirVer/ultisnips) - the ultimate snippet solution for vim
- [vim-snippets](https://github.com/honza/vim-snippets) - snippets files for various programming languages
- [surround.vim](https://github.com/tpope/vim-surround) - quoting/parenthesizing made simple
- [vim-flake8](https://github.com/nvie/vim-flake8) - Flake8 plugin for vim
- [vim-colors-solarized](https://github.com/altercation/vim-colors-solarized) - precision colorscheme for vim text editor
- [vim-autoclose](https://github.com/vim-scripts/AutoClose) - inserts matching delimeters
- [vim-airline](https://github.com/vim-airline/vim-airline) - lean & mean status/tabline for vim that's light as air
	- [vim-airline-themes](https://github.com/vim-airline/vim-airline-themes) - a collection of themes for vim-airline
- [undotree](https://github.com/mbbill/undotree) - the ultimate undo history visualizer for vim
- [tabular](https://github.com/godlygeek/tabular) - vim script for text filtering and alignment
- [syntastic](https://github.com/vim-syntastic/syntastic) - syntax checking hacks for vim
- [SimpylFold](https://github.com/tmhedberg/SimpylFold) - no-bs python code folding for vim
- [NERDTree](https://github/scrooloose/nerdtree) - a tree explorer plugin for vim
	- [nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-status) - a plugin for NERDTree showing git status
- [NERDCommenter](https://github.com/scrooloose/nerdcommenter)- vim plugin for improved commenting functionality
- [goyo.vim](https://github.com/junegunn/goyo.vim) - distraction-free writing in vim
	- [limelight.vim](https://github.com/junegunn/limelight.vim) - hyperfocus-writing in vim
- [indentpython.vim](https://github.com/vim-scripts/indentpython.vim) - an alternative indentation script for python
- [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim) - Fuzzy file, buffer, mru, tag, etc finder

### Zsh
[Zsh](https://www.zsh.org) (Z shell) is a Unix shell that can be used as a powerful command interpreter for shell scripting. The first version of Zsh was written by Paul Falstad in 1990.

Attached with these dotfiles include an assortment of Zsh plugins, managed with [Oh My Zsh!](https://ohmyz.sh), and custom aliases and functions.

#### Aliases & Functions

| Function | Description |
|----------|-------------|
| `cd` | Works like the default `cd` function, but it also lists the contents of the directory that you change into. |
| `ctrl+k` | This function changes to the parent directory `cd ..` |
| `ctrl+h` | This function changes to the user's home directory `cd ~` |
| `ctrl+l` | This function lists the contents of the working directory `ls` |
| `ctrl+space` | This function clears the current terminal window `clear` |
| `ctrl+g` | While inside a git repository, this function will add all changes to be committed, commit the changes, using the buffer as the commit message, and then push the changes upstream `git add -A; git commit -m "$BUFFER" && git push`
| `enter` | If the buffer is empty, the enter key lists the contents of the current directory `ls`. If it buffer is empty and the working direcotry is a git repository, then it will show the git status of the current repository `git status` |


### tmux

tmux is a terminal multiplexer, allowing a user to access multiple terminal sessions inside a single terminal window or a remote terminal session. It is extremely useful for handling multiple running terminal sessions.
