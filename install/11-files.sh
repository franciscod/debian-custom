#!/bin/bash
set -ex

source /etc/profile

DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
    file \
    libarchive-tools \
    libfuse2 \
    ntfs-3g \
    unzip \
    xz-utils \
    zip \
    # done
    # fuse3 \
