return {
	{
		"mfussenegger/nvim-jdtls",
		ft = "java",
		dependencies = {
			"mfussenegger/nvim-dap"
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
						globalSettings = os.getenv("HOME") .. "/.m2/settings.xml"
					},

					-- runtimes = {
					-- 	{
					-- 		name = "JavaSE-24",
					-- 		path = vim.fn.glob("/nix/store/*-temurin-bin-24.0.0")
					-- 	}
					-- }
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
				capabilities = {
					workspace = {
						configuration = true,
						didChangeWatchedFiles = {
							dynamicRegistration = true
						},
						didChangeWorkspaceFolders = {
							dynamicRegistration = true
						}
					}
				}
			},
			signatureHelp = { enabled = true },
		},

		config = function(_, opts)
			local home = os.getenv("HOME")
			local nixos_dir = home .. "/github.com/sabaruto/nixos"
			local jars_dir = nixos_dir .. "/tools/java/jars"

			local jdtls_dir = vim.split(vim.fn.glob("/nix/store/*-jdt-language-server-*/bin/jdtls"), "\n")[1]
			local cache_dir = home .. "/.cache/jdtls"
			local config_dir = cache_dir .. "/config"

			local cwd = vim.fn.getcwd()
			local project_name = vim.fn.fnamemodify(cwd, ':p:h:t')
			local workspace_dir = cache_dir .. '/workspace/' .. project_name
			local lombok_dir = jars_dir .. "/lombok.jar"
			local config = {}

			config.on_attach = function(_, _)
				require("jdtls.setup").add_commands()
				require("jdtls").setup_dap()
			end

			config.settings = opts
			config.cmd = {
				jdtls_dir,
				-- "-configuration",
				-- config_dir,
				"-data",
				workspace_dir,
				"--jvm-arg=-javaagent:" .. lombok_dir,
			}

			local bundles = {}

			vim.list_extend(bundles,
				vim.split(vim.fn.glob(jars_dir .. "/bundles/*.jar", 1), "\n"))
			config['init_options'] = {
				bundles = bundles,
			}

			local extendedClientCapabilities = require('jdtls').extendedClientCapabilities
			extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

			config['init_options'] = {
				bundles = bundles,
				extendedClientCapabilities = extendedClientCapabilities,
			}

			config.on_init = function(client, _)
				client.notify('workspace/didChangeConfiguration', { settings = config.settings })
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
