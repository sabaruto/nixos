local wk = require('which-key')

wk.add({
    { '<leader>q',  group = 'Quit' },
    { '<leader>qq', ':qa',         desc = 'Normal quit' },
    { '<leader>q!', ':q!',         desc = 'Force quit' },
    { '<leader>qw', ':wqa',        desc = 'Save buffers and quit' }

  },
  {
    { '<leader>s', '<cmd>write<cr>', desc = 'Save buffer' },
    { '<leader>j', ':',              silent = true },
  })




vim.g.mapleader = ' '
