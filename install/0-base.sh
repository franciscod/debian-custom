#!/bin/bash
set -ex

source /etc/profile

apt update

DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends linux-image-amd64 live-boot systemd-sysv
