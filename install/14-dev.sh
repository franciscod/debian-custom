#!/bin/bash
set -ex

source /etc/profile

DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
    build-essential \
    gcc \
    git \
    golang \
    make \
    nodejs \
    node-npm \
    php \
    python3 \
    python3-pip \
    python3-venv \
    tig \
    # done
