#!/bin/bash
set -ex

source /etc/profile

DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
    mousepad \
    slim \
    xfce4 \
    xfce4-terminal \
    xinit \
    xserver-xorg \
    xserver-xorg-core \
    xterm \
    # done
