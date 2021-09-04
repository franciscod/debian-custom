#!/bin/bash
set -ex

ROOT=out/debian
LIVE=out/staging/net

mkdir -p $LIVE

sudo mksquashfs $ROOT $LIVE/rootfs.squashfs -e boot

cp $ROOT/boot/vmlinuz-* $LIVE/vmlinuz
# cp $ROOT/boot/initrd.img-* $LIVE/initrd
dracut -N -v --force --add "livenet" $LIVE/dracut-initrd

cat <<'EOF' >$LIVE/boot.ipxe
#!ipxe
kernel vmlinuz quiet splash root=live:http://192.168.88.254:8000/rootfs.squashfs
initrd dracut-initrd
boot
EOF

cd $LIVE
python3 -m http.server 8000
