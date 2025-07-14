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
					organizeImports = true,
					cleanup = true,
				},
				configuration = {
					updateBuildConfiguration = "interactive",

					maven = {
						globalSettings = os.getenv("HOME") .. "/.m2/settings.xml"
					},

					runtimes = {
						{
							name = "JavaSE-24",
							path = vim.fn.glob("/nix/store/*-temurin-bin-24.0.0")
						}
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
					enabled = false,
					settings = {
						profile = "IntelliJ",
						url =
							os.getenv("HOME") .. "/.m2/formatter.xml",
					}
				}
			},
			signatureHelp = { enabled = true },
		},

		config = function(_, opts)
			local home = os.getenv("HOME")

			local jdtls_dir = vim.fn.glob("/nix/store/*-jdt-language-server-*/bin/jdtls")

			local cache_dir = home .. "/.cache/jdtls"
			local config_dir = cache_dir .. "/config"

			local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
			local workspace_dir = cache_dir .. '/workspace/' .. project_name

			local lombok_dir = vim.fn.glob("/nix/store/*-lombok-*/share/java/lombok.jar")

			local config = {}
			config.settings = opts
			config.cmd = {
				jdtls_dir,
				"-configuration",
				config_dir,
				"-data",
				workspace_dir,
				"--jvm-arg=-javaagent:" .. lombok_dir,
			}

			local bundles = {
				vim.fn.glob("/nix/store/*-java-debug-*/share/java/java-debug.jar"),
			}

			vim.list_extend(bundles,
				vim.split(vim.fn.glob(home .. "/github.com/microsoft/vscode-java-test/server/*.jar", 1), "\n"))
			config['init_options'] = {
				bundles = bundles,
			}

			config['init_options'] = {
				bundles = bundles,
			}

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
