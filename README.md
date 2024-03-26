# WSL-Mounts
2024/03/26 - Andrew Nathanson
GPLv3 licence

Script to auto mount Windows mounts into WSL.
Note, it will also create folders for the mounts, so be sure to update the two variables before use. 

## DRVFS-mounts.sh
Uses DRVFS to link Windows mounts to WSL. 

### Modifications before use:
Update the MountDir variable with your prefered mount folder
Enter the drive letters for all you wish to mount in the array Drives=()

### Run
Either run manually with:

    sudo ./DRVFS-mounts

Or configure to run when opening a new shell
Use visudo to edit the /etc/sudoers file. And add the line. Replacing yourusername with your actual username. And updating the path "WSL-Mounts/" with the full path to the script.

    sudo visudo
    yourusername ALL=(ALL) NOPASSWD: WSL-Mounts/DRVFS-mounts

And add the command to the file.

    echo "sudo WSL-Mounts/DRVFS-mounts" >> ~/.bashrc
