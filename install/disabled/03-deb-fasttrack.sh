#!/bin/bash
set -ex

source /etc/profile

# fasttrack for virtualbox
DEBIAN_FRONTEND=noninteractive apt install -y fasttrack-archive-keyring

echo "" >> /etc/apt/sources.list
echo "deb https://fasttrack.debian.net/debian-fasttrack/ bullseye-fasttrack main contrib" >> /etc/apt/sources.list
echo "deb https://fasttrack.debian.net/debian-fasttrack/ bullseye-backports-staging main contrib" >> /etc/apt/sources.list

apt update
