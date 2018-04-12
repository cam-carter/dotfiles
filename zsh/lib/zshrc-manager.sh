time_out () { perl -e 'alarm shift; exec @ARGV' "$@"; }

# run tmux if it exists
if command -v tmux>/dev/null; then
	[ -z $TMUX ] && exec tmux
else
	echo "tmux is not installed\nrun ./deploy to configure dependencies"
fi
echo "Updating configuration..."
(cd $HOME/dotfiles && git pull && git submodule update --init --recursive)
source $HOME/dotfiles/zsh/zshrc.sh > /dev/null

