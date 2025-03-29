local builtin = require('telescope.builtin')
vim.opt.expandtab = true
vim.opt.shiftwidth = 2

-- LSP
vim.keymap.set('n', '<leader>flr', builtin.lsp_references, { desc = 'Telescope lsp references' })
vim.keymap.set('n', '<leader>flci', builtin.lsp_incoming_calls, { desc = 'Telescope lsp incoming calls' })
vim.keymap.set('n', '<leader>flco', builtin.lsp_outgoing_calls, { desc = 'Telescope lsp outgoing calls' })
vim.keymap.set('n', '<leader>flsf', builtin.lsp_document_symbols, { desc = 'Telescope lsp symbols in file' })
vim.keymap.set('n', '<leader>flsp', builtin.lsp_workspace_symbols, { desc = 'Telescope lsp symbols in workspace' })
vim.keymap.set('n', '<leader>fli', builtin.lsp_implementations, { desc = 'Telescope lsp implementations' })
vim.keymap.set('n', '<leader>fldd', builtin.lsp_definitions, { desc = 'Telescope lsp definitions' })
vim.keymap.set('n', '<leader>fldt', builtin.lsp_type_definitions, { desc = 'Telescope lsp type definitions' })
vim.keymap.set('n', '<leader>fle', builtin.diagnostics, { desc = 'Telescope lsp diagnosis' })
