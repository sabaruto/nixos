return {
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"CKolkey/ts-node-action",
			"ThePrimeagen/refactoring.nvim",
		},
		opts = {
			debug = true,
		},
		config = function(_, opts)
			opts.sources = {
				-- Python
				require("null-ls").builtins.formatting.isort,
				require("null-ls").builtins.formatting.black,
				require("null-ls").builtins.diagnostics.mypy,

				-- Nix
				require("null-ls").builtins.diagnostics.statix,
				require("null-ls").builtins.diagnostics.deadnix,
				require("null-ls").builtins.formatting.nixfmt,

				-- General diagnosis
				require("null-ls").builtins.formatting.xmllint,
				require("null-ls").builtins.formatting.yamlfmt,
				require("null-ls").builtins.diagnostics.codespell,
				require("null-ls").builtins.diagnostics.stylelint,
				require("null-ls").builtins.diagnostics.tidy,

				-- General ng
				require("null-ls").builtins.code_actions.refactoring,
				require("null-ls").builtins.code_actions.ts_node_action,
			}

			require("null-ls").setup(opts)
		end,
	},
}
