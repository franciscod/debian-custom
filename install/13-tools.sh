#!/bin/bash
set -ex

source /etc/profile

DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
    age \
    figlet \
    fzf \
    htop \
    openssh-client \
    qemu-kvm \
    qrencode \ 
    ranger \
    ripgrep \
    stow \
    # done
