#!/bin/bash
set -ex

source /etc/profile

DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
    apt-file \
    caca-utils \
    curl \
    figlet \
    fzf \
    gcc \
    git \
    htop \
    inetutils-ping \
    iproute2 \
    less \
    make \
    man \
    nano \
    net-tools \
    network-manager \
    network-manager-gnome \
    ranger \
    ripgrep \
    stow \
    sudo \
    tig \
    tmux \
    unzip \
    vim \
    wget \
    zip \
    # done

apt-file update
