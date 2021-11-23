#!/bin/bash
set -ex

source /etc/profile

apt clean

# broken symlinks
rm /initrd.img* /vmlinuz*
