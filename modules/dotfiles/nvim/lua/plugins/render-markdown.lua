return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			preset = "obsidian",
			completions = { lsp = { enabled = true } },
		},
	},
}
