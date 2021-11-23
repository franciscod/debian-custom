#!/bin/bash
set -ex

source /etc/profile

DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
    cifs-utils \
    curl \
    inetutils-ping \
    iproute2 \
    net-tools \
    network-manager \
    rsync \
    wget \
    # done
