#!/usr/bin/env bash
read -r -d '' SCRIPT <<END
tell application "System Events"
    tell process "TIDAL"
        set menuItems to name of menu items of menu "Window" of menu bar 1
        set lastMenuItem to item -1 of menuItems
    end tell
end tell

return lastMenuItem as string
END
osascript -e "$(printf "${SCRIPT}")"
