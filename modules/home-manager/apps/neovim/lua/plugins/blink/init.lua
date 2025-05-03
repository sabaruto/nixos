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

				["<Right>"] = { 'accept', 'cancel', 'fallback' },

				['<Up>'] = { 'select_prev', 'fallback' },
				['<Down>'] = { 'select_next', 'fallback' },

				["<TAB>"] = { 'snippet_forward', 'fallback' },
				['<S-TAB>'] = { 'snippet_backward', 'fallback' },

				['<S-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
				['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
			},

			cmdline = {
				keymap = {
					preset = 'inherit',

					['<Tab>'] = {
						function(cmp)
							if cmp.is_ghost_text_visible() and not cmp.is_menu_visible() then return cmp.accept() end
						end,
						'show_and_insert',
						'select_next',
					},
					['<S-Tab>'] = { 'show_and_insert', 'select_prev' },
				}
			},
			term = { keymap = { preset = 'inherit' } },

			appearance = {
				nerd_font_variant = 'mono',
			},

			completion = {
				list = { selection = { preselect = false, }, },
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
