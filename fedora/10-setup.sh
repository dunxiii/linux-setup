#!/usr/bin/env bash

set -au

install_packages+=(
    NetworkManager-openconnect-gnome
    code
    curl
    dconf-editor
    git
    gnome-tweaks
    google-chrome-stable
    gpick
    htop
    nmap
    pwgen
    python-unversioned-command
    python3-virtualenv
    ranger
    remmina
    snapd
    transmission
    unar
    vim
    xclip
)

# nVidia driver from RPM Fusion
if grep -i nvidia <(lspci); then
    install_packages+=(
        akmod-nvidia
        xorg-x11-drv-nvidia
    )
fi

# vscode snap does not work any good
snap_packages+=(
    nextcloud-client # Works better than repo version
    spotify
    vlc
)

# Make sure script is run as root
if [ ${UID} -ne 0 ]; then
    echo "Run this script as root" 1>&2
    exit 2
fi

# Enable google chrome repo
dnf install fedora-workstation-repositories
dnf config-manager --set-enabled google-chrome

grep -i nvidia <(lspci) && \
    dnf config-manager --set-enabled rpmfusion-nonfree-nvidia-driver

# Repo for VSCode
rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo

# Updates each package to the latest version that is both available and resolvable
dnf upgrade

# Install extra packages
dnf install "${install_packages[@]}"

# Remove old dependencies
dnf autoremove

# Install snap packages
snap install "${snap_packages[@]}"

echo "Good gnome extentions to install:"
echo "- Argos"
echo "- Clipboard Indicator"
echo "- Dash to Panel"
echo "- No Topleft Hot Corner"
echo "- Refresh wifi connections"
echo "- Top Panel Workspace Scroll"
echo "- Topicons plus"
