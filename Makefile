install:
	shortcuts list | grep 'Camera Light On' >/dev/null || open shortcuts/Camera\ Light\ On.shortcut
	shortcuts list | grep 'Camera Light Off' >/dev/null || open shortcuts/Camera\ Light\ Off.shortcut

	sudo cp auto-camera-light /usr/local/bin
	cp rs.themuelle.auto-camera-light.plist ~/Library/LaunchAgents
	chmod 600 ~/Library/LaunchAgents/rs.themuelle.auto-camera-light.plist

	-launchctl unload ~/Library/LaunchAgents/rs.themuelle.auto-camera-light.plist
	-launchctl load ~/Library/LaunchAgents/rs.themuelle.auto-camera-light.plist
	launchctl enable gui/`id -u`/rs.themuelle.auto-camera-light.plist
	launchctl kickstart -kp gui/`id -u`/rs.themuelle.auto-camera-light
