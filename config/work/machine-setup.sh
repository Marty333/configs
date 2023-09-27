
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
	silversearcher-ag\
	zoxide

# Add my userID:
useradd sherrimn
mkdir /home/sherrimn
chown sherrimn /home/sherrimn

echo "Please create a password for user sherrimn:"
passwd sherrimn

# Show where we are:
neofetch
