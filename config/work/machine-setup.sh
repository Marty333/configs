
#TODO: Set package manager automatically?

if command -v pacman >/dev/null 2>&1; then
	PKG_MANAGER='pacman'
elif command -v apt-get >/dev/null 2>&1; then
	PKG_MANAGER='apt-get'
else
	echo "No supported package manager found (pacman/apt-get); edit machine-setup.sh for this distro." >&2
	exit 1
fi

case "$PKG_MANAGER" in
pacman)
	# Arch / Omarchy
	pacman -Syu --needed --noconfirm \
		bind\
		git\
		zsh\
		htop\
		curl\
		vim\
		wget\
		bat\
		lsd\
		fastfetch\
		python\
		fzf\
		the_silver_searcher\
		zoxide\
		inetutils

	# telnet client isn't in the Arch official repos; install from AUR if wanted:
	# yay -S --needed telnet
	;;
apt-get)
	# Debian / Ubuntu
	$PKG_MANAGER update && $PKG_MANAGER install -y \
		alien\
		dnsutils\
		git\
		zsh\
		htop\
		curl\
		vim\
		wget\
		bat\
		lsd\
		fastfetch\
		python3\
		telnet\
		fzf\
		silversearcher-ag\
		zoxide

	# Install Oracle client:
	#cd /tmp
	#wget -q http://victoria.invitrogen.com/software/oracle/oracle-instantclient19.5-basic-19.5.0.0.0-1.x86_64.rpm
	#wget -q http://victoria.invitrogen.com/software/oracle/oracle-instantclient19.5-devel-19.5.0.0.0-1.x86_64.rpm
	#alien -i --scripts /tmp/oracle-instantclient19.5-basic-19.5.0.0.0-1.x86_64.rpm
	#alien -i --scripts /tmp/oracle-instantclient19.5-devel-19.5.0.0.0-1.x86_64.rpm

	# Add my userID:
	useradd sherrimn

	# Set UID to match old servers:
	sed -i -e "s/sherrimn:x:1000:1000:/sherrimn:x:5078:100:sherrimn/" /etc/passwd

	mkdir /home/sherrimn
	chown sherrimn /home/sherrimn

	echo "Please create a password for user sherrimn:"
	passwd sherrimn
	;;
esac

# Show where we are:
fastfetch
