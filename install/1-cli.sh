#!/bin/bash
set -ex

source /etc/profile

DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
    curl \
    figlet \
    gcc \
    git \
    inetutils-ping \
    iproute2 \
    man \
    nano \
    network-manager \
    network-manager-gnome \
    ranger \
    sudo \
    tmux \
    vim \
    wget \
    # done
