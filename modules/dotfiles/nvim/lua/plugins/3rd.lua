return {
	{
		{
			"3rd/image.nvim",
			enabled = true,
			build = false,
			opts = {
				-- backend = "ueberzug",
				processor = "magick_cli",
			},
		},
	},
	{
		"3rd/diagram.nvim",
		dependencies = {
			"3rd/image.nvim",
		},
		enabled = true,

		opts = {
			renderer_options = {
				mermaid = {
					background = "white", -- nil | "transparent" | "white" | "#hex"
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
