defaults
defaultExecutableLocation
	^ #('/opt/google/chrome/chrome' '/usr/bin/chromium-browser' '/usr/local/share/chromium/chrome') detect:
		[ :each | each asFileReference exists ].