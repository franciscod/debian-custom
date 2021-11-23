#!/bin/bash
set -ex

source /etc/profile

DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
    locales \
    # done

echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/default/locale

# remove default utc
rm /etc/localtime

ln -s /usr/share/zoneinfo/America/Buenos_Aires /etc/localtime
