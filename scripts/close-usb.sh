#!/bin/bash
umount /mnt/private
cryptsetup close private
umount /mnt/portable
