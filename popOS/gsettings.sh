#!/usr/bin/env bash

# To get settings: gsettings list-recursively

set -au
# Misc gnome settings
gsettings set org.gnome.desktop.calendar show-weekdate true
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.interface icon-theme 'Humanity'
#gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'
gsettings set org.gnome.desktop.interface clock-format '24h'
#gsettings set org.gnome.shell favorite-apps "['org.gnome.Terminal.desktop', 'org.gnome.Nautilus.desktop', 'chromium-browser.desktop', 'firefox.desktop', 'spotify_spotify.desktop', 'code.desktop', 'org.gnome.Calculator.desktop', 'org.remmina.Remmina.desktop', 'nextcloud.desktop', 'virt-manager.desktop']"

## Nautilus
gsettings set org.gtk.Settings.FileChooser sort-directories-first true
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'

## Power settings
gsettings set org.gnome.desktop.session idle-delay 'uint32 900' # 15min untill screen blanks
