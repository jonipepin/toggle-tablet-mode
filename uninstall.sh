#!/bin/bash
sudo rm -Rf /opt/toggle_tablet_mode

sudo rm /usr/local/share/applications/tablet_mode.desktop

FAVORITES=$(gsettings get org.gnome.shell favorite-apps | sed "s/,*\s*'tablet_mode.desktop'//")

gsettings set org.gnome.shell favorite-apps "$FAVORITES"
