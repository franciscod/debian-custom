#!/bin/bash
set -ex

source /etc/profile

DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
    bash-completion \
    fish \
    less \
    man \
    manpages \
    manpages-dev \
    moreutils \
    nano \
    ncal \
    ncdu \
    sudo \
    tmux \
    vim \
    # done
