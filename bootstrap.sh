#!/bin/bash
set -ex

ROOT=out/debian

sudo debootstrap --arch=amd64 --variant=minbase bullseye $ROOT
sudo cp -r install/ $ROOT/root/install

echo "debian-custom" | sudo tee $ROOT/etc/hostname
echo "127.0.0.1 localhost debian-custom" | sudo tee $ROOT/etc/hosts
