#!/bin/bash
#input-tablet
FILE=~/.local/share/toggle_tablet_mode/current_orientation
ORIENTATION=$(cat $FILE)

KEYBOARD_ID=$(xinput list | grep 'AT Translated Set 2 keyboard' | cut -f 2 | cut -d = -f 2)
TOUCHPAD_ID=$(xinput list | grep 'Touchpad' | cut -f 2 | cut -d = -f 2)

if [ $ORIENTATION = "left" ]; then
  echo "inverted" > $FILE
  xrandr -o inverted
  gsettings set org.gnome.shell.extensions.dash-to-dock dock-position LEFT
  
#elif [ $ORIENTATION = "inverted" ]; then
#  echo "right" > $FILE
#  xrandr -o right
#  gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM

elif [ $ORIENTATION = "inverted" ]; then
  echo "normal" > $FILE
  xrandr -o normal
  gsettings set org.gnome.shell.extensions.dash-to-dock dock-position LEFT
  xinput enable $KEYBOARD_ID
  xinput enable $TOUCHPAD_ID
  notify-send --urgency low -i ~/.local/share/toggle_tablet_mode/touchscreen.png "Disabling Tablet Mode..." "OFF - Tablet mode disabled"
  
else
  echo "left" > $FILE
  xrandr -o left
  gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
  xinput disable $KEYBOARD_ID
  xinput disable $TOUCHPAD_ID
  notify-send --urgency low -i ~/.local/share/toggle_tablet_mode/touchscreen_blue.png "Enabling Tablet Mode..." "ON - Tablet mode enabled"
fi  


