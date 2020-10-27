#!/bin/bash

sudo dnf install emacs neovim vim
sudo dnf remove podman podman-compose buildah

sudo dnf remove docker-*
sudo dnf config-manager --disable docker-*

sudo grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0"

sudo firewall-cmd --permanent --zone=trusted --add-interface=docker0
sudo firewall-cmd --permanent --zone=FedoraWorkstation --add-masquerade

sudo dnf install moby-engine docker-compose

sudo systemctl enable docker

sudo groupadd docker
sudo usermod -aG docker $USER
