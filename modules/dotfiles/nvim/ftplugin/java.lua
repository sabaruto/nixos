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
					name = "JavaSE-24",
					path = os.getenv("JAVA_HOME"),
				},
			},
		},
		format = {
			enabled = true,
			settings = {
				profile = "Intellij",
				url = "~/github.com/sabaruto/nixos/tools/java/xml/profiles.xml",
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
local nixos_dir = home .. "/github.com/sabaruto/nixos"
local jars_dir = nixos_dir .. "/tools/java/jars"
local jdtls_root = vim.split(vim.fn.glob("/nix/store/*jdt-language-server-*.0"), "\n")[1]
local data_dir = vim.fn.stdpath("data")
local config_dir = jdtls_root .. "/share/java/jdtls/config_linux"
local jdtls_jar_path =
	vim.split(vim.fn.glob(jdtls_root .. "/share/java/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"), "\n")[1]
local cache_dir = home .. "/.cache/jdtls"

local cwd = vim.fn.getcwd()
local project_name = vim.fn.fnamemodify(cwd, ":p:h:t")
local workspace_dir = cache_dir .. "/workspace/" .. project_name
local lombok_dir = jars_dir .. "/javaagents/lombok.jar"

config.cmd = {
	"java",
	"-Declipse.application=org.eclipse.jdt.ls.core.id1",
	"-Dosgi.bundles.defaultStartLevel=4",
	"-Declipse.product=org.eclipse.jdt.ls.core.product",
	"-Dlog.protocol=true",
	"-Dlog.level=ALL",
	"-Dosgi.sharedConfiguration.area=" .. config_dir,
	"-Dosgi.sharedConfiguration.area.readOnly=true",
	"-Dosgi.checkConfiguration=true",
	"-Dosgi.configuration.cascaded=true",
	"-Xmx1g",
	"--add-modules=ALL-SYSTEM",
	"--add-opens",
	"java.base/java.util=ALL-UNNAMED",
	"--add-opens",
	"java.base/java.lang=ALL-UNNAMED",
	"-javaagent:" .. lombok_dir,
	"-jar",
	jdtls_jar_path,
	"-data",
	workspace_dir,
	"-configuration",
	cache_dir .. "/config_linux",
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
