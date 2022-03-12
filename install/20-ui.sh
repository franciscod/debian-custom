#!/bin/bash
set -ex

source /etc/profile

DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
    alsa-utils \
    dbus-x11 \
    firefox-esr \
    libfido2-dev \
    mousepad \
    mpv \
    network-manager-gnome \
    pavucontrol \
    pulseaudio \
    sgt-puzzles \
    slim \
    thunar-archive-plugin \
    tigervnc-viewer \
    x11vnc \
    xfce4 \
    xfce4-screenshooter \
    xfce4-terminal \
    xinit \
    xournal \
    xserver-xorg \
    xserver-xorg-core \
    xterm \
    zathura \
    # done
