# Mounting

etc/fstab
LABEL=writable  /       ext4    defaults        0       1
LABEL=system-boot       /boot/firmware  vfat    defaults        0       1
UUID=CE89-8EF0 /mnt/usb exfat defaults 0 0

## exfat is the problem, it cant chown or chmod! witch to ext4 necessary

/mnt/usb/books

sudo chown user:group /mnt/usb/books

## send

scp  NVIDIA-Linux-x86_64-550.90.05-vgpu-kvm.run user@192.168.1.10:/mnt/d/Bücher/Driver
scp /mnt/d/Books/Driver/NVIDIA-Linux-x86_64-550.90.05-vgpu-kvm.run tculo@10.88.0.113:/home/tculo/tmp/NVIDIA-Linux-x86_64-550.90.05-vgpu-kvm.run

## receive

scp user@192.168.1.20:/home/user/remote_files/remote_file.txt .

scp tculo@10.88.0.29:/mnt/d/Bücher/Driver/NVIDIA-Linux-x86_64-550.90.05-vgpu-kvm.run .

scp tculo@10.88.0.10:/mnt/d/Books/Driver/T4_2024_07.zip .

scp /mnt/d/Books/Driver tculo@10.88.0.29:/mnt/usb/books/Driver

scp /mnt/d/Books/Driver tculo@10.88.0.29:/mnt/usb/books/Driver

## recursive

scp -r /mnt/d/Books/Driver tculo@10.88.0.29:/mnt/usb/books/Driver