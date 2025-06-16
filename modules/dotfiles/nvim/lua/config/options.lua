vim.g.mapleader = " "
vim.g.maplocalleader = "	"

vim.g.leftkey = "h"
vim.g.downkey = "j"
vim.g.upkey = "k"
vim.g.rightkey = "l"


vim.opt.smarttab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.number = true
vim.opt.autoindent = true
vim.opt.termguicolors = true
vim.opt.conceallevel = 2

vim.opt.foldlevel = 99

vim.o.updatetime = 250
vim.o.exrc = true

vim.opt.sessionoptions = {
	"buffers",
	"tabpages",
	"globals",
}
