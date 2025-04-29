return {
	{
		'anuvyklack/hydra.nvim',
		config = function()
			local Hydra = require("hydra")
			local window_config = require("/modules/hydra/window")
			Hydra(window_config)
		end
	},
}
