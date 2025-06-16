return {
	{ 'echasnovski/mini.ai',    version = false, config = true },
	{ 'echasnovski/mini.pairs', version = false, config = true },
	{
		'echasnovski/mini.operators',
		version = false,
		opts = {
			replace = {
				prefix = "gR",
			},
		},
	},
	{ "echasnovski/mini.surround",    version = false, config = true },
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
				go_in = "<S-" .. vim.g.rightkey .. ">",
				go_out = "<S-" .. vim.g.leftkey .. ">",
				synchronize = "<leader>w",
				reveal_cwd = "<leader>d",
				["<rightkey>"] = "go_in",
				["<leftkey>"] = "go_out"
			},

			windows = {
				preview = true,
				width_preview = 80,
			},
		},
		keys = {
			{ "<leader>e", "<CMD>lua require('mini.files').open(vim.api.nvim_buf_get_name(0), true)<CR>", desc = "Open mini files (current directory)" },
			{ "<leader>E", "<CMD>lua require('mini.files').open(vim.uv.cwd(), true)<CR>",                 desc = "Open mini files (cwd)" },
		}
	},
	{
		'echasnovski/mini.move',
		version = false,
		opts = true,
	},
}
