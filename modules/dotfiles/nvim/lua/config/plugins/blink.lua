require("blink.cmp").setup({
	keymap = {
		preset = 'none',

		["<C-Down>"] = { 'scroll_documentation_down', 'fallback' },
		["<C-Up>"] = { 'scroll_documentation_up', 'fallback' },

		["<C-e>"] = { 'cancel', 'fallback' },
		["<ESC>"] = { 'cancel', 'fallback' },

		["<Right>"] = { 'accept', 'cancel', 'fallback' },
		['<C-' .. vim.g.rightkey .. '>'] = { 'accept', 'cancel', 'fallback' },


		['<C-' .. vim.g.upkey .. '>'] = { 'select_prev', 'fallback' },
		['<C-' .. vim.g.downkey .. '>'] = { 'select_next', 'fallback' },

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
			['<Tab>'] = { 'show', 'accept' },
			completion = { menu = { auto_show = true } },
		}
	},
	term = { keymap = { preset = 'inherit' } },

	completion = {
		list = { selection = { preselect = false, }, },
		documentation = { auto_show = false },
	},

	sources = {
		default = { 'lsp', 'buffer', 'omni', 'path', 'snippets' },
	},

	fuzzy = { implementation = "prefer_rust_with_warning" },
})

require("blink.compat").setup({})
