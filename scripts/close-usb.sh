#!/bin/bash

umount /mnt/private
cryptsetup close private
echo "Umounted&Encrypted Encrypted Partition!"

umount /mnt/portable
echo "Umounted Non-Encrypted Partition!"

lsblk
