# Mounting

etc/fstab
LABEL=writable  /       ext4    defaults        0       1
LABEL=system-boot       /boot/firmware  vfat    defaults        0       1
UUID=CE89-8EF0 /mnt/usb exfat defaults 0 0

## exfat is the problem, it cant chown or chmod! witch to ext4 necessary

/mnt/usb/books

sudo chown user:group /mnt/usb/books


