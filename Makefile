ROOT=out/debian

default: iso cleanup


/tmp/debian.img:
	mkdir -p ${ROOT}
	./allocate.sh
	./mountloop.sh
	make -C install/thirdparty
	./bootstrap.sh
	./mount.sh
	echo "entering the chroot..."
	sudo chroot ${ROOT} /bin/bash -c "cd /root/install && ./all.sh"
	make cont

cont:
	sudo chroot ${ROOT} /bin/bash -c "/bin/rm -rf /root/install"
	./dechroot.sh

squash: out/staging/live/filesystem.squashfs
out/staging/live/filesystem.squashfs: /tmp/debian.img
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

.PHONY: test
test:
	./test.sh
