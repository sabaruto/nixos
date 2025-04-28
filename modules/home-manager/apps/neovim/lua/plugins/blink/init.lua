return {
	{
		'saghen/blink.cmp',
		dependencies = {
			'rafamadriz/friendly-snippets',
			'saghen/blink.cmp',
		},

		version = '*',
		opts = {
			keymap = {
				preset = 'none',

				["<C-Down>"] = { 'scroll_documentation_down', 'fallback' },
				["<C-Up>"] = { 'scroll_documentation_up', 'fallback' },

				["<C-e>"] = { 'cancel', 'fallback' },
				["<ESC>"] = { 'cancel', 'fallback' },

				["<CR>"] = { 'accept_and_enter', 'fallback' },
				["<TAB>"] = { 'accept', 'snippet_forward', 'fallback' },

				['<Up>'] = { 'select_prev', 'fallback' },
				['<Down>'] = { 'select_next', 'fallback' },

				['<S-TAB>'] = { 'snippet_backward', 'fallback' },

				['<S-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
				['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
			},

			cmdline = { keymap = { preset = 'inherit' } },
			term = { keymap = { preset = 'inherit' } },

			appearance = {
				nerd_font_variant = 'mono',
			},

			completion = {
				list = { selection = { preselect = true, }, },
				documentation = { auto_show = false },
			},

			sources = {
				default = { 'lsp', 'path', 'snippets', 'buffer' },
			},

			fuzzy = { implementation = "prefer_rust_with_warning" }
		},
		opts_extend = { "sources.default" }
	}
}
