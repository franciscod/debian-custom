#!/bin/bash
set -x

ROOT=out/debian

sudo umount $ROOT/{dev,sys,proc}
sudo umount $ROOT
sudo losetup -d /dev/loop0
