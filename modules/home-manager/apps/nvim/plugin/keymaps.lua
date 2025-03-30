local wk = require('which-key')

vim.keymap.set({ 'n', 'v' }, '<leader>w', '<cmd>write<cr>', { desc = 'Save buffer' })
vim.keymap.set({ 'n', 'v' }, '<leader>j', ':', { remap = true, desc = 'Set command line' })

wk.add({
  { '<leader>q',  group = 'Quit' },
  { '<leader>qq', '<cmd>qa<CR>',  desc = 'Normal quit' },
  { '<leader>q!', '<cmd>q!<CR>',  desc = 'Force quit' },
  { '<leader>qw', '<cmd>wqa<CR>', desc = 'Save buffers and quit' }
})
