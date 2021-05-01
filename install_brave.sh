#!/usr/bin/env bash

DISTRIBUTION=$(lsb_release -i | awk '{ print $3}')

if [[ "$DISTRIBUTION" -eq "Fedora" ]]
then
    sudo dnf install dnf-plugins-core

    sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/

    sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

    sudo dnf install brave-browser -y
else
    sudo apt install apt-transport-https curl

    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

    sudo apt update

    sudo apt install brave-browser -y
fi
