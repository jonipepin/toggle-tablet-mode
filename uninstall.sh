#!/bin/bash

if [ $EUID -ne 0 ]; then
    echo "$0 is not running as root. Try using sudo."
    exit 2
fi

rm -Rf /opt/toggle_tablet_mode

rm /usr/local/share/applications/tablet_mode.desktop

FAVORITES=$(gsettings get org.gnome.shell favorite-apps | sed "s/,*\s*'tablet_mode.desktop'//")

gsettings set org.gnome.shell favorite-apps "$FAVORITES"
