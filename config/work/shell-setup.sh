

export TERM=xterm-256color
# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# install powerlevel10 theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k

# Move default .zshrc out of the way:
mv ~/.zshrc ~/.zshrc-stock

# install our own dotfiles:
cd $HOME
echo ".configs" >> .gitignore
git clone --bare https://github.com/Marty333/configs.git $HOME/.configs
alias config='/usr/bin/git --git-dir=$HOME/.configs/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
config checkout

# reload
exec zsh
