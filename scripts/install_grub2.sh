yum remove grub -y
yum install grub2 -y
grub2-install /dev/sda
grub2-mkconfig -o /boot/grub2/grub.cfg
