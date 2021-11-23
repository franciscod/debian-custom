#!/bin/bash
set -ex

source /etc/profile

cat << EOF > /usr/local/bin/trixie
#!/bin/sh
T_DIR=~/trixie

echo -n "Usuario de trixie? "
read T_USER

mkdir -p \$T_DIR
sudo mount -t cifs -o user=\$T_USER,uid=\$(id -u),gid=\$(id -g),file_mode=0600,dir_mode=0700 //192.168.2.168/\$T_USER \$T_DIR
EOF

cat << EOF > /usr/local/bin/ver
#!/bin/sh
DESTINO=\${1:-192.168.22.222}
xtigervncviewer \$DESTINO
EOF

cat << EOF > /usr/local/bin/compartir
#!/bin/sh

(sleep 3; ip a | awk -F'[ /]' '/inet 192/ {print \$6}') &

# para permitir control, sacar -viewonly y agregar un password!
# ver 'man x11vnc'

x11vnc -viewonly -forever -shared -ncache 10
EOF

chmod +x /usr/local/bin/trixie
chmod +x /usr/local/bin/ver
chmod +x /usr/local/bin/compartir
