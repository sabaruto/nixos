return {
	{
		{
			"3rd/image.nvim",
			enabled = false,
			build = false,
			opts = {
				backend = "kitty",
				processor = "magick_cli",

				integrations = {
					markdown = {
						only_render_image_at_cursor = true,
					},
				},
			},
		},
	},
	{
		"3rd/diagram.nvim",
		dependencies = {
			"3rd/image.nvim",
		},
		enabled = false,
		opts = {
			events = {
				render_buffer = { "InsertLeave", "BufWinEnter", "TextChanged" },
				clear_buffer = { "BufLeave" },
			},
			renderer_options = {
				mermaid = {
					background = nil, -- nil | "transparent" | "white" | "#hex"
					theme = "default", -- nil | "default" | "dark" | "forest" | "neutral"
					scale = 1, -- nil | 1 (default) | 2  | 3 | ...
					width = nil, -- nil | 800 | 400 | ...
					height = nil, -- nil | 600 | 300 | ...
				},
				plantuml = {
					charset = nil,
				},
				d2 = {
					theme_id = nil,
					dark_theme_id = nil,
					scale = nil,
					layout = nil,
					sketch = nil,
				},
				gnuplot = {
					size = nil, -- nil | "800,600" | ...
					font = nil, -- nil | "Arial,12" | ...
					theme = nil, -- nil | "light" | "dark" | custom theme string
				},
			},
		},

		config = function(_, opts)
			table.insert(opts, {
				integrations = {
					require("diagram.integrations.markdown"),
				},
			})
			require("diagram").setup(opts)
		end,
	},
}
