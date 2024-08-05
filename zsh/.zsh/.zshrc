
zstyle ':antidote:bundle' file $ZDOTDIR/.zsh_plugins.txt
source $ZDOTDIR/antidote/antidote.zsh && antidote load

antidote load

# source configuration files
source $ZDOTDIR/env.zsh
source $ZDOTDIR/config.zsh
source $ZDOTDIR/aliases.zsh

# find files function
cf() {
    local search_pattern="${1:-.}"
    local search_depth="${2:-3}"
    local dir=$(fd "$search_pattern" --type d --max-depth "$search_depth" ~/Work | fzf --prompt "Choose a directory: " --border)
    if [ -n "$dir" ]; then
        cd "$dir" || return 1
    fi
}
zle -N cf-widget cf
bindkey '^f' cf-widget
# Starship prompt
eval "$(starship init zsh)"
# zoxide as cd
eval "$(zoxide init --cmd cd zsh)"
# eval "$(zoxide init zsh)"

