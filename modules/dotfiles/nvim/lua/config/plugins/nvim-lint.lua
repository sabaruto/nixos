local opts = {
	linters_by_ft = {
		python = {
			"mypy",
		},
		lua = {
			"luac",
		},
		nix = {
			"deadnix",
		},
		java = {
			"checkstyle",
		},
	},
}

require("lint").linters_by_ft = opts.linters_by_ft
require("lint").linters.checkstyle.config_file = os.getenv("HOME") .. "/.m2/checkstyle.xml"

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*",
	callback = function(_)
		require("lint").try_lint()
	end,
})
