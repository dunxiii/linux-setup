#!/usr/bin/env bash

set -au

install_packages+=(
    ansible
    arc-theme
    chrome-gnome-shell
    code
    curl
    deja-dup
    duplicity
    git
    gnome-shell-extensions-gpaste
    gnome-tweaks
    google-chrome-stable
    htop
    icedtea-8-plugin
    libreoffice
    network-manager-openconnect-gnome # Only in Ubuntu
    nextcloud-client
    nextcloud-client-nautilus
    nmap
    openssh-server
    papirus-icon-theme
    pwgen
    python3-venv
    ranger
    remmina
    spotify-client
    telegram-desktop
    tmux
    transmission
    unrar # requires non-free debian repo
    vim
)

if [ "$(lsb_release -is)" = "Ubuntu" ]; then

    add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"

    install_packages+=(
        adobe-flashplugin
        browser-plugin-freshplayer-pepperflash
    )

    purge_packages+=(
        update-manager
        apport
    )

elif [ "$(lsb_release -is)" = "Debian" ]; then

    install_packages+=(
        plymouth
        plymouth-themes
    )

    purge_packages+=(
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

# Repo for bluez
add-apt-repository ppa:bluetooth/bluez

# Repo for chrome
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add -
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list

# Repo for spotify
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
echo "deb http://repository.spotify.com stable non-free" > /etc/apt/sources.list.d/spotify.list

# Repo for ansible
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu bionic main" > /etc/apt/sources.list.d/ansible.list

# Repo for VSCode
wget -q -O - https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
rm microsoft.gpg
sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

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
echo "- Argos"
echo "- Clipboard Indicator"
