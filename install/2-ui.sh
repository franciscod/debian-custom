#!/bin/bash
set -ex

source /etc/profile

DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
    alsa-utils \
    dbus-x11 \
    mousepad \
    pavucontrol \
    pulseaudio \
    slim \
    xfce4 \
    xfce4-terminal \
    xinit \
    xserver-xorg \
    xserver-xorg-core \
    xterm \
    # done
