local move = function(type, dir)
	return string.format("<Cmd>lua MiniMove.move_%s('%s')<CR>", type, dir)
end

return {
	{
		"nvimtools/hydra.nvim",
		event = "VeryLazy",
		opts = {
			dependencies = { "folke/which-key.nvim" },
			config = {
				foreign_keys = "warn",
			},

			hydras = {
				window = {
					mode = "n",
					body = "<c-w>",

					heads = {
						{ "<C-down>",  "[[4<C-w>-]]", { desc = "Shrink window height" } },
						{ "<C-left>",  "[[4<C-w><]]", { desc = "Shrink window width" } },
						{ "<C-right>", "[[4<C-w>>]]", { desc = "Expand window width" } },
						{ "<C-up>",    "[[4<C-w>+]]", { desc = "Expand window height" } },
						{ "<C-j>",     "[[4<C-w>-]]", { desc = "Shrink window height" } },
						{ "<C-h>",     "[[4<C-w><]]", { desc = "Shrink window width" } },
						{ "<C-l>",     "[[4<C-w>>]]", { desc = "Expand window width" } },
						{ "<C-k>",     "[[3<C-w>+]]", { desc = "Expand window height" } },
					}
				},

				mini_move_normal = {
					mode = "n",
					body = "<leader>m",

					heads = {
						{ "<down>",  move("line", "down") },
						{ "<left>",  move("line", "left") },
						{ "<right>", move("line", "right") },
						{ "<up>",    move("line", "up") },
					}
				},

				mini_move_select = {
					mode = "x",
					body = "<leader>m",

					heads = {
						{ "<down>",  move("selection", "down") },
						{ "<left>",  move("selection", "left") },
						{ "<right>", move("selection", "right") },
						{ "<up>",    move("selection", "up") },
					}
				},
			}
		},

		config = function(_, opts)
			local Hydra = require("hydra")
			local config = opts.config
			local hydra_configs = opts.hydras

			for cfg_name, cfg in pairs(hydra_configs) do
				config.on_key = function()
					require("which-key").show({ keys = cfg.body })
				end

				cfg.name = cfg_name
				cfg.config = config
				Hydra(cfg)
			end
		end
	}
}
