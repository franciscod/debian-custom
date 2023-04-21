#!/bin/bash
set -ex

ROOT=out/debian
LIVE=out/staging/live

mkdir -p out/{staging/{EFI/boot,boot/grub/x86_64-efi,isolinux,etc},tmp}

DISTRO=$(cat /etc/issue | head -n 1 | cut -d' ' -f1)
if [[ "$DISTRO" -eq "Arch" ]]; then
    ISOLINUX_BIN=/usr/lib/syslinux/bios/isolinux.bin
    ISOLINUX_BIOS_DIR=/usr/lib/syslinux/bios/
    ISOHDPFX=/usr/lib/syslinux/bios/isohdpfx.bin
    cp /usr/share/memtest86+/memtest.iso out/staging/etc/
elif [[ "$DISTRO" -eq "Debian" ]]; then
    ISOLINUX_BIN=/usr/lib/ISOLINUX/isolinux.bin
    ISOLINUX_BIOS_DIR=/usr/lib/syslinux/modules/bios
    ISOHDPFX=/usr/lib/ISOLINUX/isohdpfx.bin
else
    echo "unknown distro: '$DISTRO'"
    exit 1
fi

cp $ROOT/boot/vmlinuz-* $LIVE/vmlinuz
cp $ROOT/boot/initrd.img-* $LIVE/initrd

cat <<'EOF' >out/staging/isolinux/isolinux.cfg
UI vesamenu.c32

MENU TITLE Boot Menu
DEFAULT linux
TIMEOUT 30
MENU RESOLUTION 640 480
MENU COLOR border       30;44   #40ffffff #a0000000 std
MENU COLOR title        1;36;44 #9033ccff #a0000000 std
MENU COLOR sel          7;37;40 #e0ffffff #20ffffff all
MENU COLOR unsel        37;44   #50ffffff #a0000000 std
MENU COLOR help         37;40   #c0ffffff #a0000000 std
MENU COLOR timeout_msg  37;40   #80ffffff #00000000 std
MENU COLOR timeout      1;37;40 #c0ffffff #00000000 std
MENU COLOR msg07        37;40   #90ffffff #a0000000 std
MENU COLOR tabmsg       31;40   #30ffffff #00000000 std

LABEL linux
  MENU LABEL ^Debian Custom [BIOS/ISOLINUX]
  MENU DEFAULT
  KERNEL /live/vmlinuz
  APPEND initrd=/live/initrd boot=live toram

LABEL linuxnms
  MENU LABEL Debian Custom [BIOS/ISOLINUX] (^nomodeset)
  KERNEL /live/vmlinuz
  APPEND initrd=/live/initrd boot=live nomodeset toram

LABEL memtest
  MENU LABEL ^Memtest86+
  KERNEL /isolinux/memdisk
  APPEND initrd=/etc/memtest.iso iso
EOF


cat <<'EOF' >out/staging/boot/grub/grub.cfg
search --set=root --file /DEBIAN_CUSTOM

set default="0"
set timeout=3

# If X has issues finding screens, experiment with/without nomodeset.

menuentry "Debian Custom [EFI/GRUB]" {
    linux ($root)/live/vmlinuz boot=live toram
    initrd ($root)/live/initrd
}

menuentry "Debian Custom [EFI/GRUB] (nomodeset)" {
    linux ($root)/live/vmlinuz boot=live nomodeset toram
    initrd ($root)/live/initrd
}
EOF

cat <<'EOF' >out/tmp/grub-standalone.cfg
search --set=root --file /DEBIAN_CUSTOM
set prefix=($root)/boot/grub/
configfile /boot/grub/grub.cfg
EOF


touch out/staging/DEBIAN_CUSTOM

GRUB_EFI=/usr/lib/grub/x86_64-efi

cp "$ISOLINUX_BIN" "out/staging/isolinux/"
cp "$ISOLINUX_BIOS_DIR"/* "out/staging/isolinux/"
cp -r "$GRUB_EFI"/* "out/staging/boot/grub/x86_64-efi/"

grub-mkstandalone \
    --format=x86_64-efi \
    --output=out/tmp/bootx64.efi \
    --locales="" \
    --fonts="" \
    "boot/grub/grub.cfg=$PWD/out/tmp/grub-standalone.cfg"

(cd out/staging/EFI/boot && \
    dd if=/dev/zero of=efiboot.img bs=1M count=20 && \
    mkfs.vfat efiboot.img && \
    mmd -i efiboot.img efi efi/boot && \
    mcopy -vi efiboot.img ../../../tmp/bootx64.efi ::efi/boot/
)

xorriso \
    -as mkisofs \
    -iso-level 3 \
    -o "out/debian-custom.iso" \
    -full-iso9660-filenames \
    -volid "DEBIAN_CUSTOM" \
    -isohybrid-mbr "$ISOHDPFX" \
    -eltorito-boot \
        isolinux/isolinux.bin \
        -no-emul-boot \
        -boot-load-size 4 \
        -boot-info-table \
        --eltorito-catalog isolinux/isolinux.cat \
    -eltorito-alt-boot \
        -e /EFI/boot/efiboot.img \
        -no-emul-boot \
        -isohybrid-gpt-basdat \
    -append_partition 2 0xef out/staging/EFI/boot/efiboot.img \
    "out/staging"
