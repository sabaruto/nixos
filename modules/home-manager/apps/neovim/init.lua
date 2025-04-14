-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)

vim.g.mapleader = " "
vim.g.maplocalleader = "<Enter>"

vim.opt.smarttab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.autoindent = true
vim.opt.termguicolors = true
vim.opt.conceallevel = 2

vim.o.updatetime = 250
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
	callback = function()
		vim.diagnostic.open_float(nil, { focus = false })
	end
})

-- Buffers
vim.keymap.set({ 'n', 'v' }, '<leader>w', ":write<CR>", { desc = 'Save buffer' })
vim.keymap.set({ 'n', 'v' }, '<leader>j', ':', { remap = true, desc = 'Set command line' })

-- Quitting
vim.keymap.set({ 'n', 'v' }, '<leader>qq', ':qa<CR>', { desc = 'Normal quit' })
vim.keymap.set({ 'n', 'v' }, '<leader>q!', ':q!<CR>', { remap = true, desc = 'Force quit' })
vim.keymap.set({ 'n', 'v' }, '<leader>qw', ':wqa<CR>', { remap = true, desc = 'Save buffers and quit' })

-- Windows
vim.keymap.set({ 'n', 'v' }, "<leader>x-", ':split<CR>', { desc = "Horizontal Split" })
vim.keymap.set({ 'n', 'v' }, "<leader>x|", ':vsplit<CR>', { desc = "Vertical Split" })
vim.keymap.set({ 'n', 'v' }, "<leader>xh", ':split<CR>', { desc = "[H]orizontal Split" })
vim.keymap.set({ 'n', 'v' }, "<leader>xv", ':vsplit<CR>', { desc = "[V]ertical Split" })
vim.keymap.set({ 'n', 'v' }, "<leader>xq", ':quit<CR>', { desc = "[Q]uit Window" })

require("config.lazy")
