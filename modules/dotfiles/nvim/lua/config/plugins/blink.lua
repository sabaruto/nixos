require("blink.cmp").setup({
	keymap = {
		preset = "none",

		["<C-Down>"] = { "scroll_documentation_down", "fallback" },
		["<C-Up>"] = { "scroll_documentation_up", "fallback" },

		["<C-e>"] = { "cancel", "fallback" },
		["<ESC>"] = { "cancel", "fallback" },

		["<Right>"] = { "accept", "cancel", "fallback" },
		["<C-" .. vim.g.rightkey .. ">"] = { "accept", "cancel", "fallback" },

		["<C-" .. vim.g.upkey .. ">"] = { "select_prev", "fallback" },
		["<C-" .. vim.g.downkey .. ">"] = { "select_next", "fallback" },

		["<Up>"] = { "select_prev", "fallback" },
		["<Down>"] = { "select_next", "fallback" },

		["<TAB>"] = { "snippet_forward", "fallback" },
		["<S-TAB>"] = { "snippet_backward", "fallback" },

		["<S-k>"] = { "show_signature", "hide_signature", "fallback" },
		["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
	},

	cmdline = {
		keymap = {
			preset = "inherit",
			["<Tab>"] = { "show", "accept" },
			completion = { menu = { auto_show = true } },
		},
	},
	term = { keymap = { preset = "inherit" } },

	completion = {
		list = { selection = { preselect = false } },
		documentation = { auto_show = false },
		menu = {
			draw = {
				components = {
					kind_icon = {
						ellipsis = false,
						width = { fill = true },
						text = function(ctx)
							local icon = ctx.kind_icon
							if vim.tbl_contains({ "Path" }, ctx.source_name) then
								local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
								if dev_icon then
									icon = dev_icon
								end
							end
							return icon .. ctx.icon_gap
						end,

						-- Optionally, use the highlight groups from nvim-web-devicons
						-- You can also add the same function for `kind.highlight` if you want to
						-- keep the highlight groups in sync with the icons.
						highlight = function(ctx)
							local hl = ctx.kind_hl
							if vim.tbl_contains({ "Path" }, ctx.source_name) then
								local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
								if dev_icon then
									hl = dev_hl
								end
							end
							return hl
						end,
					},
				},
			},
		},
	},

	sources = {
		default = { "lsp", "buffer", "omni", "path", "snippets" },
	},

	fuzzy = { implementation = "prefer_rust" },
})

require("blink.compat").setup({})
