local prs = require("persistence")
prs.setup()

require("which-key").add({
	{ "<leader>l", prs.load },
	{
		"<leader>L",
		function()
			prs.load({ last = true })
		end,
	},
})
