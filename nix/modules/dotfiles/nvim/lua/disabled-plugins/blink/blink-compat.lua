return {
	-- add blink.compat
	{
		'saghen/blink.compat',
		version = '*',
		lazy = true,
		-- make sure to set opts so that lazy.nvim calls blink.compat's setup
		opts = {},
	},
}
