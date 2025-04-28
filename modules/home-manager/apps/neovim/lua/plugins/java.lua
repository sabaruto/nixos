return {
	{
		"mfussenegger/nvim-jdtls",
		ft = "java",
		opts = {
			cmd = { "jdtls" },
		},

		config = function(_, opts)
			vim.lsp.enable("jdtls")
			require("jdtls").start_or_attach(opts)
		end
	}
}
