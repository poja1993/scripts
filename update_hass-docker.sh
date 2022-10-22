#!/bin/bash
# HomeAssistant Docker update script
# Configuration located in: /home/pi/hass-container/.homeassistant
# Run script with sudoer user
# https://www.tutorialspoint.com/how-to-backup-and-restore-a-docker-container
set -e

# CONFIG
contHome=/home/pi/hass-container
configDir=${contHome}/.homeassistant # HomeAssistant config folder
backupName=homeassistant:`date +%Y%m%d` # Name of the backup
backupDir=/mnt/external/homeassistant # Target directory of backpu

echo "Stopping Docker"
docker stop homeassistant

echo "Backup Homeassistant Docker"
# Find container ID
contID=`docker ps -a | grep home-assistant | cut -d " " -f 1`
docker commit $contID $backupName # Commit docker
docker save -o $backupDir/docker/$backupName.tar $backupName # Backup docker as tar in backup directory

echo "Backup configuration"
sudo cp -r $configDir $backupDir/snapshots/$backupName # Backup of Home Assistant Configuration (sudo required)

echo "Updating Homassistant"
cd $contHome
docker-compose pull

echo "Update Completed"

echo "Restarting Docker"
docker-compose up -d
