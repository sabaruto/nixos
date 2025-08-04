-- Icons
require("nvim-web-devicons").setup()

-- Colourscheme
require("rose-pine").setup()
require("config.plugins.which-key")
vim.cmd("colorscheme rose-pine-moon")
require("config.plugins.treesitter")

require("config.plugins.which-key")

-- Better Escape
local better_escape = require("better_escape")
better_escape.setup()

require("config.plugins.flash")
require("config.plugins.noice")
require("config.plugins.trouble")
require("config.plugins.ufo")
require("config.plugins.neo_tree")
require("config.plugins.lspconfig")
require("config.plugins.lualine")
require("config.plugins.blink")
require("config.plugins.persistence")
require("config.plugins.nvim-lint")
require("config.plugins.conform")
require("config.plugins.snacks")
require("config.plugins.mini")
require("config.plugins.gitsigns")
require("config.plugins.telescope")
