# Scripts
Collection of scripts used with Raspberry

## update_hass
Script used to update HomeAssistant Core in virtual environment running on Raspbian (Buster).  
Script runs from sudoer user (pi), while the user used in HomeAssistant is _homeassistant_
Virtual environment is located in: _/srv/homeassistant_  
The script is creating a copy of the actual environment before update.  
In case of problems with numpy: pip install --ignore-installed numpy --no-binary :all:  

## chromium-autostart.sh
Startup script for dietpi, located in:  
_/var/lib/dietpi/dietpi-software/installed/chromium-autostart.sh_
