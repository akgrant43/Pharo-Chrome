messages
wait
	"Wait for the receivers message to be processed (with timeout)"

	semaphore waitTimeoutSeconds: 180 onCompletion: nil onTimeout: [ Error signal: 'Google Chrome Message Processor timeout' ].