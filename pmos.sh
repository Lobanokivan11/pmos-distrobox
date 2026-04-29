#!/bin/sh

# Symlink distrobox shims
./distrobox-shims.sh

# Update the container and install packages
apk update -y
apk upgrade -y
tee /etc/apk/repositories <<EOF
http://mirror.postmarketos.org/postmarketos/main
http://mirror.postmarketos.org/postmarketos/extra-repos/systemd/main
http://dl-cdn.alpinelinux.org/alpine/edge/main
http://dl-cdn.alpinelinux.org/alpine/edge/community
http://dl-cdn.alpinelinux.org/alpine/edge/testing
EOF
apk add -u --allow-untrusted postmarketos-keys
apk add postmarketos-base
apk add postmarketos-base-systemd
apk update
apk upgrade
