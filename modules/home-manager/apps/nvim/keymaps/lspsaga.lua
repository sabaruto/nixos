local wk = require('which-key')

wk.add({
  { "<leader>l",  group = "Lspsaga" },
  { "<leader>lc", "<cmd>Lspsaga code_action<cr>",              desc = "Code Action" },
  { "<leader>ld", "<cmd>Lspsaga goto_definition<cr>",          desc = "Go to definition" },
  { "<leader>lf", "<cmd>Lspsaga finder<cr>",                   desc = "Code Action" },
  { "<leader>lo", "<cmd>Lspsaga outline<cr>",                  desc = "Outline" },
  { "<leader>lp", "<cmd>Lspsaga preview_definition<cr>",       desc = "Preview definition" },
  { "<leader>lr", "<cmd>Lspsaga rename<cr>",                   desc = "Rename" },
  { "<leader>ls", "<cmd>Lspsaga signature_help<cr>",           desc = "Signature help" },
  { "<leader>lw", "<cmd>Lspsaga show_workspace_diagnosis<cr>", desc = "Show Workspace Diagnosis" },
})
