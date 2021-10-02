#!/bin/bash
set -ex

ROOT=out/debian

sudo mkfs.ext4 $(cat /tmp/debian-custom-loop)p1
sudo mount $(cat /tmp/debian-custom-loop)p1 ${ROOT}
