return {
	{
		"max397574/better-escape.nvim",
		config = function()
			require("better_escape").setup()
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim" },

		config = function()
			require("telescope").setup({
				pickers = {
					find_files = { theme = "dropdown" },
					git_files = { theme = "dropdown" },
					grep_string = { theme = "dropdown" },
					live_grep = { theme = "dropdown" },
					registers = { theme = "dropdown" },
					buffers = { theme = "dropdown" },
					current_buffer_fuzzy_find = { theme = "dropdown" },
					lsp_definitions = { theme = "dropdown" },
					lsp_implementations = { theme = "dropdown" },
					lsp_references = { theme = "dropdown" },
					lsp_type_references = { theme = "dropdown" },
					lsp_document_symbols = { theme = "dropdown" },
					lsp_workspace_symbols = { theme = "dropdown" },
					diagnostics = { theme = "dropdown" },
					projects = { theme = "dropdown" },
				},
				extensions = {
					projects = { theme = "dropdown" },
				},
			})
		end,
		keys = {
			-- goto
			{
				"gd",
				function()
					require("telescope.builtin").lsp_definitions()
				end,
				desc = "Goto Definitions",
			},
			{
				"gI",
				function()
					require("telescope.builtin").lsp_implementations()
				end,
				desc = "Goto Implementations",
			},
			{
				"grr",
				function()
					require("telescope.builtin").lsp_references()
				end,
				desc = "Goto References",
			},
			{
				"grt",
				function()
					require("telescope.builtin").lsp_type_references()
				end,
				desc = "Goto type [R]eferences",
			},
			{
				"gs",
				function()
					require("telescope.builtin").lsp_document_symbols()
				end,
				desc = "Goto document symbols",
			},
			{
				"gS",
				function()
					require("telescope.builtin").lsp_workspace_symbols()
				end,
				desc = "Goto workspace symbols",
			},

			-- find
			{
				"<leader>sf",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "Find files",
			},
			{
				"<leader>sg",
				function()
					require("telescope.builtin").git_files()
				end,
				desc = "Find git files",
			},
			{
				"<leader>sw",
				function()
					require("telescope.builtin").grep_string()
				end,
				desc = "Find files with word under cursor",
			},
			{
				"<leader>ss",
				function()
					require("telescope.builtin").live_grep()
				end,
				desc = "Find files by grep",
			},
			{
				"<leader>sr",
				function()
					require("telescope.builtin").registers()
				end,
				desc = "Find registers",
			},
			{
				"<leader>sb",
				function()
					require("telescope.builtin").buffers()
				end,
				desc = "Find buffers",
			},
			{
				"<leader>sB",
				function()
					require("telescope.builtin").current_buffer_fuzzy_find()
				end,
				desc = "Find buffers with fuzzy find",
			},
			{
				"<leader>sp",
				function()
					require("telescope").extensions.projects.projects(require("telescope.themes").get_dropdown({}))
				end,
				desc = "Find projects",
			},

			-- peek
			{
				"<leader>ps",
				function()
					require("telescope.builtin").lsp_workspace_symbols()
				end,
				desc = "Peek workspace symbols",
			},
		},
	},
	{
		"ahmedkhalf/project.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function()
			require("project_nvim").setup()
			require("telescope").load_extension("projects")
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
	},
	{
		"illia-shkroba/telescope-completion.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function()
			local completion = require("telescope").load_extension("completion")

			vim.keymap.set("i", [[<C-z>]], function()
				if vim.fn.pumvisible() == 1 then
					return completion.completion_expr()
				else
					return [[<C-z>]]
				end
			end, { expr = true, desc = "List popup-menu completion in Telescope" })
		end,
	},
	{
		"folke/neoconf.nvim",
		cmd = "Neoconf",
		opts = {},
	},
	{
		"hrsh7th/nvim-cmp",
		version = false,
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
		config = function()
			local cmp = require("cmp")
			local mappings = {
				["<C-Down>"] = cmp.mapping.scroll_docs(-4),
				["<C-Up>"] = cmp.mapping.scroll_docs(4),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				["<Right>"] = cmp.mapping.confirm({ select = false }),
			}

			require("cmp").setup({
				snippet = {
					expand = function(args)
						vim.snippet.expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert(mappings),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "nvim_lsp_document_symbol" },
					{ name = "nvim_lsp_signature_help" },

					{ name = "dictionary" },

					{ name = "path" },
					{ name = "git" },
					{ name = "vimwiki" },
				}, {
					{ name = "buffer" },
				}),
			})

			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.insert(mappings),
				sources = {
					{ name = "buffer" },
				},
			})

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.insert(mappings),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
				matching = { disallow_symbol_nonprefix_matching = false },
			})
		end,
	},
	{ "hrsh7th/cmp-nvim-lsp", lazy = true },
	{ "hrsh7th/cmp-buffer", lazy = true },
	{ "hrsh7th/cmp-path", lazy = true },
	{
		"MagicDuck/grug-far.nvim",
		opts = { headerMaxWidth = 80 },
		cmd = "GrugFar",
		keys = {
			{
				"<leader>sr",
				function()
					local grug = require("grug-far")
					local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
					grug.open({
						transient = true,
						prefills = {
							filesFilter = ext and ext ~= "" and "*." .. ext or nil,
						},
					})
				end,
				mode = { "n", "v" },
				desc = "Search and Replace",
			},
		},
	},
	{
		"folke/snacks.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			dashboard = { enabled = false },
			indent = { enabled = true },
			input = { enabled = true },
			notifier = { enabled = true },
			scope = { enabled = true },
			scroll = { enabled = true },
			statuscolumn = { enabled = true },
			toggle = { enabled = false },
			words = { enabled = true },
		},
		-- stylua: ignore
		keys = {
			{
				"<leader>n",
				function()
					if Snacks.config.picker and Snacks.config.picker.enabled then
						Snacks.picker.notifications()
					else
						Snacks.notifier.show_history()
					end
				end,
				desc = "Notification History"
			},
			{ "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
			{ "<leader>bq", function() Snacks.bufdelete() end,     desc = "Delete buffer" }
		},
	},
	{
		"alexghergh/nvim-tmux-navigation",
		config = function()
			local nvim_tmux_nav = require("nvim-tmux-navigation")

			nvim_tmux_nav.setup({
				disable_when_zoomed = true, -- defaults to false
			})

			vim.keymap.set("n", "<M-left>", nvim_tmux_nav.NvimTmuxNavigateLeft)
			vim.keymap.set("n", "<M-Down>", nvim_tmux_nav.NvimTmuxNavigateDown)
			vim.keymap.set("n", "<M-Up>", nvim_tmux_nav.NvimTmuxNavigateUp)
			vim.keymap.set("n", "<M-Right>", nvim_tmux_nav.NvimTmuxNavigateRight)
			vim.keymap.set("n", "<M-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
			vim.keymap.set("n", "<M-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
		end,
	},
	{
		"folke/trouble.nvim",
		cmd = { "Trouble" },
		opts = {
			modes = {
				lsp = {
					win = { position = "right" },
				},
			},
		},
		keys = {
			{ "<leader>dx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
			{ "<leader>dX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
			{ "<leader>cs", "<cmd>Trouble symbols toggle<cr>", desc = "Symbols (Trouble)" },
			{
				"<leader>cS",
				"<cmd>Trouble lsp toggle<cr>",
				desc = "LSP references/definitions/... (Trouble)",
			},
			{ "<leader>tL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
			{ "<leader>tQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
			{
				"[q",
				function()
					if require("trouble").is_open() then
						require("trouble").prev({ skip_groups = true, jump = true })
					else
						local ok, err = pcall(vim.cmd.cprev)
						if not ok then
							vim.notify(err, vim.log.levels.ERROR)
						end
					end
				end,
				desc = "Previous Trouble/Quickfix Item",
			},
			{
				"]q",
				function()
					if require("trouble").is_open() then
						require("trouble").next({ skip_groups = true, jump = true })
					else
						local ok, err = pcall(vim.cmd.cnext)
						if not ok then
							vim.notify(err, vim.log.levels.ERROR)
						end
					end
				end,
				desc = "Next Trouble/Quickfix Item",
			},
		},
	},
	{
		"folke/flash.nvim",
		opts = {},
		keys = function()
			local flash = require("flash")
			return {
				{
					"s",
					mode = { "n", "x", "o" },
					function()
						flash.jump()
					end,
					desc = "Flash",
				},
				{
					"S",
					mode = { "n", "o", "x" },
					function()
						require("flash").treesitter()
					end,
					desc = "Flash Treesitter",
				},
				{
					"r",
					mode = "o",
					function()
						require("flash").remote()
					end,
					desc = "Remote Flash",
				},
				{
					"R",
					mode = { "o", "x" },
					function()
						require("flash").treesitter_search()
					end,
					desc = "Treesitter Search",
				},
				{
					"<c-s>",
					mode = { "c" },
					function()
						require("flash").toggle()
					end,
					desc = "Toggle Flash Search",
				},
			}
		end,
	},
	{
		"echasnovski/mini.surround",

		mappings = {
			add = "gsa", -- Add surrounding in Normal and Visual modes
			delete = "gsd", -- Delete surrounding
			find = "gsf", -- Find surrounding (to the right)
			find_left = "gsF", -- Find surrounding (to the left)
			highlight = "gsh", -- Highlight surrounding
			replace = "gsr", -- Replace surrounding
			update_n_lines = "gsn", -- Update `n_lines`
		},
	},
	{ "rafamadriz/friendly-snippets" },
	{
		"L3MON4D3/LuaSnip",
		lazy = true,
		build = "make install_jsregexp",
		dependencies = {
			{
				"rafamadriz/friendly-snippets",
				config = function()
					require("luasnip.loaders.from_vscode").lazy_load()
					require("luasnip.loaders.from_vscode").lazy_load({
						paths = { vim.fn.stdpath("config") .. "/snippets" },
					})
				end,
			},
		},
		opts = {
			history = true,
			delete_check_events = "TextChanged",
		},
	},
}
