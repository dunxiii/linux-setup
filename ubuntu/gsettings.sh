#!/usr/bin/env bash

# To get settings: gsettings list-recursively

set -au

# Customize built in dash-to-dock (only ubuntu)
gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-shrink true
gsettings set org.gnome.shell.extensions.dash-to-dock running-indicator-style 'DASHES'
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height true
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed true
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 40

# Misc gnome settings
gsettings set org.gnome.desktop.calendar show-weekdate true
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'

# Touchpad / Touchscreen
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll false
gsettings set org.gnome.settings-daemon.peripherals.touchscreen orientation-lock true

# Notifications
gsettings set org.gnome.desktop.notifications show-in-lock-screen false

## Nautilus
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'
gsettings set org.gtk.Settings.FileChooser sort-directories-first true

## Power settings
gsettings set org.gnome.desktop.session idle-delay 'uint32 900' # 15min untill screen blanks
