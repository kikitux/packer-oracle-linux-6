#!/bin/bash

mkdir -p /mnt/iso
mount -o loop VBoxGuestAdditions.iso /mnt/iso
/mnt/iso/VBoxLinuxAdditions.run
umount /mnt/iso
rm VBoxGuestAdditions.iso
