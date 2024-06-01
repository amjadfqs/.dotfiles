# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# Go language setup
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export PATH="$PATH:$GOBIN"

# Android development environment setup
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools

# Flutter and Chrome
export PATH=$PATH:/opt/flutter/bin
export CHROME_EXECUTABLE=/usr/bin/google-chrome-stable

# Java Home
# export JAVA_HOME=/usr/lib/jvm/java-11-openjdk
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk

# Node Version Manager (NVM) and Node.js
export NVM_DIR="$HOME/.nvm"
export PATH="$HOME/.nvm/versions/node/v20.10.0/bin:$PATH"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh" --no-use

# Brew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# pnpm
export PNPM_HOME="/home/amjad/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Bob
export PATH="/home/amjad/.local/share/bob/nvim-bin:$PATH"

# Aliases
alias vm=nvim
alias c="clear"
alias q="exit"
alias e="nvim -n ~/ ~/.zshrc ~/.aliases ~/.colors ~/.hooks"
alias r="source ~/.zshrc"
alias h="history -10"
alias hc="history -c"
alias hg="history | grep"
alias lg="lazygit"
alias ld="lazydocker"

# Netwokr Manager Aliases
alias lnet='nmcli device wifi list'
alias con='nmcli device wifi connect'
alias discon='nmcli device disconnect'


# find files function
cf() {
    local search_pattern="${1:-.}"
    local search_depth="${2:-2}"
    local dir=$(fd "$search_pattern" --type d --max-depth "$search_depth" ~/Desktop/Work | fzf --prompt "Choose a directory: " --border)
    if [ -n "$dir" ]; then
        cd "$dir" || return 1
    fi
}
zle -N cf-widget cf
bindkey '^f' cf-widget

# Plugins
plugins=(
         git 
         extract 
         web-search 
         git-extras 
         zsh-autosuggestions 
         zsh-syntax-highlighting 
         zsh-completions
       )

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}'

source $ZSH/oh-my-zsh.sh

# lsd
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

# Starship prompt
eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"

