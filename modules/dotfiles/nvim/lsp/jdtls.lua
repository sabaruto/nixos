return {
	root_dir = vim.fs.dirname(vim.fs.find({ ".git", "mvnw", "gradlew" }, { upward = true })[1]),
	settings = {
		java = {
			eclipse = {
				downloadSources = true,
			},
			saveActions = {
				organizeImports = true,
				cleanup = true,
			},

			configuration = {
				updateBuildConfiguration = "interactive",
				maven = {
					globalSettings = os.getenv("HOME") .. "/.m2/settings.xml"
				}
			},
			maven = {
				downloadSources = true,
			},
			implementationsCodeLens = {
				enabled = true,
			},
			referencesCodeLens = {
				enabled = true,
			},
			references = {
				includeDecompiledSources = true,
			},
			inlayHints = {
				parameterNames = {
					enabled = "all", -- literals, all, none
				},
			},
		},
		signatureHelp = { enabled = true },
	},
}
