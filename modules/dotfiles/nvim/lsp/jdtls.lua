return {
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
			format = {
				settings = {
					url = os.getenv("HOME") .. "/.m2/formatter.xml",
					profile = "IntelliJ",
				}
			}
		},
		signatureHelp = { enabled = true },
	},
}
