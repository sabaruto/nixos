require("trouble").setup({
	modes = {
		lsp = {
			win = { position = "right" },
		},
	},
})

require("which-key").add({
	{ "<leader>cX", ":Trouble diagnostics toggle<CR>", desc = "Diagnostics (Trouble)" },
	{ "<leader>cx", ":Trouble diagnostics toggle filter.buf=0<CR>", desc = "Buffer Diagnostics (Trouble)" },
	{ "<leader>cs", ":Trouble symbols toggle<CR>", desc = "Symbols (Trouble)" },
	{
		"<leader>cl",
		":Trouble lsp toggle focus=false win.position=right<CR>",
		desc = "LSP references / definitions /... (Trouble)",
	},
	{ "<leader>cL", ":Trouble loclist toggle<CR>", desc = "Location List (Trouble)" },
	{ "<leader>cq", ":Trouble qflist toggle<CR>", desc = "Quickfix List (Trouble)" },
	{
		"[q",
		function()
			if require("trouble").is_open() then
				require("trouble").prev({ skip_groups = true, jump = true })
			else
				local ok, err = pcall(vim.cmd.cprev)
				if not ok then
					vim.notify(err, vim.log.levels.ERROR)
				end
			end
		end,
		desc = "Previous Trouble/Quickfix Item",
	},
	{
		"]q",
		function()
			if require("trouble").is_open() then
				require("trouble").next({ skip_groups = true, jump = true })
			else
				local ok, err = pcall(vim.cmd.cnext)
				if not ok then
					vim.notify(err, vim.log.levels.ERROR)
				end
			end
		end,
		desc = "Next Trouble/Quickfix Item",
	},
})
