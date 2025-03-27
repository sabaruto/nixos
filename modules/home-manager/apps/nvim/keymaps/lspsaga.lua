local wk = require('which-key')
local ls = require('lspsaga')

ls.setup({
  diagnostic = {
    keys = {
      quit = { 'q', '<ESC>' }
    }
  },
})

wk.add({
  { "<leader>l",  group = "Lspsaga" },
  { "<leader>lc", "<cmd>Lspsaga code_action<cr>",     desc = "Code Action" },
  { "<leader>ld", "<cmd>Lspsaga goto_definition<cr>", desc = "Go to definition" },
  { "<leader>lf", "<cmd>Lspsaga finder<cr>",          desc = "Finder" },
  { "<leader>lo", "<cmd>Lspsaga outline<cr>",         desc = "Outline" },
  { "<leader>lp", "<cmd>Lspsaga peek_definition<cr>", desc = "Peek definition" },
  { "<leader>lr", "<cmd>Lspsaga rename<cr>",          desc = "Rename" },
  { "<leader>lt", "<cmd>Lspsaga term_toggle<cr>",     desc = "Toggle terminal" },
})

wk.add({
  { "<leader>ld",  group = "diagnostic" },
  { "<leader>ldw", "<cmd>Lspsaga show_workspace_diagnostics<cr>", desc = "Show Workspace Diagnostics" },
  { "<leader>ldc", "<cmd>Lspsaga show_cursor_diagnostics<cr>",    desc = "Show cursor Diagnostics" },
})
