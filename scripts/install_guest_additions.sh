#!/bin/bash
PACKAGES="gcc kernel-uek-devel kernel-uek-headers perl python-kitchen python-chardet"
rpm -q ${PACKAGES} &>/dev/null || yum install -y ${PACKAGES}

mkdir -p /mnt/iso
mount -o loop VBoxGuestAdditions.iso /mnt/iso
/mnt/iso/VBoxLinuxAdditions.run
umount /mnt/iso
rm VBoxGuestAdditions.iso

yum remove -y ${PACKAGES}
