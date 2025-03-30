local builtin = require('telescope.builtin')
local wk = require('which-key')

-- LSP
vim.keymap.set('n', '<leader>lr', builtin.lsp_references, { desc = 'Telescope lsp references' })
vim.keymap.set('n', '<leader>lci', builtin.lsp_incoming_calls, { desc = 'Telescope lsp incoming calls' })
vim.keymap.set('n', '<leader>lco', builtin.lsp_outgoing_calls, { desc = 'Telescope lsp outgoing calls' })
vim.keymap.set('n', '<leader>lsf', builtin.lsp_document_symbols, { desc = 'Telescope lsp symbols in file' })
vim.keymap.set('n', '<leader>lsp', builtin.lsp_workspace_symbols, { desc = 'Telescope lsp symbols in workspace' })
vim.keymap.set('n', '<leader>li', builtin.lsp_implementations, { desc = 'Telescope lsp implementations' })
vim.keymap.set('n', '<leader>ldd', builtin.lsp_definitions, { desc = 'Telescope lsp definitions' })
vim.keymap.set('n', '<leader>ldt', builtin.lsp_type_definitions, { desc = 'Telescope lsp type definitions' })
vim.keymap.set('n', '<leader>le', builtin.diagnostics, { desc = 'Telescope lsp diagnosis' })
