return {
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		enabled = false,
		version = "*",

		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons",
		},

		opts = {
			context_follow_icon_color = true,
			show_modified = true,
		},
	}
}
