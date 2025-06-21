return {
	{
		"mfussenegger/nvim-lint",
		opts = {
			linters_by_ft = {
				python = {
					"mypy",
				},
			}
		},
		config = function(_, opts)
			require("lint").linters_by_ft = opts.linters_by_ft
		end
	}
}
