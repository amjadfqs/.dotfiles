########## options ##########

# general
setopt extended_glob
setopt auto_cd

# alarm
setopt no_beep
setopt no_hist_beep

# copmletion
setopt menu_complete
setopt auto_list
setopt complete_in_word

# history
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt append_history
setopt share_history
setopt hist_verify

########## modules ##########

zmodload zsh/complist
autoload -Uz compinit && compinit
autoload -Uz promptinit && promptinit
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search

########## style ##########

# completion
zstyle ':completion:*' completer _extensions _complete
zstyle ':completion:*' complete true
# menu
zstyle ':completion:*' menu select
zstyle ':completion:*' complete-options true
zstyle ':completion:*' file-sort modification
## caching
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"
## formatting
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}-- %D %d --%f'
zstyle ':completion:*:*:*:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:*:*:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*:*:*:*:default' list-colors ${(s.:.)LS_COLORS}
## grouping
zstyle ':completion:*' group-name ''
zstyle ':completion:*:*:-command-:*:*' group-order aliases builtins functions commands
## matching (see ZSHCOMPWID "completion matching control")
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' keep-prefix true

########## key bindings ##########

# zsh vi mode
bindkey -v
ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT

# substring search
bindkey -M vicmd '?' history-substring-search-up
bindkey -M vicmd '/' history-substring-search-down

# load widgets
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

## history
bindkey "^F" history-incremental-search-forward
bindkey "^R" history-incremental-search-backward
bindkey "^P" history-search-backward
bindkey "^N" history-search-forward
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward
bindkey -M viins '^R' history-incremental-pattern-search-backward
bindkey -M viins '^F' history-incremental-pattern-search-forward

## completion
bindkey "^[OA" up-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search
bindkey "^P"  up-line-or-beginning-search
bindkey "^N"   down-line-or-beginning-search
bindkey -M menuselect '^[[Z' reverse-menu-complete
