mkdir -p /media/dvd
mount -o loop,ro VBoxGuestAdditions*.iso /media/dvd
sh /media/dvd/VBoxLinuxAdditions.run --nox11
umount /media/dvd
rm VBoxGuestAdditions*.iso
