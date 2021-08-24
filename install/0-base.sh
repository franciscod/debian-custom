#!/bin/bash
set -ex

source /etc/profile

apt update

DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends linux-image-amd64 live-boot systemd-sysv 
## grub2-common grub-pc

## echo "LABEL=DEBUSB / ext4 defaults 0 1" > /etc/fstab
## passwd root

##  grub-install \
##      --target=i386-pc \
##      --boot-directory=/boot \
##      --force-file-id \
##      --skip-fs-probe \
##      --recheck /dev/loop0
