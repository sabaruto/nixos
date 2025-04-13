vim.g.mapleader = " "

-- Visual settings
vim.opt.smarttab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.autoindent = true
vim.opt.termguicolors = true
vim.opt.conceallevel = 2

-- [[          Keybindings          ]]
local wk = require('which-key')

-- Windows

wk.add({
	mode = { "n", "v" },
	{
		{ "<leader>x",  proxy = "<C-w>",   group = "Windows" },
		{ "<leader>x-", '<cmd>split<CR>',  desc = "Horizontal Split" },
		{ "<leader>x|", '<cmd>vsplit<CR>', desc = "Vertical Split" },
		{ "<leader>xh", '<cmd>split<CR>',  desc = "[H]orizontal Split" },
		{ "<leader>xv", '<cmd>vsplit<CR>', desc = "[V]ertical Split" },
		{ "<leader>xq", '<cmd>quit<CR>',   desc = "[Q]uit Window" }
	}
})
