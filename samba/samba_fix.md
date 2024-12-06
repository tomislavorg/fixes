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
scp /home/tculo/homelab/fixes/samba/s_tcpc.txt tculo@10.88.0.29:/home/tculo/projects/samba/

## receive/fetch

scp root@10.88.0.113:/var/log/nvidia-installer.log .

scp tculo@10.88.0.29:/mnt/d/Bücher/Driver/NVIDIA-Linux-x86_64-550.90.05-vgpu-kvm.run .

scp tculo@10.88.0.113:/mnt/d/Books/Driver/T4_2024_07.zip .

scp /mnt/d/Books/Driver tculo@10.88.0.29:/mnt/usb/books/Driver

scp /mnt/d/Books/Driver tculo@10.88.0.29:/mnt/usb/books/Driver

## recursive

scp -r /mnt/d/Books/Driver tculo@10.88.0.29:/mnt/usb/books/Driver

## Move books, on WSL no escaping on &

scp -r "/mnt/d/Books/IT/Security&Linux" tculo@10.88.0.29:"/mnt/usb/books/IT/Security\&Linux/"
scp -r "/mnt/d/Books/IT/Temp" tculo@10.88.0.29:"/mnt/usb/books/IT/Temp"


scp /mnt/c/temp/gitlab_all_repos.tar.gz  root@10.88.0.230:/tmp/
