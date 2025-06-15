return {
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy", -- Or `LspAttach`
		priority = 1000, -- needs to be loaded in first
		opts = {
			use_icons_from_diagnostic = true,
			show_all_diags_on_cursorline = true,

			show_source = {
				enabled = true,
				always_show = true,
			},
		}
	}
}
