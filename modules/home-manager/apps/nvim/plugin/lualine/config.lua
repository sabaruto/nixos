local lua = require('lualine')

lua.setup {
	sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},

	tabline = {
		lualine_a = { 'mode' },
		lualine_b = { { 'buffers', mode = 2 } },
		lualine_x = { 'lsp_status', 'searchcount', 'selectioncount' },
		lualine_z = { 'tabs' },
	},

	winbar = {
		lualine_b = { 'branch', 'diff', 'diagnostics' },
		lualine_c = { { 'filename', path = 1 } },
		lualine_x = { 'encoding', 'fileformat', 'filetype' },
		lualine_y = { 'progress' },
		lualine_z = { 'location' }
	},

	inactive_winbar = {
		lualine_c = { 'filename' },
		lualine_x = { 'location' },
	},

	extensions = {

	},
}
