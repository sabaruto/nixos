return {
	{ 'echasnovski/mini.ai',        version = false, config = true },
	{ 'echasnovski/mini.pairs',     version = false, config = true },
	{ 'echasnovski/mini.operators', version = false, config = true },
	{
		"echasnovski/mini.surround",
		version = false,
		opts = {
			replace = {
				prefix = 'gR'
			},
		}
	},
	{ "echasnovski/mini.comment",     version = false, config = true },
	{ "echasnovski/mini.splitjoin",   version = false, config = true },
	{ "echasnovski/mini.icons",       version = false, config = true },
	{ 'echasnovski/mini.indentscope', version = false, config = true },
	{ 'echasnovski/mini.map',         version = false, config = true },
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
				go_in_plus = vim.g.rightkey,
				go_out_plus = vim.g.leftkey,
				go_in = "",
				go_out = "",
				["<rightkey>"] = "go_in"
			},

			windows = {
				preview = true,
				width_preview = 80,
			},
		},
		keys = function()
			local mf = require("mini.files")
			return {
				{
					"<leader>se",
					function()
						mf.open(vim.fn.bufname())
						mf.reveal_cwd()
					end,
					desc = "Open mini files"
				},
			}
		end
	},
	{
		'echasnovski/mini.move',
		version = false,
		opts = true,
	},
}
