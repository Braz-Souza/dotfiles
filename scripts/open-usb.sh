#!/bin/bash
lsblk
read -p "Onde fica a partição publica (i.e /dev/sdc1 --> >>sdc1) >>" portb
read -p "Onde fica a partição privada (i.e /dev/sdc2 --> >>sdc2) >>" privt
cryptsetup open /dev/$privt private

if [[ ! -e /mnt/private ]]; then
	mkdir /mnt/private
fi

if [[ ! -e /mnt/portable ]]; then
	mkdir /mnt/portable
fi

mount /dev/$portb /mnt/portable
mount /dev/mapper/private /mnt/private

