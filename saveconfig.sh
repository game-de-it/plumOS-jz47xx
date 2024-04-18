#!/bin/sh

make savedefconfig
make linux-savedefconfig
make linux-update-defconfig
make busybox-update-config
make uclibc-update-config
