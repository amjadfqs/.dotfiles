# globals
typeset -U path PATH
typeset -g -A key

# zsh options
export KEYTIMEOUT=1
export ZLS_COLORS=$LS_COLORS

# locale
export LANG="${LANG:-en_US.UTF-8}"

# Theme
export GTK_THEME=Orchis-Dark-Compact

# XDG paths
export XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR:/run/user/$UID}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_STATE_HOME=${XDG_STATE_HOME:-$HOME/.local/state}

# void packages
export XBPS_DISTDIR=$HOME/.void-packages

# zsh init path
export ZDOTDIR=${ZDOTDIR:-${XDG_CONFIG_HOME}/zsh}

# apps
export EDITOR="${EDITOR:-nvim}"
export VISUAL="${VISUAL:-nvim}"
export PAGER="${PAGER:-less}"
export LESS="${LESS:--g -i -M -R -S -w -z-4}"

# runsvdir
export SVDIR="$HOME/.local/service"

# go
export GOROOT="/usr/lib/go"
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"

# rust
export CARGO_HOME="$HOME/.cargo"
export CARGO_TARGET_DIR=$CARGO_HOME/target

export NVM_DIR="$HOME/.local/share/nvm"
export PATH="$HOME/.local/share/nvm/versions/node/v22.6.0/bin:$PATH"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh" --no-use

# pure prompt
export PURE_CMD_MAX_EXEC_TIME=10
export PURE_GIT_PULL=0

# path
path=(
  # system binaries
  /bin
  /sbin
  /usr/bin
  /usr/sbin

  # local paths
  $HOME/.local/{sbin,bin{,/platform-tools},scripts,share/bob/nvim-bin}

  # rust paths
  $CARGO_HOME/bin

  # go
  $GOROOT/bin
  $GOBIN

  # node
  $NODE_HOME/bin

  # original path value
  $path
)

# functions path
fpath=($HOME/.config/zsh/comp $fpath)

# keys
key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

# vim: ft=zsh sw=2 ts=2 et
