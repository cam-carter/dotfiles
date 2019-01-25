###################
#### FUNCTIONS ####
###################

# goto home
# this function jumps to home directory and binds it to "^h"
function goto_home() {
	BUFFER="cd ~"
	zle end-of-line
	zle accept-line
}
zle -N goto_home
bindkey "^h" goto_home

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

# mix test --trace
function mix_test() {
	BUFFER="mix test --trace"
	zle accept-line
}
zle -N mix_test
bindkey "^t" mix_test

# mix test --trace --failed
function mix_test_failed() {
	BUFFER="mix test --trace --failed"
	zle accept-line
}
zle -N mix_test_failed
bindkey "^f" mix_test_failed
