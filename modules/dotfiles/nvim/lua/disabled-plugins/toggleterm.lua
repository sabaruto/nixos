local cmd = vim.cmd

return {
	{
		'akinsho/toggleterm.nvim',
		version = "*",
		opts = {
			open_mapping = [[<C-space>]],
			winbar = {
				enabled = true,
			},
		},
		keys = {
			{ "t",          "",                                                         desc = "+Toggle term" },
			{ "tt",         ":ToggleTerm direction=horizontal name=default<cr>",        desc = "Default Terminal" },
			{ "tv",         ":ToggleTerm direction=vertical name=vertical size=80<cr>", desc = "Vertical terminal" },
			{ "tf",         ":ToggleTerm direction=float name=float<cr>",               desc = "Float terminal" },
			{ "<leader>tt", ":ToggleTermToggleAll<cr>",                                 desc = "Toggle All Terminals" },
		}
	}
}
