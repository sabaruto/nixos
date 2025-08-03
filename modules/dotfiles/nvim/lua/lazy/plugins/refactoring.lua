return {
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		lazy = false,
		opts = {
			prompt_func_return_type = {
				java = true,
			},
			prompt_func_param_type = {
				java = true,
			}
		},

		config = function(_, opts)
			require("refactoring").setup(opts)

			vim.keymap.set("x", "<leader>cre", ":Refactor extract ")
			vim.keymap.set("x", "<leader>crf", ":Refactor extract_to_file ")

			vim.keymap.set("x", "<leader>crv", ":Refactor extract_var ")

			vim.keymap.set({ "n", "x" }, "<leader>cri", ":Refactor inline_var")

			vim.keymap.set("n", "<leader>crI", ":Refactor inline_func")

			vim.keymap.set("n", "<leader>crb", ":Refactor extract_block")
			vim.keymap.set("n", "<leader>crbf", ":Refactor extract_block_to_file")
		end
	}
}
