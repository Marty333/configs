
#TODO: Set package manager automatically?

PKG_MANAGER='apt-get'
$PKG_MANAGER update && $PKG_MANAGER install -y \
	git\
	zsh\
	htop\
	curl\
	wget\
	bat\
	exa\
	neofetch\
	python3\
	fzf\
	zoxide

echo "Please create a password for user sherrimn:"
passwd sherrimn

# Show where we are:
neofetch
