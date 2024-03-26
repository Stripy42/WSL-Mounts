#!/bin/bash

# Use DRVFS to link Windows mounts to WSL
# Enter the drive letters for all you wish to mount in the array Drives=() below. 

# Either run manually with "sudo DRVFS-mounts"
# Or configure to run when opening a new shell 
#  * use "sudo visudo" to edit the /etc/sudoers file. And add the line: yourusername ALL=(ALL) NOPASSWD: /mnt/DRVFS-mounts
#  * and add the command to the file ~/.bashrc : sudo /mnt/DRVFS-mounts

# 2024/03/26 - Andrew Nathanson - Tidied for public

MountDir="/mnt"
Drives=(q s v)

printf "Mounting Win drives in Linux : "

for Drive in "${Drives[@]}"; do
	FullPath="${MountDir}/${Drive,}"
	if [ ! -d "${FullPath}" ]; then mkdir -p "${FullPath}"; fi
	mount -t drvfs "${Drive^}": "${FullPath}" 2>/dev/null
	if [ $? -gt 0 ] ; then echo -en "\e[31;40;1m-${Drive} \e[0m"; else echo -en "\e[32;1m+${Drive} \e[0m"; fi
done

printf " : For -#, check connection and/or open in Windows Explorer first\n"

exit 0
 
