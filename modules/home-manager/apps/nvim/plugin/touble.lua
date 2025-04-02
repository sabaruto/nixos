local wk = require('which-key')
local actions = require('trouble.sources.telescope').open
local open_with_trouble = require('trouble.sources.telescope').add

wk.add({
	{ 'i', '<c-t>', open_with_trouble }
})
