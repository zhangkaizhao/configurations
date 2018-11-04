#!/usr/bin/env bash

echo "Launcher | iconName=starred"
echo "---"

WIKIPEDIA_ICON=$(curl -s "https://en.wikipedia.org/static/favicon/wikipedia.ico" | base64 -w 0)
echo "Wikipedia | image='$WIKIPEDIA_ICON' imageWidth=20 font=serif href='https://en.wikipedia.org'"

echo "---"
echo "Gedit | iconName=gedit bash=gedit terminal=false"
echo "Nautilus | iconName=system-file-manager bash=nautilus terminal=false"
echo "Process list (<span color='yellow'><tt>top</tt></span>) | iconName=utilities-terminal-symbolic bash=top"
echo "---"
echo "Looking Glass | eval='imports.ui.main.createLookingGlass(); imports.ui.main.lookingGlass.toggle();'"
