return {
	{
		"mfussenegger/nvim-jdtls",
		ft = "java",

		config = function(_, _)
			local home = os.getenv("HOME")
			local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
			local workspace_dir = vim.fn.expand '~' .. '/.cache/jdtls/workspace/' .. project_name

			-- Determine OS
			local os_config = "linux"
			if vim.fn.has("mac") == 1 then
				os_config = "mac"
			end

			local opts = {
				cmd = {
					"java",
					"-Declipse.application=org.eclipse.jdt.ls.core.id1",
					"-Dosgi.bundles.defaultStartLevel=4",
					"-Declipse.product=org.eclipse.jdt.ls.core.product",
					"-Dlog.protocol=true",
					"-Dlog.level=ALL",
					"-Xms1g",
					"--add-modules=ALL-SYSTEM",
					"--add-opens",
					"java.base/java.util=ALL-UNNAMED",
					"--add-opens",
					"java.base/java.lang=ALL-UNNAMED",
					"-javaagent:" .. home .. "/.local/share/nvim/mason/packages/jdtls/lombok.jar",
					"-jar",
					vim.fn.glob(home ..
						"/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
					"-configuration",
					home .. "/.local/share/nvim/mason/packages/jdtls/config_" .. os_config,
					"-data",
					workspace_dir,
				},
				root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew" }),
				bundles = {},
			}

			require("jdtls").start_or_attach(opts)
		end,
	},
}
