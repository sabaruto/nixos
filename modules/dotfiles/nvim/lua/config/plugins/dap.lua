local dap = require("dap")

dap.adapters.java = {
	type = "server",
	host = "127.0.0.1",
	port = 5005,
}

dap.configurations.java = {
	{
		type = "java",
		name = "Debug (Attach)",
		request = "attach",
		hostName = "127.0.0.1",
		port = 5005,
	},
}
