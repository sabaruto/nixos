return {
	{
		"mfussenegger/nvim-jdtls",
		ft = "java",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		opts = {
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

					-- runtimes = {
					-- 	{
					-- 		name = "JavaSE-24",
					-- 		path = vim.fn.glob("/nix/store/*-temurin-bin-24.0.0")
					-- 	}
					-- }
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
				capabilities = {
					workspace = {
						configuration = true,
						didChangeWatchedFiles = {
							dynamicRegistration = true,
						},
						didChangeWorkspaceFolders = {
							dynamicRegistration = true,
						},
					},
				},
			},
			signatureHelp = { enabled = true },
		},

		config = function(_, opts)
			local home = os.getenv("HOME")
			local nixos_dir = home .. "/github.com/sabaruto/nixos"
			local jars_dir = nixos_dir .. "/tools/java/jars"
			local jdtls_root = os.getenv("JDTLS_HOME")

			local config_dir = jdtls_root .. "/share/java/jdtls/config_linux"
			local jdtls_jar_path = vim.split(
				vim.fn.glob(jdtls_root .. "/share/java/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
				"\n"
			)[1]
			local cache_dir = home .. "/.cache/jdtls"

			local cwd = vim.fn.getcwd()
			local project_name = vim.fn.fnamemodify(cwd, ":p:h:t")
			local workspace_dir = cache_dir .. "/workspace/" .. project_name
			local lombok_dir = jars_dir .. "/javaagents/lombok.jar"
			local config = {}

			config.on_attach = function(_, _)
				require("jdtls.setup").add_commands()
				require("jdtls").setup_dap()
			end

			config.settings = opts
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
			config["init_options"] = {
				bundles = bundles,
			}

			local extendedClientCapabilities = require("jdtls").extendedClientCapabilities
			extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

			config["init_options"] = {
				bundles = bundles,
				extendedClientCapabilities = extendedClientCapabilities,
			}

			config.on_init = function(client, _)
				client.notify("workspace/didChangeConfiguration", { settings = config.settings })
			end

			local function attach_jdtls()
				require("jdtls").start_or_attach(config)
			end

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "java",
				callback = attach_jdtls,
			})

			attach_jdtls()
		end,
	},
}
