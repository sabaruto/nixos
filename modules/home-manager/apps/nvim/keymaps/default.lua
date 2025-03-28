local wk = require('which-key')

wk.add({
  { '<leader>s', '<cmd>write<cr>', desc = 'Save buffer' },
  { '<leader>j', ':' }
})

wk.add({
  { '<leader>q',  group = 'Quit' },
  { '<leader>qq', '<cmd>qa<CR>',  desc = 'Normal quit' },
  { '<leader>q!', '<cmd>q!<CR>',  desc = 'Force quit' },
  { '<leader>qw', '<cmd>wqa<CR>', desc = 'Save buffers and quit' }
})
