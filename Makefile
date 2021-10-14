ROOT=out/debian

default: iso cleanup


out/debian.img:
	mkdir -p ${ROOT}
	./allocate.sh
	./mountloop.sh
	make -C install/thirdparty
	./bootstrap.sh
	./mount.sh
	echo "entering the chroot..."
	sudo chroot ${ROOT} /bin/bash -c "cd /root/install && ./all.sh"
	sudo chroot ${ROOT} /bin/bash -c "rm -rf /root/install"
	./dechroot.sh

squash: out/staging/live/filesystem.squashfs
out/staging/live/filesystem.squashfs: out/debian.img
	./squash.sh

iso: out/debian-custom.iso
out/debian-custom.iso: out/staging/live/filesystem.squashfs
	./live.sh

.PHONY: cleanup
cleanup:
	./cleanup.sh

.PHONY: wipe
wipe:
	./wipe.sh
