local prs = require("persistence")
prs.setup()

require("which-key").add({
	{ "<leader>ps", prs.load },
	{ "<leader>pS", prs.select },
	{
		"<leader>pl",
		function()
			prs.load({ last = true })
		end,
	},
	{ "<leader>pd", prs.stop },
})
