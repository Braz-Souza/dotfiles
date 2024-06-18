#!/bin/bash
lsblk
read -p "Where is your flash drive partition (i.e /dev/sdb) >> " PARTT

# ... /dev/sdc -J ...
lsblk $PARTT -J > iusearchbtw.txt
# BAD CODE!!! i will change it when i learn more about bash
IAM="$(sed "1,10d" iusearchbtw.txt)"
SORRY="$(echo -e "$IAM" | grep -o '"name": "[^"]*' | grep -o '[^"]*$')" 
echo -e "$SORRY" > iusearchbtw.txt
PORTB="$(sed "2,256d" iusearchbtw.txt)"
PRIVT="$(sed "1d" iusearchbtw.txt | sed "2,256d" )"
rm iusearchbtw.txt
echo -e "PORTABLE: /dev/$PORTB\nPRIVATE: /dev/$PRIVT"

if [[ ! -e /mnt/private ]]; then
	mkdir /mnt/private
fi

if [[ ! -e /mnt/portable ]]; then
	mkdir /mnt/portable
fi

mount /dev/$PORTB /mnt/portable
echo "Non-Encrypted Partition Mounted!"

cryptsetup open /dev/$PRIVT private
echo "Encrypted Partition Decrypted successfully!"

mount /dev/mapper/private /mnt/private
echo "Encrypted Partition Mounted!"

lsblk
