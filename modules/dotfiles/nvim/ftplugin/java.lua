require("dap")

local jdtls = require("jdtls")
local config = {}

config.settings = {
	java = {
		eclipse = {
			downloadSources = true,
		},
		saveActions = {
			organizeImports = false,
			cleanup = true,
		},
		configuration = {
			updateBuildConfiguration = "interactive",

			maven = {
				userSettings = os.getenv("HOME") .. "/.m2/settings.xml",
			},

			runtimes = {
				{
					name = "JavaSE-25",
					path = os.getenv("JAVA_HOME"),
				},
			},
		},
		format = {
			enabled = true,
			settings = {
				profile = "Intellij",
				url = "~/.config/jdtls/xml/profiles.xml",
			},
		},
		import = {
			maven = {
				downloadSources = true,
			},
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
}

-- config["capabilities"]["textDocument"]["callHierarchy"] = {
-- 	dynamicRegistration = true,
-- }

local textDocument = {
	callHierarchy = {
		dynamicRegistration = true,
	},
}

local workspace = {
	configuration = true,
	didChangeWatchedFiles = {
		dynamicRegistration = true,
	},
	didChangeWorkspaceFolders = {
		dynamicRegistration = true,
	},
}

local home = os.getenv("HOME")
local config_dir = home .. "/.config/jdtls/"
local jars_dir = config_dir .. "/jars"
local data_dir = vim.fn.stdpath("data")
local cache_dir = home .. "/.cache/jdtls"

local cwd = vim.fn.getcwd()
local project_name = vim.fn.fnamemodify(cwd, ":p:h:t")
local workspace_dir = cache_dir .. "/workspace/" .. project_name

config.cmd = {
	"jdtls",
	"--jvm-arg=-javaagent:" .. home .. "/.config/jdtls/jars/javaagents/lombok.jar",
	"-configuration",
	home .. "/.cache/jdtls",
	"-data",
	workspace_dir,
}

local bundles = {}

vim.list_extend(bundles, vim.split(vim.fn.glob(jars_dir .. "/bundles/*.jar", 1), "\n"))
vim.list_extend(bundles, {
	vim.fn.glob(data_dir .. "/mason/packages/java-test/extension/server/*.jar", true),
	vim.fn.glob(
		data_dir .. "/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar",
		true
	),
})
config["init_options"] = {
	bundles = bundles,
}

config.on_init = function(client, _)
	client.notify("workspace/didChangeConfiguration", { settings = config.settings })
	jdtls.setup_dap({ hotcodereplace = "auto" })
	jdtls.setup.add_commands()
end

jdtls.start_or_attach(config)
