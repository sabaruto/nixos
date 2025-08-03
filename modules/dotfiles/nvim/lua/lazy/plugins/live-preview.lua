return {
	{
		"brianhuster/live-preview.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		config = true,
		ft = { "markdown" },
		keys = {
			{ "<localleader>v", "<cmd>LivePreview pick<cr>", ft = "markdown", desc = "LivePreview pick" },
			{ "<leader>sm", "<cmd>LivePreview pick<cr>", desc = "LivePreview pick" },
		},
	},
}
