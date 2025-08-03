local flash = require("flash")
flash.setup()

require("which-key").add({
	{
		mode = { "n", "x", "o" },
		{ "<c-s>", flash.jump },
		{ "S", flash.treesitter },
	},
	{ mode = { "o" }, "r", flash.remote, desc = "Remote Flash" },
	{ mode = { "o", "x" }, "R", flash.treesitter_search, desc = "Treesitter Search" },
	{ mode = { "c" }, "<c-s>", flash.toggle, desc = "Toggle Flash Search" },
})
