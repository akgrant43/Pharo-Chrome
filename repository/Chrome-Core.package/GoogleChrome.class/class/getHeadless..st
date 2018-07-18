instance creation
getHeadless: anURL
	"Answer the ChromeNode of the requested page - headless"

	^ self new headless: true; get: anURL