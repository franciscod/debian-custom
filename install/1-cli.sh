#!/bin/bash
set -ex

source /etc/profile

DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
    apt-file \
    caca-utils \
    curl \
    figlet \
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
    sudo \
    tmux \
    vim \
    wget \
    # done

apt-file update
