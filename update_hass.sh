#!/bin/bash
# HomeAssistant Core environment update script
# Environment located in: /srv/homeassistant
# User used for HomeAssistant: homeassistant
# Run script with sudoer user

cd /srv

echo "Stopping Service"
sudo systemctl stop home-assistant@homeassistant

echo "Switch User to homeassistant"
sudo -u homeassistant -H -s bash << EOF

echo "Backup Homeassistant environment"
cp -r homeassistant homeassistant.bak

echo "Backup configuration"
cp -r /home/homeassistant/.homeassistant /home/homeassistant/snapshots/homeassistant`date +%Y%m%d`

echo "Activating Virtual Environment"
cd homeassistant
source bin/activate

echo "Updating Homassistant"
pip3 install --upgrade homeassistant

echo "Leaving VEnv"
deactivate

echo "Changing User"
exit

EOF

echo "Update Completed"

echo "Restarting Service"
sudo systemctl start home-assistant@homeassistant
