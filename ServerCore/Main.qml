Object {
	property string nodePath
	property string currentFile
	property var args

	constructor: {
		this.nodePath = process.argv[0]
		this.currentFile = process.argv[1]
		this.args = new Array()
		for (let i = 2; i !== process.argv.length; ++i)
			this.args.push(process.argv[i])
	}

	function main() {
	}

	onCompleted: {
		this.main()
	}
}