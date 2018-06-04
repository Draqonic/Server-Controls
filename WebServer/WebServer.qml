Object {
	property var web // require express
	property bool autoLoad: true
	property bool running
	property int port: 3000
	signal started
	signal stopped
	property bool cors
	property bool cookie

	constructor: {
		this.web = require('express')()
	}

	function start() {
		if (this.running) return
		this._web = this.web.listen(this.port, function() { this.started(); this.running = true }.bind(this) )
	}

	function stop() {
		if (!this.running) return
		this._web.close()
		this.stopped()
		this.running = false
	}

	onCompleted: {
		if (this.autoLoad)
			this.start()
	}

	onCorsChanged: { this.web.use(require('cors')()) }
	onCookieChanged: { this.web.use(require("cookie-parser")()) }
}