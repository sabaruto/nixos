return {
	{ 'echasnovski/mini.ai',        version = false, config = true },
	{ 'echasnovski/mini.pairs',     version = false, config = true },
	{ 'echasnovski/mini.operators', version = false, config = true },
	{ "echasnovski/mini.surround",  version = false, config = true },
	{ "echasnovski/mini.comment",   version = false, config = true },
	{ "echasnovski/mini.splitjoin", version = false, config = true },
	{ "echasnovski/mini.icons",     version = false, config = true },
	{ 'echasnovski/mini.map',       version = false, config = true },
	{
		'echasnovski/mini.pick',
		version = false,
		opts = {
			mappings = {
				move_down = '<C-' .. vim.g.downkey .. '>',
				move_up = '<C-' .. vim.g.upkey .. '>',

				scroll_down = '',
				scroll_up = '',
				scroll_left = '',
				scroll_right = '',
			}
		},
		keys = {
			{ "<leader>/",  ":Pick grep_live<CR>", desc = "Live grep" },
			{ "<leader>ff", ":Pick files<CR>",     desc = "Find files" },
			{ "<leader>fb", ":Pick buffers<CR>",   desc = "Find buffers" },
		}
	},
	{
		'echasnovski/mini.keymap',
		version = false,
		config = function()
			local keymap = require("mini.keymap")

			local map_multistep = keymap.map_multistep
			local map_combo = keymap.map_combo

			map_multistep('i', '<Tab>', { 'pmenu_next' })
			map_multistep('i', '<S-Tab>', { 'pmenu_prev' })
			map_multistep('i', '<CR>', { 'pmenu_accept', 'minipairs_cr' })
			map_multistep('i', '<BS>', { 'minipairs_bs' })

			local mode = { 'i', 'c', 'x', 's' }
			map_combo(mode, 'jk', '<BS><BS><Esc>')

			-- To not have to worry about the order of keys, also map "kj"
			map_combo(mode, 'kj', '<BS><BS><Esc>')

			-- Escape into Normal mode from Terminal mode
			map_combo('t', 'jk', '<BS><BS><C-\\><C-n>')
			map_combo('t', 'kj', '<BS><BS><C-\\><C-n>')
		end
	},
	{
		'echasnovski/mini.snippets',
		version = false,
		config = function()
			local gen_loader = require('mini.snippets').gen_loader

			require('mini.snippets').setup({
				snippets = {
					gen_loader.from_file('~/.config/nvim/snippets/global.json'),
					gen_loader.from_lang(),
				},

				mappings = {
					expand = '<C-h>',
					jump_next = '<Tab>',
					jump_prev = '<S-Tab>'
				}
			})
		end
	},
	{
		'echasnovski/mini.completion',
		version = false,
		opts = {
		},
	},
	{
		"echasnovski/mini.jump",
		version = false,
		opts = {
			mappings = { repeat_jump = 'h' },
		},
	},
	{
		'echasnovski/mini.bufremove',
		version = false,
		config = true,
		keys = {
			{ "<leader>bd", function() require("mini.bufremove").delete() end, desc = "Delete buffer" },
		},
	},
	{
		'echasnovski/mini.files',
		version = false,
		opts = {
			mappings = {
				go_in = vim.g.rightkey,
				go_in_plus = "<S-" .. vim.g.rightkey .. ">",
				go_out = vim.g.leftkey,
				go_out_plus = "<S-" .. vim.g.leftkey .. ">",
			},

			windows = {
				preview = true,
			},
		},
		keys = function()
			local mf = require("mini.files")
			return {
				{ "<leader>fe", function() mf.open() end, desc = "Open mini files" },
			}
		end
	},
	{
		'echasnovski/mini.move',
		version = false,
		opts = function(opts)
			local ml = vim.g.createmapleader("move", "<leader>m")

			if opts == nil then
				opts = { mappings = {} }
			end

			opts.mappings = {
				left = ml .. vim.g.leftkey,
				right = ml .. vim.g.rightkey,
				up = ml .. vim.g.upkey,
				down = ml .. vim.g.downkey,

				line_left = ml .. vim.g.leftkey,
				line_right = ml .. vim.g.rightkey,
				line_up = ml .. vim.g.upkey,
				line_down = ml .. vim.g.downkey,
			}

			return opts
		end,
	},
}
