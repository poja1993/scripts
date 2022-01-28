#!/bin/bash
# Autostart run script for Kiosk mode, based on @AYapejian https://github.com/MichaIng/DietPi/issues/1737#issue-318697621
# - Please see /root/.chromium-browser.init (and /etc/chromium.d/custom_flags) for additional egl/gl init options

# Command line switches https://peter.sh/experiments/chromium-command-line-switches/
# --test-type gets rid of some of the chromium warnings that you may or may not care about in kiosk on a LAN
# --pull-to-refresh=1
# --ash-host-window-bounds="400,300"

# Resolution to use for kiosk mode, should ideally match current system resolution
RES_X=$(sed -n '/^[[:blank:]]*SOFTWARE_CHROMIUM_RES_X=/{s/^[^=]*=//p;q}' /boot/dietpi.txt)
RES_Y=$(sed -n '/^[[:blank:]]*SOFTWARE_CHROMIUM_RES_Y=/{s/^[^=]*=//p;q}' /boot/dietpi.txt)

CHROMIUM_OPTS="--kiosk --test-type --window-size=$RES_X,$RES_Y --start-fullscreen --start-maximized --window-position=0,0"
# If you want tablet mode, uncomment the next line.
#CHROMIUM_OPTS+=' --force-tablet-mode --tablet-ui'

# Add URL for first run:
URL=$(sed -n '/^[[:blank:]]*SOFTWARE_CHROMIUM_AUTOSTART_URL=/{s/^[^=]*=//p;q}' /boot/dietpi.txt)
CHROMIUM_OPTS+=" --homepage $URL"

# Find absolute filepath location of Chromium binary.
FP_CHROMIUM=$(command -v chromium)
if [[ ! $FP_CHROMIUM ]]; then

	# Assume RPi
	FP_CHROMIUM="$(command -v chromium-browser)"

fi
unclutter -idle 1 &
sudo vcgencmd display_power 0 &
sudo xinit $FP_CHROMIUM $CHROMIUM_OPTS

#DISPLAY=:0.0 ; export DISPLAY
#unclutter -idle 1
