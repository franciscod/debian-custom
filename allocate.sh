#!/bin/bash
set -ex

IMG=out/debian.img

fallocate -l 2800M $IMG
echo -e "o\nn\np\n1\n\n\nw" | sudo fdisk $IMG
echo -e "a\nw\n" | sudo fdisk $IMG

sudo losetup --partscan --show --find $IMG > /tmp/debian-custom-loop
