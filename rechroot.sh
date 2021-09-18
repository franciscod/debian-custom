#!/bin/bash
set -ex

ROOT=out/debian
IMG=out/debian.img

sudo losetup --partscan --show --find $IMG
sudo mount $(cat /tmp/debian-custom-loop)p1 $ROOT

sudo mount -t proc /proc $ROOT/proc
sudo mount -t sysfs /sys $ROOT/sys
sudo mount -o bind /dev $ROOT/dev

echo "re-entering the chroot..."
sudo chroot $ROOT

./dechroot.sh

echo "done! you might want to run ./live.sh and/or ./cleanup.sh later"
