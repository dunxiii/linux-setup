#!/usr/bin/env bash

# To get settings: gsettings list-recursively

set -au

# Theme
#gsettings set org.gnome.desktop.interface icon-theme 'Adwaita'
#gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita'
#gsettings set org.gnome.desktop.interface cursor-theme 'Adwaita'
#gsettings set org.gnome.desktop.sound theme-name 'freedesktop'

# Customize built in dash-to-dock (only ubuntu)
gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-shrink true
gsettings set org.gnome.shell.extensions.dash-to-dock running-indicator-style 'DASHES'
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height true
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed true
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 40

# Misc gnome settings
gsettings set org.gnome.desktop.calendar show-weekdate true
gsettings set org.gnome.desktop.interface show-battery-percentage true
#gsettings set org.gnome.shell favorite-apps "['org.gnome.Terminal.desktop', 'org.gnome.Nautilus.desktop', 'chromium-browser.desktop', 'firefox.desktop', 'spotify_spotify.desktop', 'code.desktop', 'org.gnome.Calculator.desktop', 'org.remmina.Remmina.desktop', 'nextcloud.desktop', 'virt-manager.desktop']"
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 38
gsettings set org.gnome.shell.extensions.desktop-icons show-home false
gsettings set org.gnome.shell.extensions.desktop-icons show-trash false
gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'

# Touchpad / Touchscreen
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll false
gsettings set org.gnome.settings-daemon.peripherals.touchscreen orientation-lock true

# Notifications
gsettings set org.gnome.desktop.notifications show-in-lock-screen false

## GNOME Terminal
gsettings set org.gnome.Terminal.Legacy.Settings default-show-menubar false

## Nautilus
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'

## Power settings
gsettings set org.gnome.desktop.session idle-delay 'uint32 900' # 15min untill screen blanks
