return {
	{
		"mfussenegger/nvim-jdtls",
		ft = "java",

		config = function(_, _)
			local home = os.getenv("HOME")

			local cache_dir = home .. "/.cache/jdtls"
			local config_dir = cache_dir .. "/config"

			local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
			local workspace_dir = cache_dir .. '/workspace/' .. project_name

			local lombok_dir = vim.fn.glob("/nix/store/*-lombok-*/share/java/lombok.jar")

			local config = {
				cmd = {
					"jdtls",
					"-configuration",
					config_dir,
					"-data",
					workspace_dir,
					"--jvm-arg=-javaagent:" .. lombok_dir
				},
				root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew" }),
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
