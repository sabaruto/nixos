-- local values
local leftkey = vim.g.leftkey
local downkey = vim.g.downkey
local upkey = vim.g.upkey
local rightkey = vim.g.rightkey

-- Commands
vim.keymap.set({ "n", "v" }, "<leader>j", ":", { remap = true, desc = "Set command line" })

-- Movement
vim.keymap.set({ "n", "x" }, leftkey, "h", { silent = true })
vim.keymap.set({ "n", "x" }, downkey, "j", { silent = true })
vim.keymap.set({ "n", "x" }, upkey, "k", { silent = true })
vim.keymap.set({ "n", "x" }, rightkey, "l", { silent = true })

vim.keymap.set("i", "<C-" .. leftkey .. ">", "<left>", { silent = true })
vim.keymap.set("i", "<C-" .. downkey .. ">", "<down>", { silent = true })
vim.keymap.set("i", "<C-" .. upkey .. ">", "<up>", { silent = true })
vim.keymap.set("i", "<C-" .. rightkey .. ">", "<right>", { silent = true })

-- Buffers
vim.keymap.set({ "n", "v" }, "<leader>w", "<cmd>write<cr>", { desc = "Save buffer", silent = true })

-- Quitting
local ql = vim.g.createmapleader("quit", "<leader>q")

vim.keymap.set({ "n", "v" }, ql .. "q", "<cmd>qa<cr>", { desc = "Normal quit" })
vim.keymap.set({ "n", "v" }, ql .. "!", "<cmd>q!<cr>", { remap = true, desc = "Force quit" })
vim.keymap.set({ "n", "v" }, ql .. "w", "<cmd>wqa<cr>", { remap = true, desc = "Save buffers and quit" })

-- Windows
local wl = vim.g.createmapleader("windows", "<leader>x")

vim.keymap.set({ "n", "v" }, wl .. "d", "<cmd>quit<cr>", { desc = "[D]elete Window" })

vim.keymap.set({ "n", "v" }, wl .. "-", "<cmd>split<cr>", { desc = "Horizontal Split" })
vim.keymap.set({ "n", "v" }, wl .. "h", "<cmd>split<cr>", { desc = "[H]orizontal Split" })
vim.keymap.set({ "n", "v" }, wl .. "v", "<cmd>vsplit<cr>", { desc = "[V]ertical Split" })
vim.keymap.set({ "n", "v" }, wl .. "|", "<cmd>vsplit<cr>", { desc = "Vertical Split" })
vim.keymap.set({ "n", "v" }, "<leader>-", "<cmd>split<cr>", { desc = "Horizontal Split" })
vim.keymap.set({ "n", "v" }, "<leader>|", "<cmd>vsplit<cr>", { desc = "Vertical Split" })

vim.keymap.set({ "n" }, wl .. leftkey, "<cmd>wincmd h<cr>", { silent = true, desc = "Move window left" })
vim.keymap.set({ "n" }, wl .. downkey, "<cmd>wincmd j<cr>", { silent = true, desc = "Move window down" })
vim.keymap.set({ "n" }, wl .. rightkey, "<cmd>wincmd l<cr>", { silent = true, desc = "Move window right" })
vim.keymap.set({ "n" }, wl .. upkey, "<cmd>wincmd k<cr>", { silent = true, desc = "Move window up" })

vim.keymap.set({ "n" }, wl .. "<down>", "<cmd>wincmd j<cr>", { silent = true, desc = "Move window down" })
vim.keymap.set({ "n" }, wl .. "<left>", "<cmd>wincmd h<cr>", { silent = true, desc = "Move window left" })
vim.keymap.set({ "n" }, wl .. "<right>", "<cmd>wincmd l<cr>", { silent = true, desc = "Move window right" })
vim.keymap.set({ "n" }, wl .. "<up>", "<cmd>wincmd k<cr>", { silent = true, desc = "Move window up" })

-- Tabs
local tl = vim.g.createmapleader("tab", "<leader><tab>")

vim.keymap.set({ "n" }, tl .. "a", "<cmd>tabnew<cr>", { desc = "[A]dd new tab" })
vim.keymap.set({ "n" }, tl .. "<left>", "<cmd>-tabnext<cr>", { desc = "[P]rev tab" })
vim.keymap.set({ "n" }, tl .. "<right>", "<cmd>+tabnext<cr>", { desc = "next tab" })
vim.keymap.set({ "n" }, tl .. "d", "<cmd>tabclose<cr>", { desc = "[D]elete tab" })
vim.keymap.set({ "n" }, tl .. "c", "<cmd>tabonly<cr>", { desc = "[O]nly keep current tab" })

for tab_index = 1, 9, 1
do
	vim.keymap.set({ "n" }, tl .. tab_index, "<cmd>" .. tab_index .. "tabnext<cr>", { desc = "goto tab " .. tab_index })
end

-- Terminal

local terml = vim.g.createmapleader("terminal", "<leader>t")
vim.keymap.set({ "n" }, terml .. "t", "<cmd>edit term://zsh<cr>", { desc = "Start new terminal" })

-- LSP
vim.keymap.set({ "n" }, "ga", vim.lsp.buf.code_action, { desc = "Goto LSP Code Actions" })
vim.keymap.set({ "n" }, "<leader>uf", vim.lsp.buf.format, { desc = "Format buffer" })
vim.keymap.set({ "n" }, "<f3>", vim.lsp.buf.format, { desc = "Format buffer" })
vim.keymap.set({ "n" }, "<leader>r", vim.lsp.buf.rename, { desc = "Rename variable" })
vim.keymap.set({ "n" }, "<f2>", vim.lsp.buf.rename, { desc = "Rename variable" })
