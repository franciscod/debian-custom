#!/bin/bash
set -ex

source /etc/profile

DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
    apt-file \
    bash-completion \
    caca-utils \
    curl \
    figlet \
    file \
    fzf \
    gcc \
    git \
    htop \
    inetutils-ping \
    iproute2 \
    less \
    libarchive-tools \
    locales \
    make \
    man \
    manpages \
    manpages-dev \
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
    xz-utils \
    zip \
    # done

apt-file update

echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
