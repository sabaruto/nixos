return {
	{
		'akinsho/toggleterm.nvim',
		version = "*",
		config = true,
		keys = {
			{ "t",          "",                                                 desc = "+Toggle term" },
			{ "tt",         ":ToggleTerm name=default<cr>",                     desc = "Default Terminal" },
			{ "tv",         ":ToggleTerm direction=vertical name=vertical<cr>", desc = "Vertical terminal" },
			{ "tf",         ":ToggleTerm direction=float name=float<cr>",       desc = "Float terminal" },
			{ "<leader>tt", ":ToggleTermToggleAll<cr>",                         desc = "Toggle All Terminals" },
		}
	}
}
