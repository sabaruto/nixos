return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd("colorscheme rose-pine")
		end
	},
	{
		"f-person/auto-dark-mode.nvim",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		}
	},
}
