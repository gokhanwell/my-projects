#!/bin/bash

# Check if we are root privilage or not
if [[ $UID -ne 0 ]]
then 
    echo "Please run as root"
    exit 1
fi 

# Which files are we going to back up. Please make sure to exist /home/ec2-user/data file
BACKUP_FILES="/home/ec2-user/data /etc /boot /usr"

# Where do we backup to. Please crete this file before execute this script
BACKUP_DEST="/mnt/backup/"

# Create archive filename based on time
TIME=$(date +"%Y_%m_%d_%H_%M")
HOSTNAME=$(hostname -s)
ARCHIVE_FILES="$HOSTNAME-$TIME.tgz"

# Print start status message.
echo "archive process is started"

# Backup the files using tar.
tar -czvf $BACKUP_DEST/$ARCHIVE_FILES $BACKUP_FILES

# Print end status message.
echo "backup is finished"

# Long listing of files in $BACKUP_DEST to check file sizes.
ls -l $BACKUP_DEST

# You must add below line at the crontab file. ("sudo crontab -e")
# */5 * * * * sudo /home/ec2-user/Proje/Third_Part/backup.sh