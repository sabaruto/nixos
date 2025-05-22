return {
	-- {
	-- 	"nvim-java/nvim-java",
	-- 	opts = {
	-- 		root_markers = {
	-- 			'settings.gradle',
	-- 			'settings.gradle.kts',
	-- 			'pom.xml',
	-- 			'build.gradle',
	-- 			'mvnw',
	-- 			'gradlew',
	-- 			'build.gradle',
	-- 			'build.gradle.kts'
	-- 		},
	-- 	},
	-- 	config = function(_, opts)
	-- 		require('java').setup(opts)
	-- 	end,
	-- 	dependencies = {
	-- 		"mason-org/mason.nvim",
	-- 		"mason-org/mason-lspconfig.nvim",
	-- 		"neovim/nvim-lspconfig",
	-- 		"mfussenegger/nvim-dap"
	-- 	},
	-- },
	{
		"mfussenegger/nvim-jdtls",
		ft = "java",
		config = function()
			local opts = {
				cmd = { 'jdtls' },
				root_dir = vim.fs.dirname(vim.fs.find({ ".git", "mvnw" }, { upward = true })[1]),
			}

			require("jdtls").start_or_attach(opts)
		end
	},
	{
		"mason-org/mason.nvim",
		opts = {
			registries = {
				'github:nvim-java/mason-registry',
				'github:mason-org/mason-registry',
			}
		},
	}
}
