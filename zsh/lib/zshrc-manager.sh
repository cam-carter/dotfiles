time_out () { perl -e 'alarm shift; exec @ARGV' "$@"; }

# if command -v tmux>/dev/null; then
# 	[ -z $TMUX ] && exec tmux
# else
# 	echo "tmux is not installed\nrun ./deploy to configure dependencies"
# fi
# if ping -q -c 1 -W 1 google.com > /dev/null 2>&1; then
# 	echo "Updating configuration..."
# 	(cd $HOME/dotfiles && git pull && git submodule update --init --recursive)
# else
#   echo "The network is down... \nskipping update."
# fi
source $HOME/dotfiles/zsh/zshrc.sh > /dev/null
