## Marty's Dotfiles, etc.

Install these files on new host:

  prerequisite: git
  neither: $HOME/.configs nor $HOME/config

```
cd $HOME
echo ".configs" >> .gitignore
git clone --bare https://github.com/Marty333/configs.git $HOME/.configs
alias config='/usr/bin/git --git-dir=$HOME/.configs/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
config checkout
```

- If desired, run `config/work/setup-shell.sh`
