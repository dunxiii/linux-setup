#!/usr/bin/env bash

# To get settings: gsettings list-recursively

set -au

# Misc gnome settings
#gsettings set org.gnome.desktop.calendar show-weekdate true
#gsettings set org.gnome.desktop.interface clock-show-date true
#gsettings set org.gnome.desktop.interface show-battery-percentage true
#gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'
#gsettings set org.gnome.system.locale region 'sv_SE.UTF-8'
#gsettings set org.gnome.shell favorite-apps "['org.gnome.Terminal.desktop', 'org.gnome.Nautilus.desktop', 'chromium-browser.desktop', 'firefox.desktop', 'spotify_spotify.desktop', 'code.desktop', 'org.gnome.Calculator.desktop', 'org.remmina.Remmina.desktop', 'nextcloud.desktop', 'virt-manager.desktop']"
#
## Touchpad / Touchscreen
#gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
#gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll false
#gsettings set org.gnome.settings-daemon.peripherals.touchscreen orientation-lock true
#
## Notifications
#gsettings set org.gnome.desktop.notifications show-in-lock-screen false
#
## GNOME Terminal
#gsettings set org.gnome.Terminal.Legacy.Settings menu-accelerator-enabled false
#gsettings set org.gnome.Terminal.Legacy.Settings default-show-menubar false
#
## Nautilus
#gsettings set org.gtk.Settings.FileChooser sort-directories-first true
#gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'
#
## Power settings
#gsettings set org.gnome.desktop.session idle-delay 'uint32 900' # 15min untill screen blanks
