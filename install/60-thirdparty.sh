#!/bin/bash
set -ex

source /etc/profile

DL=$(pwd)/thirdparty/dl

SUBL=$DL/sublime_text_4.tar.xz
pushd /opt
tar xf $SUBL
popd
pushd /usr/local/bin
ln -s /opt/sublime_text/sublime_text
popd

# LIBRESPRITE=$DL/LibreSprite.AppImage
# cp $LIBRESPRITE /usr/local/bin/libresprite
# chmod +x /usr/local/bin/libresprite

# GODOTFILE=Godot_v3.4.3-stable_x11.64
# GODOTZIP=$DL/$GODOTFILE.zip
# GODOTDIR=/opt/godot
# mkdir -p $GODOTDIR
# pushd $GODOTDIR
# unzip $GODOTZIP
# popd
# pushd /usr/local/bin
# ln -s $GODOTDIR/$GODOTFILE godot
# popd
