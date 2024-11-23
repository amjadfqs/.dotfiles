# autostart X
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi

# vim: ft=zsh sw=2 ts=2 et
