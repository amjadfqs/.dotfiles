#!/bin/bash
# original source: https://gitlab.com/Nmoleo/i3-volume-brightness-indicator

# See README.md for usage instructions
bar_color="#7f7fff"
volume_step=1
brightness_step=2.5
max_volume=100

# Uses regex to get volume from wpctl
function get_volume {
  wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}'
}

# Uses wpctl to get mute status
function get_mute {
  wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q "MUTED"
  echo $?
}

# Uses regex to get brightness from xbacklight
function get_brightness {
  xbacklight -get
}

# Returns a mute icon, a volume-low icon, or a volume-high icon, depending on the volume
function get_volume_icon {
  volume=$(get_volume)
  mute=$(get_mute)
  if [ "$volume" -eq 0 ] || [ "$mute" -eq 0 ]; then
    volume_icon=""
  elif [ "$volume" -lt 50 ]; then
    volume_icon=""
  else
    volume_icon=""
  fi
}

# Always returns the same icon - I couldn't get the brightness-low icon to work with fontawesome
function get_brightness_icon {
  brightness_icon=""
}

# Displays a volume notification using dunstify
function show_volume_notif {
  volume=$(get_volume)
  get_volume_icon
  dunstify -i audio-volume-muted-blocking -t 1000 -r 2593 -u normal "$volume_icon   $volume%" -h int:value:$volume -h string:hlcolor:$bar_color
}

# Displays a brightness notification using dunstify
function show_brightness_notif {
  brightness=$(get_brightness)
  get_brightness_icon
  dunstify -i $brightness_icon -t 1000 -r 2593 -u normal "$brightness_icon   $brightness%" -h int:value:$brightness -h string:hlcolor:$bar_color
}

# Main function - Takes user input, "volume_up", "volume_down", "brightness_up", or "brightness_down"
case $1 in
volume_up)
  # Unmutes and increases volume, then displays the notification
  wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
  volume=$(get_volume)
  if [ $(("$volume" + "$volume_step")) -gt $max_volume ]; then
    wpctl set-volume @DEFAULT_AUDIO_SINK@ $max_volume%
  else
    wpctl set-volume @DEFAULT_AUDIO_SINK@ $volume_step%+
  fi
  show_volume_notif
  ;;

volume_down)
  # Decreases volume and displays the notification
  wpctl set-volume @DEFAULT_AUDIO_SINK@ $volume_step%-
  show_volume_notif
  ;;

volume_mute)
  # Toggles mute and displays the notification
  wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
  show_volume_notif
  ;;

brightness_up)
  # Increases brightness and displays the notification
  xbacklight -inc $brightness_step
  show_brightness_notif
  ;;

brightness_down)
  # Decreases brightness and displays the notification
  xbacklight -dec $brightness_step -time 0
  show_brightness_notif
  ;;
esac
