-- Buffers
vim.keymap.set({ "n", "v" }, "<leader>w", ":write<CR>", { desc = "Save buffer" })
vim.keymap.set({ "n", "v" }, "<leader>j", ":", { remap = true, desc = "Set command line" })

-- Quitting
vim.keymap.set({ "n", "v" }, "<leader>qq", ":qa<CR>", { desc = "Normal quit" })
vim.keymap.set({ "n", "v" }, "<leader>q!", ":q!<CR>", { remap = true, desc = "Force quit" })
vim.keymap.set({ "n", "v" }, "<leader>qw", ":wqa<CR>", { remap = true, desc = "Save buffers and quit" })

-- Windows
vim.keymap.set({ "n", "v" }, "<leader>x-", ":split<CR>", { desc = "Horizontal Split" })
vim.keymap.set({ "n", "v" }, "<leader>x|", ":vsplit<CR>", { desc = "Vertical Split" })
vim.keymap.set({ "n", "v" }, "<leader>xh", ":split<CR>", { desc = "[H]orizontal Split" })
vim.keymap.set({ "n", "v" }, "<leader>xv", ":vsplit<CR>", { desc = "[V]ertical Split" })
vim.keymap.set({ "n", "v" }, "<leader>xd", ":quit<CR>", { desc = "[D]elete Window" })

-- Tabs
vim.keymap.set({ "n" }, "<leader><tab>a", ":tabnew<CR>", { desc = "[A]dd new tab" })
vim.keymap.set({ "n" }, "<leader><tab><left>", ":-tabnext<cr>", { desc = "prev tab" })
vim.keymap.set({ "n" }, "<leader><tab><right>", ":+tabnext<cr>", { desc = "next tab" })
vim.keymap.set({ "n" }, "<leader><tab>d", ":tabclose<CR>", { desc = "[D]elete tab" })
