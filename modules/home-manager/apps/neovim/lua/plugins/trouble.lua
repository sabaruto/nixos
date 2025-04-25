return {
	{
		"folke/trouble.nvim",
		cmd = { "Trouble" },
		opts = {
			modes = {
				lsp = {
					win = { position = "right" },
				},
			},
		},
		keys = {
			{ "<leader>dx", ":Trouble diagnostics toggle<CR>", desc = "Diagnostics (Trouble)" },
			{ "<leader>dX", ":Trouble diagnostics toggle filter.buf=0<CR>", desc = "Buffer Diagnostics (Trouble)" },
			{ "<leader>cs", ":Trouble symbols toggle<CR>", desc = "Symbols (Trouble)" },
			{ "<leader>cS", ":Trouble lsp toggle<CR>", desc = "LSP references/definitions/... (Trouble)" },
			{ "<leader>tL", ":Trouble loclist toggle<CR>", desc = "Location List (Trouble)" },
			{ "<leader>tQ", ":Trouble qflist toggle<CR>", desc = "Quickfix List (Trouble)" },
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
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			extensions = {
				"trouble",
			},
		},
	},
}
