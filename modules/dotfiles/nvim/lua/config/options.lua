vim.g.mapleader = " "
vim.g.maplocalleader = "	"

-- vim.opt.clipboard = "unnamedplus"

vim.g.leftkey = "h"
vim.g.downkey = "j"
vim.g.upkey = "k"
vim.g.rightkey = "l"

vim.g.backupcopy = "yes"

vim.opt.smarttab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.number = true
vim.opt.autoindent = true
vim.opt.termguicolors = true
vim.cmd("setlocal spell spelllang=en_gb")
vim.opt.conceallevel = 2

vim.opt.foldlevel = 99

vim.o.updatetime = 250
vim.o.exrc = true

vim.opt.sessionoptions = {
	"buffers",
	"tabpages",
	"globals",
}
