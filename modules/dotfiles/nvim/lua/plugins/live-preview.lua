return {
	{
		'brianhuster/live-preview.nvim',
		dependencies = {
			'nvim-telescope/telescope.nvim',
		},
		config = function(_, opts)
			require("livepreview.config").set(opts)
		end,
		keys = {
			{ "<localleader>v", "<cmd>LivePreview pick<cr>", ft = "markdown",          desc = "LivePreview pick" },
			{ "<leader>sm",     "<cmd>LivePreview pick<cr>", desc = "LivePreview pick" }
		},
	}
}
