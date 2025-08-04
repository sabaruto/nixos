local side_split_size = 0.3

return {
	{
		"folke/trouble.nvim",
		cmd = { "Trouble" },
		opts = {
			modes = {

				lsp_references = {
					win = {
						position = "bottom",
					},
				},
				lsp_base = {
					win = {
						position = "right",
						size = side_split_size,
					},
				},
				lsp = {
					win = {
						position = "right",
						size = side_split_size,
					},
				},
			},
		},
		keys = {
			{ "<leader>cD", ":Trouble diagnostics toggle<CR>", desc = "Diagnostics (Trouble)" },
			{
				"<leader>cd",
				":Trouble diagnostics toggle filter.buf=0<CR>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{ "<leader>cs", ":Trouble symbols toggle<CR>", desc = "Symbols (Trouble)" },
			{
				"<leader>cl",
				":Trouble lsp toggle focus=false <CR>",
				desc = "LSP references / definitions /... (Trouble)",
			},
			{
				"<leader>cL",
				":Trouble loclist toggle<CR>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>cq",
				":Trouble qflist toggle<CR>",
				desc = "Quickfix List (Trouble)",
			},
			{
				"<leader>cR",
				":Trouble lsp_references toggle<CR>",
				desc = "Lsp References List (Trouble)",
			},
			{
				"<leader>ci",
				":Trouble lsp_implementations toggle<CR>",
				desc = "Lsp Implementations List (Trouble)",
			},
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
}
