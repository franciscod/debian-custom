#!/bin/bash
set -ex

source /etc/profile

DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
    cmatrix \
    tint \
    # done

# fasttrack for virtualbox
apt install fasttrack-archive-keyring

echo "" >> /etc/apt/sources.list
echo "deb https://fasttrack.debian.net/debian-fasttrack/ bullseye-fasttrack main contrib" >> /etc/apt/soruces.list
echo "deb https://fasttrack.debian.net/debian-fasttrack/ bullseye-backports-staging main contrib" >> /etc/apt/sources.list

apt update
apt install virtualbox virtualbox-ext-pack
