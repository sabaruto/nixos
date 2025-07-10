return {
	"nvimtools/none-ls.nvim",
	event = { "VeryLazy" },
	config = function(_, opts)
		local null_ls = require("null-ls")
		opts = {
			debug = true,
			sources = {
				null_ls.builtins.formatting.stylua,

				null_ls.builtins.completion.spell,

				null_ls.builtins.code_actions.statix,
				null_ls.builtins.diagnostics.statix,
				null_ls.builtins.diagnostics.deadnix,
				null_ls.builtins.formatting.nixfmt,
			}
		}
		null_ls.setup(opts)
	end
}
