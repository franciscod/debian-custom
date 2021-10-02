#!/bin/bash
set -ex

ROOT=out/debian

mkdir -p out/staging/live
sudo mksquashfs $ROOT out/staging/live/filesystem.squashfs -e boot
