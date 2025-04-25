return {
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"CKolkey/ts-node-action",
			"ThePrimeagen/refactoring.nvim",
		},
		opts = {},
		config = function(_, opts)
			opts.debug = true
			opts.sources = {
				require("null-ls").builtins.formatting.isort,
				require("null-ls").builtins.formatting.black,
				require("null-ls").builtins.formatting.stylua,
				require("null-ls").builtins.formatting.nixfmt,

				require("null-ls").builtins.completion.spell,
				require("null-ls").builtins.completion.luasnip,
				require("null-ls").builtins.completion.nvim_snippets,
				require("null-ls").builtins.diagnostics.selene,

				require("null-ls").builtins.diagnostics.mypy,
				require("null-ls").builtins.diagnostics.vale,
				require("null-ls").builtins.diagnostics.statix,
				require("null-ls").builtins.diagnostics.semgrep,
				require("null-ls").builtins.diagnostics.deadnix,
				require("null-ls").builtins.diagnostics.codespell,
				require("null-ls").builtins.diagnostics.stylelint,
				require("null-ls").builtins.diagnostics.proselint,
				require("null-ls").builtins.diagnostics.markdownlint,
				require("null-ls").builtins.diagnostics.golangci_lint,

				require("null-ls").builtins.code_actions.proselint,
				require("null-ls").builtins.code_actions.refactoring,
				require("null-ls").builtins.code_actions.ts_node_action,
			}

			require("null-ls").setup(opts)
		end,
	},
}
