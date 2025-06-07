return {
	{
		"hrsh7th/nvim-cmp",
		version = false,
		event = "InsertEnter",
		config = function()
			local cmp = require("cmp")
			local mappings = {
				["<C-Down>"] = cmp.mapping.scroll_docs(-4),
				["<C-Up>"] = cmp.mapping.scroll_docs(4),
				["<C-e>"] = cmp.mapping.abort(),
				["<Right>"] = cmp.mapping.confirm({ select = false }),
			}

			require("cmp").setup({
				snippet = {
					expand = function(args)
						vim.snippet.expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert(mappings),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "nvim_lsp_document_symbol" },
					{ name = "nvim_lsp_signature_help" },

					{ name = "dictionary" },

					{ name = "path" },
					{ name = "git" },
					{ name = "vimwiki" },
					{ name = "buffer" },
				}),
			})

			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.insert(mappings),
				sources = {
					{ name = "buffer" },
				},
			})

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.insert(mappings),
				sources = cmp.config.sources({
					{ name = "path" },
					{ name = "cmdline" },
				}),
				matching = { disallow_symbol_nonprefix_matching = false },
			})
		end,
	},
}
