require("mini.ai").setup()
require("mini.pairs").setup()
require("mini.surround").setup()
require("mini.comment").setup()
require("mini.splitjoin").setup()
require("mini.icons").setup()
require("mini.ai").setup()
require("mini.move").setup()
require("mini.operators").setup({
	replace = {
		prefix = "gR",
	},
})
require("mini.files").setup({
	mappings = {
		go_in_plus = vim.g.rightkey,
		go_out_plus = vim.g.leftkey,
		go_in = "<S-" .. vim.g.rightkey .. ">",
		go_out = "<S-" .. vim.g.leftkey .. ">",
		synchronize = "<leader>w",
		reveal_cwd = "<leader>d",
		["<rightkey>"] = "go_in",
		["<leftkey>"] = "go_out",
	},

	windows = {
		preview = true,
		width_preview = 80,
	},
})

local wk = require("which-key")
wk.add({
	{
		"<leader>e",
		"<CMD>lua require('mini.files').open(vim.api.nvim_buf_get_name(0), true)<CR>",
		desc = "Open mini files (current directory)",
	},
	{
		"<leader>E",
		"<CMD>lua require('mini.files').open(vim.uv.cwd(), true)<CR>",
		desc = "Open mini files (cwd)",
	},
})
