local open_with_trouble = require("trouble.sources.telescope").open
local wk = require('which-key')

wk.add({
	{ 'i', '<c-t>',     open_with_trouble, desc = "Open with trouble" },
	{ 'n', '<leader>t', open_with_trouble, desc = "Open with trouble" }
})
