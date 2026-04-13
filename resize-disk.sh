#!/bin/bash

echo "current disk space"
df -hT
echo "Disk resize started:"
lsblk
sudo growpart /dev/nvme0n1 4
sudo lvextend -l +50%FREE /dev/RootVG/rootVol
sudo lvextend -l +50%FREE /dev/RootVG/varVol
sudo xfs_growfs /
sudo xfs_growfs /var
echo "Disk resize complete. Final status:"
df -hT