local wk = require('which-key')

vim.keymap.set({ 'n', 'v' }, '<leader>w', ":write<CR>", { desc = 'Save buffer' })
vim.keymap.set({ 'n', 'v' }, '<leader>j', ':', { remap = true, desc = 'Set command line' })

wk.add({
	{ '<leader>q',  group = 'Quit' },
	{ '<leader>qq', ':qa<CR>',     desc = 'Normal quit' },
	{ '<leader>q!', ':q!<CR>',     desc = 'Force quit' },
	{ '<leader>qw', ':wqa<CR>',    desc = 'Save buffers and quit' }
})
