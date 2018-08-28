#!/usr/bin/env bash

set -au

install_packages+=(
    #default-jre
    #libnss3-tools
    #ntp
    #python-keyring # replaced by pip keyring
    #ranger
    arc-theme
    chrome-gnome-shell
    curl
    git
    gnome-shell-extensions-gpaste
    gnome-tweaks
    google-chrome-stable
    gpaste
    gpick
    htop
    icedtea-8-plugin
    network-manager-openconnect-gnome # Only in Ubuntu
    nextcloud-client
    nextcloud-client-nautilus
    nmap
    openssh-server
    papirus-icon-theme
    ranger
    remmina
    spotify-client
    telegram-desktop
    terminator
    unrar # requires non-free debian repo
    vim
)

if [ "$(lsb_release -is)" = "Ubuntu" ]; then

    add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"

    install_packages+=(
	adobe-flashplugin
	browser-plugin-freshplayer-pepperflash
    )


elif [ "$(lsb_release -is)" = "Debian" ]; then

    install_packages+=(
        plymouth
        plymouth-themes
    )

    purge_packages+=(
        #cheese
        #gnome-calendar
        #gnome-terminal
        #gnome-todo
        #rhythmbox
        #shotwell
        gnome-games
    )

    # Enable contrib and non-free repositorys
    sed -i '/^# /! s/main$/main contrib non-free/' /etc/apt/sources.list

fi

#install_pip+=(
#    keyring # May need python-secretstorage from apt
#)

# Make sure script is run as root
if [ ${UID} -ne 0 ]; then
    echo "Run this script as root" 1>&2
    exit 2
fi

# Repo for chrome
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add -
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list

# Repo for spotify
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
echo "deb http://repository.spotify.com stable non-free" > /etc/apt/sources.list.d/spotify.list

# Repo for nextcloud
add-apt-repository -y ppa:nextcloud-devs/client

# Bring system up to date
apt-get update
apt-get -V dist-upgrade

#apt-get install dirmngr # Reqirement for papirus repo key
apt-get -V install "${install_packages[@]}"
apt-get -V purge "${purge_packages[@]}"
apt-get -V autoremove

test -n "${install_pip:-}" && \
    pip install --ignore-installed ${install_pip[@]}

# Passwordless sudo
if ! grep -q NOPASSWD /etc/sudoers; then
    echo "%sudo   ALL=(ALL) NOPASSWD: ALL" | (EDITOR="tee -a" visudo)
fi

if [ "$(lsb_release -is)" = "Debian" ]; then

    # Plymouth
    sed -i -e '/^GRUB_CMDLINE_LINUX_DEFAULT/ s/"quiet"/"quiet splash"/' /etc/default/grub
    plymouth-set-default-theme -R softwaves
    update-grub2

    # Fix for chrome gnome extentions support
    sudo mkdir -p /etc/opt/chrome/native-messaging-hosts
    sudo cp /etc/chromium/native-messaging-hosts/org.gnome.chrome_gnome_shell.json /etc/opt/chrome/native-messaging-hosts/

fi

echo "Install these gnome extentions:"
echo "- Refresh wifi connections"
echo "- User Themes"
