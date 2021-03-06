messages
processMethodEvent: method from: aMessageDictionary
	| params object |

	params := aMessageDictionary at: #params.
	method = #'Debugger.scriptParsed' ifTrue:
		[ object := NodeJSParsedScript fromDictionary: params in: self debugger.
		^ self debugger parsedScripts at: object scriptId put: object ].

	method = #'Runtime.executionContextCreated' ifTrue: 
		[ "(aMessageDictionary at: #params) at: #context" ^ self ].

	method = #'Debugger.paused' ifTrue: 
		[ object := NodeJSDebuggerState fromDictionary: params in: self debugger.
		^ self debugger 
			state: object;
			debuggerPaused ].

	method = #'Debugger.resumed' ifTrue: 
		[ ^ self debugger debuggerResumed ].

	method = #'Runtime.consoleAPICalled' ifTrue: 
		[ ^ self processConsoleAPICalled: params. ].

	method = #'Runtime.executionContextDestroyed' ifTrue: 
		[ ^ self debugger close. ].

	self error: 'Unknown event'.