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
				-- Python
				require("null-ls").builtins.formatting.isort,
				require("null-ls").builtins.formatting.black,
				require("null-ls").builtins.diagnostics.mypy,

				-- Nix
				require("null-ls").builtins.diagnostics.statix,
				require("null-ls").builtins.formatting.nixfmt,
				require("null-ls").builtins.diagnostics.deadnix,

				-- General diagnosis
				require("null-ls").builtins.diagnostics.semgrep,
				require("null-ls").builtins.diagnostics.codespell,
				require("null-ls").builtins.diagnostics.stylelint,

				-- General refactoring
				require("null-ls").builtins.code_actions.refactoring,
				require("null-ls").builtins.code_actions.ts_node_action,
			}

			require("null-ls").setup(opts)
		end,
	},
}
