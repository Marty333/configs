
#TODO: Set package manager automatically?

PKG_MANAGER='apt-get'
$PKG_MANAGER update && $PKG_MANAGER install -y \
	git\
	zsh\
	htop\
	curl\
	wget\
	bat\
	neofetch\
	fzf

passwd sherrimn

# Show where we are:
neofetch
