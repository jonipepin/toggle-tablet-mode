#!/bin/bash
sudo mkdir /opt/toggle_tablet_mode
sudo mkdir /opt/toggle_tablet_mode/bin
sudo mkdir /opt/toggle_tablet_mode/include

sudo cp rotate_screen.sh /opt/toggle_tablet_mode/bin/
sudo cp touchscreen.png /opt/toggle_tablet_mode/include/
sudo cp touchscreen_blue.png /opt/toggle_tablet_mode/include/
sudo cp rotate_tablet.png /opt/toggle_tablet_mode/include/
sudo cp tablet_mode.desktop /usr/local/share/applications/

gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | sed s/.$//), 'tablet_mode.desktop']"

