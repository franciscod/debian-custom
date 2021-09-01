#!/bin/bash
set -ex

source /etc/profile

DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
    firefox-esr \
    nodejs \
    openssh-client \
    openssh-server \
    python3 \
    python3-pip \
    python3-venv \
    qemu-kvm \
    # done