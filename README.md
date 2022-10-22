# Scripts
Collection of scripts used with Raspberry

## update_hass
Script used to update Home Assistant Core in virtual environment running on Raspbian (Buster).  
Script runs from sudoer user (pi), while the user used in HomeAssistant is _homeassistant_
Virtual environment is located in: _/srv/homeassistant_  
The script is creating a copy of the actual environment before update.  
In case of problems with numpy: pip install --ignore-installed numpy --no-binary :all:  

## update_hass-docker
Script used to update Home Assistant Docker Container running on Raspbian (Buster).  
Check config variables in order to use it properly.  
The script is upgrading Home Assistant after creating a local backup of the container and the config on a mounted drive (/mnt/external)

## chromium-autostart.sh
Startup script for dietpi, located in:  
_/var/lib/dietpi/dietpi-software/installed/chromium-autostart.sh_
