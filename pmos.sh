#!/bin/sh

# Symlink distrobox shims
./distrobox-shims.sh

# Update the container and install packages
apk update
apk upgrade
tee /etc/apk/repositories <<EOF
http://mirror.postmarketos.org/postmarketos/main
http://mirror.postmarketos.org/postmarketos/extra-repos/systemd/main
http://dl-cdn.alpinelinux.org/alpine/edge/main
http://dl-cdn.alpinelinux.org/alpine/edge/community
http://dl-cdn.alpinelinux.org/alpine/edge/testing
EOF
apk add -u --allow-untrusted postmarketos-keys # install keys needed for pmos' keys
apk add postmarketos-base postmarketos-base-systemd # pmos base packages
mkdir -p /etc/ld.so.conf.d/ # fixes nvidia setup (part 1)
apk add gcompat libc6-compat # fixes nvidia setup (part 2)
apk update
apk upgrade
