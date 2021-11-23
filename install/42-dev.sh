#!/bin/bash
set -ex

source /etc/profile

DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
    gcc \
    git \
    golang \
    make \
    build-essential \
    nodejs \
    node-npm \
    python3 \
    python3-pip \
    python3-venv \
    tig \
    # done
