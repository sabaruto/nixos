return {
	settings = {
		["nil"] = {
			flake = {
				autoArchive = true,
				autoEvalInputs = true,
			}
		},
	},
	capabilities = {
		workspace = {
			didChangeWatchedFiles = {
				dynamicRegistration = false,
			}
		}
	}
}
