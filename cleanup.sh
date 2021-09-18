#!/bin/bash
set -x

ROOT=out/debian

sudo umount $ROOT/{dev,sys,proc}
sudo umount $ROOT
sudo losetup -d $(cat /tmp/debian-custom-loop)
rm -f /tmp/debian-custom-loop
