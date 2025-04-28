local function elem_in(tab, value)
	for _, table_value in ipairs(tab) do
		if table_value == value then
			return true
		end
	end
	return false
end

local function has_filename()
	local unused_filepath_fts = {
		"trouble",
		"dashboard",
		"oil",
		"toggleterm",
	}
	return not elem_in(unused_filepath_fts, vim.bo.filetype)
end

local function is_file()
	local not_file_fts = {
		"trouble",
		"dashboard",
		"toggleterm",
	}
	return not elem_in(not_file_fts, vim.bo.filetype)
end

local function in_repo()
	local not_in_repo_fts = {
		"trouble",
		"toggleterm",
		"oil",
	}
	return not elem_in(not_in_repo_fts, vim.bo.filetype)
end

local function has_full_filename()
	local filetypes = {
		"oil",
		"toggleterm",
		"dashboard",
	}

	return elem_in(filetypes, vim.bo.filetype)
end

return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {
					{ "filename", path = 1, cond = has_filename },
				},
				lualine_x = { { "filesize", cond = is_file } },
				lualine_y = { { "branch", cond = in_repo } },
				lualine_z = {},
			},

			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { { "filename", path = 1, cond = has_filename } },
				lualine_x = { { "filesize", cond = is_file } },
				lualine_y = { { "branch", cond = in_repo } },
				lualine_z = {},
			},

			tabline = {
				lualine_a = { "mode" },
				lualine_b = { { "buffers", mode = 2, use_mode_colors = true } },
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { { "tabs", mode = 2 } },
			},

			winbar = {
				lualine_a = {
					{ "filename", path = 4, cond = has_filename },
					{
						"filename",
						path = 3,
						cond = has_full_filename
					},
				},
				lualine_b = {
					"diff",
					"diagnostics",
				},
				lualine_c = {},
				lualine_x = { "filetype" },
				lualine_y = {
					"progress",
					{ "location", cond = is_file },
				},
				lualine_z = { "lsp_status" },
			},

			inactive_winbar = {
				lualine_a = { { "filename", path = 4, cond = has_filename } },
				lualine_b = {},
				lualine_c = {},
				lualine_x = { "filetype" },
				lualine_y = {},
				lualine_z = {},
			},

			options = {
				always_divide_middle = false,
			},
		},
	}
}
