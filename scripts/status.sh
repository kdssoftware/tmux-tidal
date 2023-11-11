#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/helpers.sh"

playing_icon=""
paused_icon=""
stopped_icon=""

playing_default="▶︎"
paused_default="■"

music_status() {
read -r -d '' SCRIPT <<END
tell application "System Events"
    tell process "TIDAL"
        if name of menu item 1 of menu "Playback" of menu bar 1 is "Play" then
            return "paused" as string
        else
            return "playing" as string
        end if
    end tell
end tell
END

osascript -e "${SCRIPT}"
}

print_music_status() {
  local status=$(music_status)

  if [[ "$status" == "playing" ]]; then
    echo "${playing_icon}"
  elif [[ "$status" == "paused" ]]; then
    echo "${paused_icon}"
  else
    echo "${stopped_icon:-$paused_icon}"
  fi
}

update_status_icon() {
  playing_icon=$(get_tmux_option "@tidal_playing_icon" "$playing_default")
  paused_icon=$(get_tmux_option "@tidal_paused_icon" "$paused_default")
  stopped_icon=$(get_tmux_option "@tidal_stopped_icon" "$paused_default")
}

main() {
  update_status_icon
  print_music_status
}

main


