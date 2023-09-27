
#TODO: Set package manager automatically

PKG_MANAGER='apt-get'
$PKG_MANAGER update && $PKG_MANAGER install -y \
	git\
	zsh\
	htop\
	curl\
	wget\
	bat\
	fzf

# install oh-my-zsh
# install powerlevel10k
