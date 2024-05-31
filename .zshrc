# Path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# History configuration
export HISTFILE=~/.zsh_history
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
export SAVEHIST=1000000000
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
export HISTTIMEFORMAT="[%F %T] "

# Theme and plugins
ZSH_THEME="agnoster" # More visually informative theme
DISABLE_UPDATE_PROMPT="true"

plugins=(git command-not-found fzf zsh-syntax-highlighting zsh-autosuggestions copypath copyfile zsh-nvm)

# Source oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Zsh syntax highlighting
ZSH_HIGHLIGHT_STYLES[globbing]='none'

# fzf configuration
if [[ $OSTYPE == 'darwin'* ]]; then
  export FZF_BASE=$(brew --prefix)/opt/fzf/install
fi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Aliases
alias nv="nvim"
alias hidegit="git config --add oh-my-zsh.hide-status 1 && git config --add oh-my-zsh.hide-dirty 1"
alias ll="ls -lah"
alias gs="git status"
alias gp="git pull"
alias gc="git commit"
alias gl="git log --oneline --graph --decorate"

# Enhanced path configuration
export PATH=/usr/local/smlnj/bin:$PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH

# NVM Lazy Load
export NVM_LAZY_LOAD=true

# Docker and Kubernetes Aliases
alias dk="docker"
alias dkc="docker-compose"
alias k="kubectl"
alias kc="kubectl config"
alias kns="kubectl config set-context --current --namespace"

# Prompt customization
autoload -Uz promptinit
promptinit
prompt agnoster

# Auto-update Oh-My-Zsh
zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 7  # In days

# Performance optimization
zstyle ':completion:*' rehash true
zstyle ':completion:*' menu select

# Disable case sensitivity for tab completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Enable auto cd
setopt AUTO_CD

# More intuitive globbing
setopt extended_glob

# Enable command auto-correction
setopt correct

# Faster startup for large git repositories
GIT_CONFIG_COUNT=$(git config --list 2>/dev/null | wc -l)
if [ $GIT_CONFIG_COUNT -gt 200 ]; then
  export DISABLE_GIT_CONFIG=true
fi
