return {
	{
		"mfussenegger/nvim-jdtls",
		ft = "java",
		opts = {
			cmd = { "jdtls" },
			root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew" }),
		},

		config = function(_, opts)
			require("jdtls").start_or_attach(opts)
		end
	}
}
