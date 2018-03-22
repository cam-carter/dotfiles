# dotfiles

This repo contains my dotfile configurations. It also contains a deployment script to install Vim, zsh, and tmux, if you do not have them already. The included software and there configuration files are meant to be a lightweight toolkit usable on any UNIX-based machine.

To deploy, clone the repo into your `$HOME` directory and run the following command:
```
$ git clone https://github.com/cam-carter/dotfiles
$ cd dotfiles && ./deploy
```

---

## Included Software

### Vim
Vim is an open-source and highly configurable text-editor.  Originally named "vi", it was first released as part of 2BSD in May 1979. Vim stands for "Vi IMproved".

The associated configuration files provide some improved key-bindings for my own day-to-day use and also a bundle of plugins I find most useful for editing with Vim. Vim is a very difficult program to learn and get used to, but once you are able to conquer the steep learning curve, the power you command is incomparable (except for maybe Emacs).

### Zsh
Zsh (Z shell) is a Unix shell that can be used as a powerfull comman interpreter for shell scripting. The first version of Zsh was written by Paul Falstad in 1990. It makes a valueable resource when you're trapped inside of the a CLI all day.

Attached with these dotfiles include an assortment of Zsh plugins, managed with Oh My Zsh, and custom alieases and functions.

### tmux

tmux is a terminal multiplexer, allowing a user to access multiple terminal sessions inside a single terminal window or a remote terminal session. It is extremely useful for handling multiple running terminal sessions.

Currently I don't use tmux very often, because I mainly work within the i3wm which allows for very powerful tiling of various programs. The reason I included tmux into this currated toolkit, was for potential use on systems that did not belong to me or to work on remote servers.

