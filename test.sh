#!/bin/sh

qemu-system-x86_64 -enable-kvm -m 2G -cdrom out/debian-custom.iso
# -bios /usr/share/edk2/x64/OVMF.fd
# -bios /usr/share/ovmf/OVMF.fd
# -serial stdio
