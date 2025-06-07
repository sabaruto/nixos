return {
	{
		"rafamadriz/friendly-snippets",
	},
	{
		"L3MON4D3/LuaSnip",
		lazy = true,
		build = "make install_jsregexp",
		dependencies = { "rafamadriz/friendly-snippets" },
		opts = {
			history = true,
			delete_check_events = "TextChanged",
		},
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load({
				paths = { vim.fn.stdpath("config") .. "/snippets" },
			})
		end,
	}
}
