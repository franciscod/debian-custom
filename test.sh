#!/bin/sh

qemu-system-x86_64 -enable-kvm -m 4G -cdrom out/debian-custom.iso
# -serial stdio
