return {
	{ 'echasnovski/mini.ai',        version = false, config = true },
	{ 'echasnovski/mini.pairs',     version = false, config = true },
	{ 'echasnovski/mini.operators', version = false, config = true },
	{ "echasnovski/mini.surround",  version = false, config = true },
	{ "echasnovski/mini.comment",   version = false, config = true },
	{ "echasnovski/mini.splitjoin", version = false, config = true },
	{ "echasnovski/mini.icons",     version = false, config = true },
	{ 'echasnovski/mini.jump2d',    version = false, config = true },
	{ 'echasnovski/mini.map',       version = false, config = true },
	{
		"echasnovski/mini.jump",
		version = false,
		opts = {
			mappings = { repeat_jump = 'h' },
		},
	},
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
				go_in = vim.g.rightkey,
				go_in_plus = "<S-" .. vim.g.rightkey .. ">",
				go_out = vim.g.leftkey,
				go_out_plus = "<S-" .. vim.g.leftkey .. ">",
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
				left = ml .. vim.g.leftkey,
				right = ml .. vim.g.rightkey,
				up = ml .. vim.g.upkey,
				down = ml .. vim.g.downkey,

				line_left = ml .. vim.g.leftkey,
				line_right = ml .. vim.g.rightkey,
				line_up = ml .. vim.g.upkey,
				line_down = ml .. vim.g.downkey,
			}

			return opts
		end,
	},
}
