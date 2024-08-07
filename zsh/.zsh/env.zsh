HISTFILE=$HOME/.zsh/history

# Browser
export BROWSER=/usr/bin/microsoft-edge-stable
# go
export GOROOT="/usr/local/go/bin"
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$GOROOT/bin:$PATH"

# Android development environment setup
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools

# dotnet tools
export PATH="$PATH:$HOME/.dotnet/tools"

# Flutter and Chrome
export PATH=$PATH:/opt/flutter/bin
export CHROME_EXECUTABLE=/usr/bin/google-chrome-stable

# Java Home
# export JAVA_HOME=/usr/lib/jvm/java-11-openjdk
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk

# Node Version Manager (NVM) and Node.js
export NVM_DIR="$HOME/.nvm"
export PATH="$HOME/.nvm/versions/node/v20.15.0/bin:$PATH"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh" --no-use

# Brew
# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# pnpm
export PNPM_HOME="/home/amjad/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Bob
export PATH="/home/amjad/.local/share/bob/nvim-bin:$PATH"

# Ruby
export GEM_HOME="$(gem env user_gemhome)"
export PATH="$PATH:$GEM_HOME/bin"
