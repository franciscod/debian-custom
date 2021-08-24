#!/bin/bash
set -ex

source /etc/profile

useradd -m user -s /bin/bash
gpasswd -a user sudo
echo 'user:manteca' | chpasswd

sed 's/#default_user.*/default_user user/' -i /etc/slim.conf
sed 's/#auto_login.*/auto_login yes/' -i /etc/slim.conf
