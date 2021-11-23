#!/bin/bash
set -ex

cd /root/install

for f in ??-*.sh; do
    echo "running $f"
    ./$f
done
