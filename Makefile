ROOT=out/debian

default: iso cleanup

iso: out/debian-custom.iso

out/debian.img:
	mkdir -p ${ROOT}
	./allocate.sh
	sudo mkfs.ext4 $(shell cat /tmp/debian-custom-loop)p1
	sudo mount $(shell cat /tmp/debian-custom-loop)p1 ${ROOT}
	./bootstrap.sh
	./mount.sh
	make -C install/thirdparty
	echo "entering the chroot..."
	# echo "please cd to /root/install and run ./all.sh"
	sudo chroot ${ROOT} /bin/bash -c "cd /root/install && ./all.sh"
	sudo chroot ${ROOT} /bin/bash -c "rm -rf /root/install"
	./dechroot.sh

out/staging/live/filesystem.squashfs: out/debian.img
	./squash.sh

out/debian-custom.iso: out/staging/live/filesystem.squashfs
	./live.sh

.PHONY: cleanup
cleanup:
	./cleanup.sh

.PHONY: clean
clean:
	./wipe.sh
