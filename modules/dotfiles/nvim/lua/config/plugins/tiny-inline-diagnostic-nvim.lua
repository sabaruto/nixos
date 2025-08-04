require("tiny-inline-diagnostic").setup({
	options = {
		show_source = {
			enabled = true,
			if_many = false,
		},
		use_icons_from_diagnostic = false,

		multilines = {
			enabled = true,
		},
	},
})
