return {
	{
		"mfussenegger/nvim-jdtls",
		ft = "java",
		config = function()
			local opts = {
				cmd = { 'jdtls' },
				root_dir = vim.fs.dirname(vim.fs.find({ ".git", "mvnw" }, { upward = true })[1]),
			}

			require("jdtls").start_or_attach(opts)
		end,
		dependencies = {
			"mason-org/mason.nvim",
			opts = {
				registries = {
					'github:nvim-java/mason-registry',
					'github:mason-org/mason-registry',
				}
			},
		}
	},
}
