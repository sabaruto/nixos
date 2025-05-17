vim.g.mapleader = " "
vim.g.maplocalleader = "<tab>"

vim.g.leftkey = "j"
vim.g.downkey = "k"
vim.g.upkey = "l"
vim.g.rightkey = ";"

vim.opt.smarttab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.number = true
vim.opt.autoindent = true
vim.opt.termguicolors = true
vim.opt.conceallevel = 2

vim.o.updatetime = 250

vim.opt.sessionoptions = {
	"buffers",
	"tabpages",
	"globals",
}
