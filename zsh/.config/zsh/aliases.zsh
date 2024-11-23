# ls
alias ls="exa"
alias ll='ls -lh'
alias la='ls -lah'
alias ldot='ls -ld .*'

# tar
alias tarls="tar -tvf"
alias untar="tar -xf"

# url encode/decode
alias urldecode='python3 -c "import sys, urllib.parse as ul; print(ul.unquote_plus(sys.argv[1]))"'
alias urlencode='python3 -c "import sys, urllib.parse as ul; print (ul.quote_plus(sys.argv[1]))"'

# html encode/decode
alias htmldecode="perl -MHTML::Entities -pe 'decode_entities($_);"
alias htmldecode="perl -MHTML::Entities -pe 'decode_entities($_);"

# borderless apps
alias tx="borderless tmux"
alias nv="borderless nvim"

# mpd/ncmpcpp
alias ncmpcpp="MPD_HOST=$HOME/.local/share/mpd/socket ncmpcpp"

# fzf
alias f=fzf

# emulator
alias emulator='$ANDROID_SDK_ROOT/emulator/emulator'

alias lg="lazygit"
alias ld="lazydocker"
alias air='$(go env GOPATH)/bin/air'

alias code="$HOME/.local/zed.app/libexec/zed-editor &"

# vim: ft=zsh sw=2 ts=2 et
