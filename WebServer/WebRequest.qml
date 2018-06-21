Object {
	property string path: "/"
	signal request
	property enum method { Get, Post, Put, Delete };

	onCompleted: {
		let web
		if (this.parent instanceof _globals.ServerControls.WebServer.WebServer)
			web = this.parent.web
		else if (this.parent.parent instanceof _globals.ServerControls.WebServer.WebServer)
			web = this.parent.parent.web
		else {
			console.error("Error load web request: no web server avaible")
		}

  		let func = function(req, res) { this.request(req, res) }.bind(this)
		switch(this.method) {
		case this.Get: web.get(this.path, func); break
		case this.Post: web.post(this.path, func); break
		case this.Put: web.put(this.path, func); break
		case this.Delete: web.delete(this.path, func); break
		}
	}
}