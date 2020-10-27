#!/bin/bash

sudo dnf install emacs neovim vim buildah podman podman-compose

echo "docker is now podman"
echo -e "alias docker=\"podman\"\n$(cat ~/.zshrc)" > ~/.zshrc

echo "docker-compose is now podman-compose"
echo -e "alias docker-compose=\"podman-compose\"\n$(cat ~/.zshrc)" > ~/.zshrc

source ~/.zshrc
