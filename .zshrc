
echo "Starting .zshrc..."
export TERM=xterm-256color

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#set -o verbose
#
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
#export PATH="$HOME/bin:$HOME/.local/bin:$HOME/bin/nodejs:$PATH"
export PATH="$HOME/bin:$HOME/.local/bin:$HOME/bin/diff-so-fancy:$PATH"

# Path to your oh-my-zsh installation.
#export ZSH="/mnt/c/Users/sherrimn/.oh-my-zsh"
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="agnoster"
ZSH_THEME="powerlevel10k/powerlevel10k"
#ZSH_THEME="bullet-train"
#ZSH_THEME="marty"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git
	fzf
	zsh-autosuggestions
	sudo
	zbell
	dirhistory
	jsontools
	ssh-agent
        zoxide)
#plugins=(git history-substring-search)

ZSH_DISABLE_COMPFIX="true"

zbell_duration=10
zbell_ignore="vi vim less batcat ssh ssd ssq mdev mqa mprod"

# Set ssh credentials:
#zstyle :omz:plugins:ssh-agent identities marty-github-2022 id_ed25519 id_rsa
zstyle :omz:plugins:ssh-agent identities marty-github-2022
#zstyle :omz:plugins:ssh-agent agent-forwarding yes

source $ZSH/oh-my-zsh.sh

export SHELL=/usr/bin/zsh
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias cd=z
#alias ls='ls -a --color=auto'
alias ls='exa -aG -I .git --group-directories-first'
alias ls='lsd -a -I .git --group-directories-first'
#alias ll='ls -latr'
alias ll='exa -las changed -I .git --group-directories-first'
alias ll='lsd -latr -I .git --group-directories-first'
alias gs='git status'
#alias gbc='git checkout -b '
alias gbc=gcb
unalias gcb

#alias gg='grep -r --exclude-dir=node_modules --exclude-dir=dist'
alias gg='ag --hidden'
alias vi=vim
alias t0='tmux attach-session -t 0'
alias bfg='java -jar ~/bin/bfg-1.13.0.jar'

alias cat='batcat --paging=never'
alias fd=fdfind
alias less='batcat'

alias diff=$HOME/bin/diff

alias k=kubectl

# Dotfiles bare repo alias:
alias config='/usr/bin/git --git-dir=$HOME/.configs/ --work-tree=$HOME'
source ~/.private_alias

export DOCKER_HOST="tcp://localhost:2375"
export DISPLAY=:0

export GTK_THEME=Adwaita:dark

#echo "Skipping NVM setup"
#echo "Running NVM setup"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#source /mnt/c/Users/sherrimn/.rvm/scripts/rvm

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
#export PATH="$PATH:$HOME/.rvm/bin"

export PATH="$PATH:/mnt/c/Users/sherrimn/bin/"

source ~/.start-docker.sh

cd $HOME

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
