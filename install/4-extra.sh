#!/bin/bash
set -ex

source /etc/profile

DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
    cifs-utils \
    firefox-esr \
    fuse \
    libfido2-dev \
    libfuse2 \
    nodejs \
    node-npm \
    openssh-client \
    python3 \
    python3-pip \
    python3-venv \
    qemu-kvm \
    sgt-puzzles \
    # done

# remove default utc
rm /etc/localtime

ln -s /usr/share/zoneinfo/America/Buenos_Aires /etc/localtime
