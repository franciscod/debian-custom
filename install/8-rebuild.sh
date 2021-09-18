#!/bin/bash
set -ex

source /etc/profile

DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
    debootstrap \
    dosfstools \
    fdisk \
    gddrescue \
    grub-efi-amd64-bin \
    grub-pc-bin \
    isolinux \
    mtools \
    squashfs-tools \
    syslinux-efi \
    xorriso \
    # done
