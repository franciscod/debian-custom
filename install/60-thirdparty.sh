#!/bin/bash
set -ex

source /etc/profile

SUBL=$(pwd)/thirdparty/dl/sublime_text_4.tar.xz
pushd /opt
tar xf $SUBL
popd
pushd /usr/local/bin
ln -s /opt/sublime_text/sublime_text
popd

LIBRESPRITE=$(pwd)/thirdparty/dl/LibreSprite.AppImage
cp $LIBRESPRITE /usr/local/bin/libresprite
chmod +x /usr/local/bin/libresprite

GODOT=$(pwd)/thirdparty/dl/Godot_v3.4.3-stable_x11.64.zip
cp $GODOT /usr/local/bin/godot
chmod +x /usr/local/bin/godot
