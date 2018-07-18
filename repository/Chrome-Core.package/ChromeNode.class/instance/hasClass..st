testing
hasClass: aClassNameString
	^ (((self attributeAt: 'class' ifAbsent: [ '' ]) substrings: ' ') collect: [ :s | s trim ]) includes: aClassNameString.