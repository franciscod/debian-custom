#!/bin/bash
set -ex

ROOT=out/debian

rm -f out/debian.img
mkdir -p $ROOT

./allocate.sh
sudo mkfs.ext4 /dev/loop0p1
sudo mount /dev/loop0p1 $ROOT

./bootstrap.sh

./mount.sh

echo "entering the chroot..."
# echo "please cd to /root/install and run ./all.sh"
sudo chroot $ROOT /bin/bash -c "cd /root/install && ./all.sh"

./dechroot.sh

echo "creating live image..."
./live.sh

echo "unmounting..."

./cleanup.sh

echo "done! for testing with qemu: ./test.sh"
