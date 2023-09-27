## Marty's Dotfiles, etc.

To install these files on new host:
*Note that this requires a few back-and-forth between root and user...*

  prerequisite: git
  neither: $HOME/.configs nor $HOME/config
Run this as root:
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Marty333/configs/main/config/work/machine-setup.sh)"
```

Run this as regular user (sherrimn) to clone this repo:
```
cd $HOME
echo ".configs" >> .gitignore
git clone --bare https://github.com/Marty333/configs.git $HOME/.configs
alias config='/usr/bin/git --git-dir=$HOME/.configs/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
config checkout
```

Then again as regular user:
`sh /home/sherrimn/config/work/shell-setup.sh`
