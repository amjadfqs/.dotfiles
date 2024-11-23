# default permissions
umask 027

# load antidote
zstyle ':antidote:bundle' file $ZDOTDIR/plugins.txt
source $ZDOTDIR/antidote/antidote.zsh && antidote load

# source configuration files
source $ZDOTDIR/env.zsh
source $ZDOTDIR/config.zsh
source $ZDOTDIR/aliases.zsh

# Starship prompt
eval "$(starship init zsh)"
# zoxide as cd
eval "$(zoxide init --cmd cd zsh)"
# eval "$(zoxide init zsh)"

# fortune cookies
# fortune 2>/dev/null || true

# vim: ft=zsh sw=2 ts=2 et
. "/home/amjad/.deno/env"