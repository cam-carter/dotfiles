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
