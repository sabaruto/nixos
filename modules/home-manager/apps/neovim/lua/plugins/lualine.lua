return {
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = {
			options = {
				always_divide_middle = false,
				globalstatus = true,
			},

			tabline = {
				lualine_a = { 'mode' },
				lualine_b = {
					{
						'tabs',
						mode = 2,
						path = 0,
						use_mode_colors = true,
					},
				},
				lualine_c = {
					{
						'diff',
						'diagnostics',
					},
				},
				lualine_x = { 'branch' },
				lualine_y = { { "buffers", } },
			},
		},
	}
}
