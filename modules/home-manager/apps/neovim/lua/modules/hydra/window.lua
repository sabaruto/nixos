local cmd = require("hydra.keymap-util").cmd

return {
	name = "Window Management",
	mode = { "n", "v" },
	body = "<leader>x",
	heads = {
		{ "-",         cmd("split"), },
		{ "|",         cmd("vsplit"), },
		{ "h",         cmd("split"), },
		{ "v",         cmd("vsplit"), },
		{ "d",         cmd("quit"), },

		{ "<left>",    cmd("wincmd h"), },
		{ "<right>",   cmd("wincmd l"), },
		{ "<up>",      cmd("wincmd k"), },
		{ "<down>",    cmd("wincmd j"), },

		{ "<C-left>",  "<C-W><", },
		{ "<C-right>", "<C-W>>", },
		{ "<C-up>",    cmd("res +1"), },
		{ "<C-down>",  cmd("res -1"), },

		{ "<Esc>",     nil, },
	}
}
