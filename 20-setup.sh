#!/usr/bin/env bash

set -au

# Fix for user shell themes, so it can be set with gsettings
# Reference: https://bbs.archlinux.org/viewtopic.php?id=139586
sudo cp ~/.local/share/gnome-shell/extensions/user-theme@gnome-shell-extensions.gcampax.github.com/schemas/org.gnome.shell.extensions.user-theme.gschema.xml /usr/share/glib-2.0/schemas
sudo glib-compile-schemas /usr/share/glib-2.0/schemas 

# Shell theme
gsettings set org.gnome.shell.extensions.user-theme name "Arc-Dark"
gsettings set org.gnome.desktop.interface gtk-theme "Arc-Darker"

# Icon theme
gsettings set org.gnome.desktop.interface icon-theme "Papirus"

# Misc gnome settings
gsettings set org.gnome.desktop.background show-desktop-icons false
gsettings set org.gnome.desktop.calendar show-weekdate true
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface enable-animations false
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll false
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'
gsettings set org.gnome.settings-daemon.peripherals.touchscreen orientation-lock true
gsettings set org.gnome.settings-daemon.plugins.orientation active false
gsettings set org.gnome.shell favorite-apps "['terminator.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.gedit.desktop', 'google-chrome.desktop', 'firefox-esr.desktop', 'org.gnome.Screenshot.desktop']"

# Nautilus
gsettings set org.gtk.Settings.FileChooser sort-directories-first true
gsettings set org.gnome.nautilus.preferences show-delete-permanently true
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'

# Gedit
gsettings set org.gnome.gedit.preferences.editor auto-indent true
gsettings set org.gnome.gedit.preferences.editor display-line-numbers true
gsettings set org.gnome.gedit.preferences.editor display-overview-map true
gsettings set org.gnome.gedit.preferences.editor highlight-current-line true
gsettings set org.gnome.gedit.preferences.editor insert-spaces true
gsettings set org.gnome.gedit.preferences.editor scheme 'solarized-light'
gsettings set org.gnome.gedit.preferences.editor tabs-size 4
gsettings set org.gnome.gedit.preferences.ui side-panel-visible true
gsettings set org.gnome.gedit.state.window side-panel-active-page 'GeditFileBrowserPanel'

# Power settings
gsettings set org.gnome.desktop.session idle-delay 'uint32 600'
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-timeout 0
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'suspend'
                                                                                                          
# Home dir setup
[[ ! -d ~/git ]] && mkdir ~/git

# Remove exsisting dirs
[[ -d ~/Desktop ]] && rmdir ~/Desktop
[[ -d ~/Music ]] && rmdir ~/Music
[[ -d ~/Videos ]] && rmdir ~/Videos
#[[ ! -L ~/.config/argos ]] && rm -rf ~/.config/argos
#[[ ! -L ~/.config/terminator ]] && rm -rf ~/.config/terminator
#[[ ! -L ~/.ssh ]] && rm -rf ~/.ssh

# Install VSCode extentions
vscode_ext+=(
    DavidAnson.vscode-markdownlint
    eamodio.gitlens
    eamodio.toggle-excluded-files
    PKief.markdown-checkbox
    robertohuertasm.vscode-icons
    shd101wyy.markdown-preview-enhanced
    vscoss.vscode-ansible
    zhuangtongfa.Material-theme
)

for extension in "${vscode_ext[@]}"; do
    code --install-extension "${extension}"
done

# fzf
#[[ ! -d ~/git/fzf ]] && git clone --depth 1 https://github.com/junegunn/fzf.git ~/git/fzf && \
#    ~/git/fzf/install
#[[ ! -d ~/git/fzf-marks ]] && git clone https://github.com/urbainvaes/fzf-marks.git ~/git/fzf-marks
