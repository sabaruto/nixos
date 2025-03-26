local builtin = require('telescope.builtin')
local projects = require('telescope').extensions.projects
vim.opt.expandtab = true
vim.opt.shiftwidth = 2

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fs', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })


-- Projects
vim.keymap.set('n', '<leader>fp', projects.projects, { desc = 'Telescope switch project' })

-- Git
vim.keymap.set('n', '<leader>fgf', builtin.git_files, { desc = 'Telescope project file' })
vim.keymap.set('n', '<leader>fgc', builtin.git_commits, { desc = 'Telescope git commits' })
vim.keymap.set('n', '<leader>fgb', builtin.git_branches, { desc = 'Telescope git branches' })
vim.keymap.set('n', '<leader>fgs', builtin.git_status, { desc = 'Telescope git status' })

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
