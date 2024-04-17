#!/bin/sh

[ -z "$1" ] || [ "x$1" = "xstart" ] || exit 0

SWAP_PERCENT_MEM=1
SWAPPINESS=20
SWAP_COMPRESSOR=lzo-rle

# User overrides.
[ -r /usr/local/etc/swap.conf ] && . /usr/local/etc/swap.conf

[ $SWAP_PERCENT_MEM -gt 0 ] || return 0

psplash_write "Setup swap..."

modprobe -q zram

SWAP_FILE_MB=$(expr $(sed -n 's/MemTotal: \+\([[:digit:]]\+\).*/\1/p' /proc/meminfo) \* ${SWAP_PERCENT_MEM} / 102400)
SWAP_FILE=$(zramctl -a ${SWAP_COMPRESSOR} -s ${SWAP_FILE_MB}M -f)

echo $SWAPPINESS > /proc/sys/vm/swappiness

# Enable zswap if present in the kernel
if [ -e "${SWAP_FILE}" ] ; then
	mkswap ${SWAP_FILE}
	swapon ${SWAP_FILE}
fi
