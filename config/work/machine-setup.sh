
#TODO: Set package manager automatically?

PKG_MANAGER='apt-get'
$PKG_MANAGER update && $PKG_MANAGER install -y \
	alien\
	git\
	zsh\
	htop\
	curl\
	vim\
	wget\
	bat\
	exa\
	neofetch\
	python3\
	fzf\
	silversearcher-ag\
	zoxide

# Install Oracle client:
cd /tmp
wget -q http://victoria.invitrogen.com/software/oracle/oracle-instantclient19.5-basic-19.5.0.0.0-1.x86_64.rpm
wget -q http://victoria.invitrogen.com/software/oracle/oracle-instantclient19.5-devel-19.5.0.0.0-1.x86_64.rpm
alien -i --scripts /tmp/oracle-instantclient19.5-basic-19.5.0.0.0-1.x86_64.rpm
alien -i --scripts /tmp/oracle-instantclient19.5-devel-19.5.0.0.0-1.x86_64.rpm

# Add my userID:
useradd sherrimn
mkdir /home/sherrimn
chown sherrimn /home/sherrimn

echo "Please create a password for user sherrimn:"
passwd sherrimn

# Show where we are:
neofetch
