-- local values
local leftkey = vim.g.leftkey
local downkey = vim.g.downkey
local upkey = vim.g.upkey
local rightkey = vim.g.rightkey

local mod_key = vim.g.mod_key

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
vim.keymap.set({ "n", "v" }, "<leader>w", ":write<CR>", { desc = "Save buffer", silent = true })
vim.keymap.set({ "n", "v" }, "<leader>j", ":", { remap = true, desc = "Set command line" })

-- Quitting
local ql = vim.g.createmapleader("quit", "<leader>q")

vim.keymap.set({ "n", "v" }, ql .. "q", ":qa<CR>", { desc = "Normal quit" })
vim.keymap.set({ "n", "v" }, ql .. "!", ":q!<CR>", { remap = true, desc = "Force quit" })
vim.keymap.set({ "n", "v" }, ql .. "w", ":wqa<CR>", { remap = true, desc = "Save buffers and quit" })

-- Windows
local wl = vim.g.createmapleader("windows", "<leader>x")

vim.keymap.set({ "n", "v" }, wl .. "d", ":quit<CR>", { desc = "[D]elete Window" })

vim.keymap.set({ "n", "v" }, wl .. "-", ":split<CR>", { desc = "Horizontal Split" })
vim.keymap.set({ "n", "v" }, wl .. "h", ":split<CR>", { desc = "[H]orizontal Split" })
vim.keymap.set({ "n", "v" }, wl .. "v", ":vsplit<CR>", { desc = "[V]ertical Split" })
vim.keymap.set({ "n", "v" }, wl .. "|", ":vsplit<CR>", { desc = "Vertical Split" })

vim.keymap.set({ "n" }, wl .. leftkey, ":wincmd h<CR>", { silent = true, desc = "Move window left" })
vim.keymap.set({ "n" }, wl .. downkey, ":wincmd j<CR>", { silent = true, desc = "Move window down" })
vim.keymap.set({ "n" }, wl .. rightkey, ":wincmd l<CR>", { silent = true, desc = "Move window right" })
vim.keymap.set({ "n" }, wl .. upkey, ":wincmd k<CR>", { silent = true, desc = "Move window up" })

vim.keymap.set({ "n" }, wl .. "<down>", ":wincmd j<CR>", { silent = true, desc = "Move window down" })
vim.keymap.set({ "n" }, wl .. "<left>", ":wincmd h<CR>", { silent = true, desc = "Move window left" })
vim.keymap.set({ "n" }, wl .. "<right>", ":wincmd l<CR>", { silent = true, desc = "Move window right" })
vim.keymap.set({ "n" }, wl .. "<up>", ":wincmd k<CR>", { silent = true, desc = "Move window up" })

-- Tabs
local tl = vim.g.createmapleader("tab", "<leader><tab>")

vim.keymap.set({ "n" }, tl .. "a", ":tabnew<CR>", { desc = "[A]dd new tab" })
vim.keymap.set({ "n" }, tl .. "<left>", ":-tabnext<cr>", { desc = "[P]rev tab" })
vim.keymap.set({ "n" }, tl .. "<right>", ":+tabnext<cr>", { desc = "next tab" })
vim.keymap.set({ "n" }, tl .. "d", ":tabclose<CR>", { desc = "[D]elete tab" })
vim.keymap.set({ "n" }, tl .. "k", ":tabclose<CR>", { desc = "[D]elete tab" })

-- Terminal

local terml = vim.g.createmapleader("terminal", "<leader>t")
vim.keymap.set({ "n" }, terml .. "t", ":edit term://zsh<CR>", { desc = "Start new terminal" })

-- LSP
vim.keymap.set({ "n" }, "ga", vim.lsp.buf.code_action, { desc = "Goto LSP Code Actions" })
vim.keymap.set({ "n" }, "<leader>r", vim.lsp.buf.rename, { desc = "Rename variable" })
vim.keymap.set({ "n" }, "<f2>", vim.lsp.buf.rename, { desc = "Rename variable" })
