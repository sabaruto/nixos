if vim.g.neovide then
	vim.o.guifont = "FiraCode_Nerd_Font:h14"
	vim.keymap.set('n', '<C-S-w>', ':w<CR>')   -- Save
	vim.keymap.set('v', '<C-S-C>', '"+y')      -- Copy
	vim.keymap.set('n', '<C-S-V>', '"+P')      -- Paste normal mode
	vim.keymap.set('v', '<C-S-V>', '"+P')      -- Paste visual mode
	vim.keymap.set('c', '<C-S-V>', '<C-R>+')   -- Paste command mode
	vim.keymap.set('i', '<C-S-V>', '<ESC>l"+Pli') -- Paste insert mode
end
