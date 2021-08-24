#!/bin/bash
#
# There is probably a better way to do this, but who cares.
#
# Restart pipewire
systemctl --user restart pipewire.service
systemctl --user restart pipewire-pulse.service
systemctl --user restart pipewire-media-session.service

# Apps that need restarting
apps=(/opt/discord/Discord spotify easyeffects)

# If a process was killed - restart it
for i in ${apps[*]}; do
	killall $i
	if [ $? == 0 ]
       	then
		sleep 2
		$i &
	fi
done

# I USE ARCH BTW!
