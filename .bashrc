# Omarchy environment (OMARCHY_PATH + PATH), needed even for non-interactive shells
[[ -r /usr/share/omarchy/default/bash/env-bootstrap ]] && source /usr/share/omarchy/default/bash/env-bootstrap

# If not running interactively, don't do anything else (leave this above the rc source)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source "$OMARCHY_PATH/default/bash/rc"

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'

# Dotfiles bare repo alias (see ~/.configs)
alias config='/usr/bin/git --git-dir=$HOME/.configs/ --work-tree=$HOME'

# Git shortcuts
alias gs='git status'
alias gbc='git checkout -b'

# Persistent ssh-agent across terminals, loading the default key
SSH_ENV="$HOME/.ssh/agent-environment"
_start_ssh_agent() {
	ssh-agent | sed 's/^echo/#echo/' >"$SSH_ENV"
	chmod 600 "$SSH_ENV"
	source "$SSH_ENV" >/dev/null
	ssh-add ~/.ssh/id_ed25519 2>/dev/null
}
if [[ -f "$SSH_ENV" ]]; then
	source "$SSH_ENV" >/dev/null
	kill -0 "$SSH_AGENT_PID" 2>/dev/null || _start_ssh_agent
else
	_start_ssh_agent
fi

# Ring the terminal bell after a command that ran >= BELL_DURATION seconds,
# skipping commands you're already watching interactively (like zbell did in
# oh-my-zsh).
BELL_DURATION=10
BELL_IGNORE=" vi vim less bat man ssh tmux nvim mysql psql top htop "
_BELL_LAST_SECONDS=$SECONDS
_bell_precmd() {
	local elapsed=$((SECONDS - _BELL_LAST_SECONDS))
	_BELL_LAST_SECONDS=$SECONDS
	((elapsed >= BELL_DURATION)) || return
	local _ cmd_name
	read -r _ cmd_name _ <<<"$(history 1)"
	[[ "$BELL_IGNORE" == *" $cmd_name "* ]] && return
	printf '\a'
}
PROMPT_COMMAND="_bell_precmd${PROMPT_COMMAND:+; $PROMPT_COMMAND}"
