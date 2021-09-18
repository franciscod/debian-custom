#!/bin/bash
set -ex

ROOT=out/debian

rm -f out/debian.img
mkdir -p $ROOT

./allocate.sh

sudo mkfs.ext4 $(cat /tmp/debian-custom-loop)p1
sudo mount $(cat /tmp/debian-custom-loop)p1 $ROOT

./bootstrap.sh

./mount.sh

make -C install/thirdparty

echo "entering the chroot..."
# echo "please cd to /root/install and run ./all.sh"
sudo chroot $ROOT /bin/bash -c "cd /root/install && ./all.sh"
sudo chroot $ROOT /bin/bash -c "rm -rf /root/install"

./dechroot.sh

echo "creating live image..."
./live.sh

echo "unmounting..."

./cleanup.sh

echo "done! for testing with qemu: ./test.sh"
echo "      image flash drives:    ./flash.sh"
