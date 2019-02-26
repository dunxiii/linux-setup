#!/usr/bin/env bash

set -au

# Misc gnome settings
gsettings set org.gnome.desktop.calendar show-weekdate true
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll false
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'
gsettings set org.gnome.settings-daemon.peripherals.touchscreen orientation-lock true
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:ctrl_modifier']"

# GNOME Terminal
gsettings set org.gnome.Terminal.Legacy.Settings menu-accelerator-enabled false
gsettings set org.gnome.Terminal.Legacy.Settings default-show-menubar false

# Nautilus
gsettings set org.gtk.Settings.FileChooser sort-directories-first true
#gsettings set org.gnome.nautilus.preferences show-delete-permanently true
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'

# Power settings
#gsettings set org.gnome.desktop.session idle-delay 'uint32 600'
#gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
#gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-timeout 0
#gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'suspend'

# Home dir setup
[[ ! -d ~/Git ]] && mkdir ~/Git
[[ ! -d ~/Dev ]] && mkdir ~/Dev

# Install VSCode extentions
vscode_ext+=(
    #DavidAnson.vscode-markdownlint
    #eamodio.gitlens
    #eamodio.toggle-excluded-files
    #PKief.markdown-checkbox
    #robertohuertasm.vscode-icons
    #shd101wyy.markdown-preview-enhanced
    #vscoss.vscode-ansible
    #zhuangtongfa.Material-theme
)

#for extension in "${vscode_ext[@]}"; do
#    code --install-extension "${extension}"
#done
