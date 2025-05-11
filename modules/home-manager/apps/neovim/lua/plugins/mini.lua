return {
	{ 'echasnovski/mini.ai',        version = false, config = true },
	{ 'echasnovski/mini.pairs',     version = false, config = true },
	{ 'echasnovski/mini.operators', version = false, config = true },
	{ "echasnovski/mini.surround",  version = false, config = true },
	{ "echasnovski/mini.comment",   version = false, config = true },
	{ "echasnovski/mini.splitjoin", version = false, config = true },
	{ "echasnovski/mini.jump",      version = false, config = true },
	{ "echasnovski/mini.icons",     version = false, config = true },
	{ 'echasnovski/mini.jump2d',    version = false, config = true },
	{ 'echasnovski/mini.map',       version = false, config = true },
	{
		'echasnovski/mini.bufremove',
		version = false,
		config = true,
		keys = {
			{ "<leader>bd", function() require("mini.bufremove").delete() end, desc = "Delete buffer" },
		},
	},
	{
		'echasnovski/mini.files',
		version = false,
		opts = {
			mappings = {
				go_in = "l",
				go_in_plus = "<S-l>",
				go_out = "h",
				go_out_plus = "<S-h>",
			},

			windows = {
				preview = true,
			},
		},
		keys = function()
			local mf = require("mini.files")
			return {
				{ "<leader>fe", function() mf.open() end, desc = "Open mini files" },
			}
		end
	},
	{
		'echasnovski/mini.move',
		version = false,
		opts = function(opts)
			local ml = vim.g.createmapleader("move", "<leader>m")

			if opts == nil then
				opts = { mappings = {} }
			end

			opts.mappings = {
				left = ml .. 'h',
				right = ml .. 'l',
				up = ml .. 'k',
				down = ml .. 'j',

				line_left = ml .. 'h',
				line_right = ml .. 'l',
				line_up = ml .. 'k',
				line_down = ml .. 'j',
			}

			return opts
		end,
	},
}
