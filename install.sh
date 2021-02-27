#!/bin/bash

if [ $EUID -ne 0 ]; then
    echo "$0 is not running as root. Try using sudo."
    exit 2
fi

mkdir /opt/toggle_tablet_mode
mkdir /opt/toggle_tablet_mode/bin
mkdir /opt/toggle_tablet_mode/include

cp rotate_screen.sh /opt/toggle_tablet_mode/bin/
cp touchscreen.png /opt/toggle_tablet_mode/include/
cp touchscreen_blue.png /opt/toggle_tablet_mode/include/
cp rotate_tablet.png /opt/toggle_tablet_mode/include/
cp tablet_mode.desktop /usr/local/share/applications/

gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | sed s/.$//), 'tablet_mode.desktop']"

