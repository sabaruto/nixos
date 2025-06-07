return {
	'davidgranstrom/scnvim',
	keys = {
		{ '<leader>ml', ":SCNvimStatusLine<CR>", },
		{ '<>C-e',      function() require("scnvim").map('editor.send_block', { 'i', 'n' }) end, },
		{ '<CR>', },
		{ '<M-CR>', },
		{ '<M-L>', },
		{ '<C-k>', },
		{ '<F12>', },
		{ '<leader>st', },
		{ '<leader>sk', },
		{ 'F1,' },
		{ '<F2>', }
	},
	ft = { 'supercollider' },
	opts = {
		keymaps = {
			['<M-e>'] = function() require("scnvim").map('editor.send_line', { 'i', 'n' }) end,
			['<C-e>'] = {
				function() require("scnvim").map('editor.send_block', { 'i', 'n' }) end,
				function() require("scnvim").map('editor.send_selection', 'x') end,
			},
			['<CR>'] = function() require("scnvim").map('postwin.toggle') end,
			['<M-CR>'] = function() require("scnvim").map('postwin.toggle', 'i') end,
			['<M-L>'] = function() require("scnvim").map('postwin.clear', { 'n', 'i' }) end,
			['<C-k>'] = function() require("scnvim").map('signature.show', { 'n', 'i' }) end,
			['<F12>'] = function() require("scnvim").map('sclang.hard_stop', { 'n', 'x', 'i' }) end,

			['<leader>st'] = function() require("scnvim").map('sclang.start') end,
			['<leader>sk'] = function() require("scnvim").map('sclang.recompile') end,

			['<F1>'] = function() require("scnvim").map_expr('s.boot') end,
			['<F2>'] = function() require("scnvim").map_expr('s.meter') end,
		},
		editor = {
			highlight = {
				color = 'IncSearch',
			},
		},
		postwin = {
			float = {
				enabled = true,
			},
		},
	}
}
