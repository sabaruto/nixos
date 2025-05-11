return {
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = {
			theme = "gruvbox",
			always_divide_middle = false,
			globalstatus = true,

			tabline = {
				lualine_a = {
					{
						'tabs',
						mode = 2,
						path = 0,
						use_mode_colors = true,
					},
					{
						'diagnostics',
						colored = false,
					},
				},
			},
		},
	}
}
