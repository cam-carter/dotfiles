###################
#### FUNCTIONS ####
###################

# create new directory and cd into it
function mkd() {
	mkdir -p "$@" && cd "$_"
}

# change directory and list directory
function c() {
	cd "$@" && ls
}

# parent_up
# this function jumps to the parent directory and binds it to "^k"
function parent_up() {
	BUFFER="cd .."
	zle accept-line
}
zle -N parent_up
bindkey "^k" parent_up

# go back
# this function jumps to the previous working directory and binds it to "^b"
function go_back() {
	BUFFER="cd -"
	zle accept-line
}
zle -N go_back
bindkey "^b"

# goto home
# this function jumps to home directory and binds it to "^h"
function goto_home() {
	BUFFER="cd ~"
	zle end-of-line
	zle accept-line
}
zle -N goto_home
bindkey "^h" goto_home

# quick list
# this function lists the current directory and binds it to "^l"
function quick_ls() {
	BUFFER="ls"
	zle accept-line
}
zle -N quick_ls
bindkey "^l" quick_ls

# quick clear
# this function clears the terminal and binds it to "^<space>"
function quick_cl() {
	BUFFER="clear"
	zle accept-line
}
zle -N quick_cl
bindkey "^ " quick_cl

# git stage
# this function adds all changes in the repo, commits them, and then pushes the repo
function git_stage() {
	if [ -n "$BUFFER" ]; then
		BUFFER="git add -A; git commit -m \"$BUFFER\" && git push"
	elif [ -z "$BUFFER" ]; then
	 	BUFFER="git add -A; git commit -v && git push"
   	fi	

	zle accept-line
}
zle -N git_stage
bindkey "^g" git_stage

# new accept line
# if the buffer is empty, then ls current directory with enter
# if the buffer is empty && directory is git repository, then git status current git repo
function new_accept_line() {
	if [ ${#${(z)BUFFER}} -eq 0 ]; then
		echo
		if git rev-parse --git-dir > /dev/null 2>&1 ; then
			git status
		else
			ls
		fi
	fi
	zle accept-line
}
zle -N new_accept_line
bindkey '^M' new_accept_line

# add vim plugin
function vim_add_plugin() {
	cd $HOME/dotfiles/vim/bundle && git submodule add https://github.com/$@; cd -
}
