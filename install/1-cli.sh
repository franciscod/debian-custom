#!/bin/bash
set -ex

source /etc/profile

DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
    curl \
    figlet \
    gcc \
    git \
    nano \
    ranger \
    sudo \
    vim \
    tmux \
    wget \
    # done
