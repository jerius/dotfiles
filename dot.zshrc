# Path to your oh-my-zsh installation.
export ZSH=/Users/jerius/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
#ZSH_THEME="bullet-train"
#ZSH_THEME="agnoster"
DEFAULT_USER="jerius"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git history per-directory-history)

# User configuration

source $ZSH/oh-my-zsh.sh

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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

## From my bash_profile

#export PS1="jerius \w: "
#export PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#I_#P") "$PWD")'

# Highlighting for ls
#export CLICOLOR=cons25
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
LS_OPTIONS='--color=auto'

export TERM=xterm-256color
alias tmux="tmux -2"
#alias bash="/usr/local/Cellar/bash/4.2.39/bin/bash"

# System Aliases
alias ll='ls -lah'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias lll='ls -l | less'
alias vi='vim'

alias freebase='git stash; git pull --rebase && git stash pop'

# Virtualenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# Homebrew
export HOMEBREW_GITHUB_API_TOKEN="<token>"
export HOMEBREW_NO_AUTO_UPDATE=1

# Rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Update Vim plugins / syntax checkers
alias update_vim_plugins='for i in ~/.vim/bundle/*; do git -C $i pull; done'

# Update homebrew
alias update_homebrew='brew update && brew upgrade && brew cleanup'

alias update_pip_pkg='pip3 install powerline-status'

# All da updates together
alias run_all_updates='update_vim_plugins ; update_homebrew ; update_pip_pkg'

# Bash history
export HISTFILESIZE=30000

# Fix apple display camera
alias fix_display_camera='sudo killall VDCAssistant'

# Restart bluetooth
alias fix_bluetooth='sudo kextunload -b com.apple.iokit.BroadcomBluetoothHostControllerUSBTransport ; sudo kextload -b com.apple.iokit.BroadcomBluetoothHostControllerUSBTransport'

# Fix gestures/app switching
alias fix_gestures_and_app_switching='killall Dock'

#### GIT ####
alias gitcleanup='git branch --merged | egrep -v "(^\*|master)" | xargs git branch -d'
alias oldbranches='git branch -rvv --format="%(committerdate:iso8601), %(committerdate:relative) - %(refname:short)" | sort | grep -v HEAD | grep -v master'

#### DOCKER ####
export VAULT_ADDR='http://0.0.0.0:8200'

# AWS CLI
export PATH=~/Library/Python/3.7/bin:$PATH

# AWS Fuzzy Finder
export AWS_FUZZ_USER="ubuntu"
export AWS_FUZZ_PRIVATE_IP='true'
alias aws-fuzzy='aws-mfa aws-fuzzy'

# Golang
export GOPATH=$HOME/gopath
export PATH=$GOPATH:$GOPATH/bin:$PATH

# 1password
alias oplogin='op signin <vault-name> | grep export > ~/.1passwordcli ; source ~/.zshrc'
alias oploginsession='eval $(op signin <vault-name>)'
alias opawstotp='op get totp "AWS"'
source ~/.1passwordcli

# aws-vault
export AWS_ASSUME_ROLE_TTL="8h"
export AWS_SESSION_TTL="8h"
alias aws-mfa='aws-vault exec -m $(opawstotp) <key-name> -- '
AWS_VAULT_KEYCHAIN_NAME=login
export AWS_DEFAULT_REGION='us-west-2'

fpath=(~/.zsh/completions $fpath)
autoload -U compinit && compinit

#### ZSH COMPLETIONS ####
export PATH="/usr/local/share/zsh/site-functions:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform
