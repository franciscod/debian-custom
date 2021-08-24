#!/bin/bash
set -ex

ROOT=out/debian

sudo mount -t proc /proc $ROOT/proc
sudo mount -t sysfs /sys $ROOT/sys
sudo mount -o bind /dev $ROOT/dev
