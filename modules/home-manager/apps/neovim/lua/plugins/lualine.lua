local function loaded_value(action, func)
	local ok, _ = pcall(require, action)
	if ok then
		return func
	else
		return ""
	end
end

local function oil_title()
	return loaded_value("oil", vim.fn.fnamemodify(require('oil').get_current_dir(), ':~'))
end

local function existed_value(value)
	if value == nil then
		return ""
	else
		return value
	end
end

return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { { "filename", path = 1 } },
				lualine_x = { "filesize" },
				lualine_y = { "branch" },
				lualine_z = {},
			},

			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { { "filename", path = 1 } },
				lualine_x = { "filesize" },
				lualine_y = { "branch" },
				lualine_z = {},
			},

			tabline = {
				lualine_a = { "mode" },
				lualine_b = { { "buffers", mode = 2 } },
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { { "tabs", mode = 2 } },
			},

			winbar = {
				lualine_a = { { "filename", path = 4 } },
				lualine_b = { "diff", "diagnostics" },
				lualine_c = {},
				lualine_x = { "filetype" },
				lualine_y = { "progress", "location" },
				lualine_z = { "lsp_status" },
			},

			inactive_winbar = {
				lualine_a = { { "filename", path = 4 } },
				lualine_b = {},
				lualine_c = {},
				lualine_x = { "filetype" },
				lualine_y = {},
				lualine_z = {},
			},

			extensions = {
				{
					winbar = {
						lualine_a = { oil_title },
						filetypes = { { "oil" } },
					},
				},
				{
					winbar = {
						lualine_a = { "ToggleTerm #" .. existed_value(vim.b.toggle_number) },
					},
					filetypes = { { "toggleterm" } },
				},
				{
					winbar = {
						lualine_a = { function() return 'lazy 💤' end },
					},
					filetypes = { { "lazy" } }
				},
			},
		},
	}
}
