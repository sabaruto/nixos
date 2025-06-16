return {
	{
		"jay-babu/mason-null-ls.nvim",
		enabled = false,
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"mason-org/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		opts = {
			automatic_installation = true,
			handlers = {},
		},
	}
}
