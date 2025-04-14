return {
	{
		"max397574/better-escape.nvim",
		config = function()
			require("better_escape").setup()
		end,
	},
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },

		config = function()
			require('telescope').setup {
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
			}
		end,
		keys = {
			-- goto
			{ "gd",         function() require('telescope.builtin').lsp_definitions() end,       desc = "Goto Definitions" },
			{ "gI",         function() require('telescope.builtin').lsp_implementations() end,   desc = "Goto Implementations" },
			{ "grr",        function() require('telescope.builtin').lsp_references() end,        desc = "Goto References" },
			{ "grt",        function() require('telescope.builtin').lsp_type_references() end,   desc = "Goto type [R]eferences" },
			{ "gs",         function() require('telescope.builtin').lsp_document_symbols() end,  desc = "Goto document symbols" },
			{ "gS",         function() require('telescope.builtin').lsp_workspace_symbols() end, desc = "Goto workspace symbols" },

			-- find
			{ "<leader>sf", function() require('telescope.builtin').find_files() end,            desc = "Find files" },
			{ "<leader>sg", function() require('telescope.builtin').git_files() end,             desc = "Find git files" },
			{ "<leader>sw", function() require('telescope.builtin').grep_string() end,           desc = "Find files with word under cursor" },
			{ "<leader>ss", function() require('telescope.builtin').live_grep() end,             desc = "Find files by grep" },
			{ "<leader>sr", function() require('telescope.builtin').registers() end,             desc = "Find registers" },
			{ "<leader>sb", function() require('telescope.builtin').buffers() end,               desc = "Find buffers" },
			{
				"<leader>sB",
				function()
					require('telescope.builtin').current_buffer_fuzzy_find()
				end,
				desc = "Find buffers with fuzzy find"
			},
			{
				"<leader>sp",
				function()
					require('telescope').extensions.projects.projects(require('telescope.themes').get_dropdown({}))
				end,
				desc = "Find projects"
			},

			-- peek
			{
				"<leader>ps",
				function()
					require('telescope.builtin').lsp_workspace_symbols()
				end,
				desc = "Peek workspace symbols"
			},
		}
	},
	{
		"ahmedkhalf/project.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function()
			require("project_nvim").setup()
			require("telescope").load_extension("projects")
		end
	},
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release'
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
		"neovim/nvim-lspconfig",
		opts = {
			diagnostics = {
				underline = true,
				update_in_insert = false,
				virtual_text = {
					spacing = 4,
					source = "if_many",
					prefix = "●",
				},
				severity_sort = true,
			}
		},
		config = function()
			vim.lsp.enable('gitlab_ci_ls')
			vim.lsp.enable('ts_ls')
			vim.lsp.enable('nixd')
			vim.lsp.enable('basedpyright')
			vim.lsp.enable('lua_ls')
			vim.lsp.enable('jsonls')
			vim.lsp.enable('gopls')
			vim.lsp.enable('golang_ci_lint')
		end
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
			local cmp = require('cmp')

			require('cmp').setup({
				snippet = {
					expand = function(args)
						vim.snippet.expand(args.body)
					end
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					['<C-Down>'] = cmp.mapping.scroll_docs(-4),
					['<C-Up>'] = cmp.mapping.scroll_docs(4),
					['<C-e>'] = cmp.mapping.abort(),
					['<CR>'] = cmp.mapping.confirm({ select = false }),
					['<Right>'] = cmp.mapping.confirm({ select = false }),
				}),
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					{ name = "nvim_lsp_document_symbol" },
					{ name = "nvim_lsp_signature_help" },

					{ name = "dictionary" },

					{ name = "path" },
					{ name = "git" },
					{ name = "vimwiki" },
				}, {
					{ name = "buffer" },
				})
			})

			cmp.setup.cmdline({ '/', '?' }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = 'buffer' }
				}
			})

			cmp.setup.cmdline(':', {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = 'path' }
				}, {
					{ name = 'cmdline' }
				}),
				matching = { disallow_symbol_nonprefix_matching = false }
			})
		end
	},
	{ "hrsh7th/cmp-nvim-lsp", lazy = true },
	{ "hrsh7th/cmp-buffer",   lazy = true },
	{ "hrsh7th/cmp-path",     lazy = true },
	{
		"ThePrimeagen/refactoring.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		keys = {
			{ "<leader>r", "", desc = "+refactor", mode = { "n", "v" } },
			{
				"<leader>rs",
				pick,
				mode = "v",
				desc = "Refactor",
			},
			{
				"<leader>ri",
				function()
					require("refactoring").refactor("Inline Variable")
				end,
				mode = { "n", "v" },
				desc = "Inline Variable",
			},
			{
				"<leader>rb",
				function()
					require("refactoring").refactor("Extract Block")
				end,
				desc = "Extract Block",
			},
			{
				"<leader>rf",
				function()
					require("refactoring").refactor("Extract Block To File")
				end,
				desc = "Extract Block To File",
			},
			{
				"<leader>rP",
				function()
					require("refactoring").debug.printf({ below = false })
				end,
				desc = "Debug Print",
			},
			{
				"<leader>rp",
				function()
					require("refactoring").debug.print_var({ normal = true })
				end,
				desc = "Debug Print Variable",
			},
			{
				"<leader>rc",
				function()
					require("refactoring").debug.cleanup({})
				end,
				desc = "Debug Cleanup",
			},
			{
				"<leader>rf",
				function()
					require("refactoring").refactor("Extract Function")
				end,
				mode = "v",
				desc = "Extract Function",
			},
			{
				"<leader>rF",
				function()
					require("refactoring").refactor("Extract Function To File")
				end,
				mode = "v",
				desc = "Extract Function To File",
			},
			{
				"<leader>rx",
				function()
					require("refactoring").refactor("Extract Variable")
				end,
				mode = "v",
				desc = "Extract Variable",
			},
			{
				"<leader>rp",
				function()
					require("refactoring").debug.print_var()
				end,
				mode = "v",
				desc = "Debug Print Variable",
			},
		},
		opts = {
			prompt_func_return_type = {
				go = false,
				java = false,
				cpp = false,
				c = false,
				h = false,
				hpp = false,
				cxx = false,
			},
			prompt_func_param_type = {
				go = false,
				java = false,
				cpp = false,
				c = false,
				h = false,
				hpp = false,
				cxx = false,
			},
			printf_statements = {},
			print_var_statements = {},
			show_success_message = true, -- shows a message with information about the refactor on success
			-- i.e. [Refactor] Inlined 3 variable occurrences
		},
		config = function(_, opts)
			require("refactoring").setup(opts)
			require("telescope").load_extension("refactoring")
		end,
	},
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
	}, {
	"nvim-neo-tree/neo-tree.nvim",
	cmd = "Neotree",
	keys = {
		{
			"<leader>fe",
			function()
				require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
			end,
			desc = "Explorer NeoTree (cwd)",
		},
		{ "<leader>e", "<leader>fe", desc = "Explorer NeoTree (cwd)", remap = true },
		{
			"<leader>ge",
			function()
				require("neo-tree.command").execute({ source = "git_status", toggle = true })
			end,
			desc = "Git Explorer",
		},
		{
			"<leader>be",
			function()
				require("neo-tree.command").execute({ source = "buffers", toggle = true })
			end,
			desc = "Buffer Explorer",
		},
		{
			"<leader>te",
			function()
				require("neo-tree.command").execute({ toggle = true })
			end
		}
	},
	deactivate = function()
		vim.cmd([[Neotree close]])
	end,
	init = function()
		vim.api.nvim_create_autocmd("BufEnter", {
			group = vim.api.nvim_create_augroup("Neotree_start_directory", { clear = true }),
			desc = "Start Neo-tree with directory",
			once = true,
			callback = function()
				if package.loaded["neo-tree"] then
					return
				else
					local stats = vim.uv.fs_stat(vim.fn.argv(0))
					if stats and stats.type == "directory" then
						require("neo-tree")
					end
				end
			end,
		})
	end,
	opts = {
		sources = { "filesystem", "buffers", "git_status" },
		open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
		filesystem = {
			bind_to_cwd = false,
			follow_current_file = { enabled = true },
			use_libuv_file_watcher = true,
		},
		window = {
			mappings = {
				["<right>"] = "open",
				["<left>"] = "close_node",
				["<space>"] = "none",
				["Y"] = {
					function(state)
						local node = state.tree:get_node()
						local path = node:get_id()
						vim.fn.setreg("+", path, "c")
					end,
					desc = "Copy Path to Clipboard",
				},
				["O"] = {
					function(state)
						require("lazy.util").open(state.tree:get_node().path, { system = true })
					end,
					desc = "Open with System Application",
				},
				["P"] = { "toggle_preview", config = { use_float = false } },
			},
		},
		default_component_configs = {
			indent = {
				with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
				expander_collapsed = "",
				expander_expanded = "",
				expander_highlight = "NeoTreeExpander",
			},
			git_status = {
				symbols = {
					unstaged = "󰄱",
					staged = "󰱒",
				},
			},
		},
	},
	config = function(_, opts)
		require("neo-tree").setup(opts)
		vim.api.nvim_create_autocmd("TermClose", {
			pattern = "*lazygit",
			callback = function()
				if package.loaded["neo-tree.sources.git_status"] then
					require("neo-tree.sources.git_status").refresh()
				end
			end,
		})
	end
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
		'alexghergh/nvim-tmux-navigation',
		config = function()
			local nvim_tmux_nav = require('nvim-tmux-navigation')

			nvim_tmux_nav.setup {
				disable_when_zoomed = true -- defaults to false
			}

			vim.keymap.set('n', "<M-left>", nvim_tmux_nav.NvimTmuxNavigateLeft)
			vim.keymap.set('n', "<M-Down>", nvim_tmux_nav.NvimTmuxNavigateDown)
			vim.keymap.set('n', "<M-Up>", nvim_tmux_nav.NvimTmuxNavigateUp)
			vim.keymap.set('n', "<M-Right>", nvim_tmux_nav.NvimTmuxNavigateRight)
			vim.keymap.set('n', "<M-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
			vim.keymap.set('n', "<M-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
		end
	}, {
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
		{ "<leader>dx", "<cmd>Trouble diagnostics toggle<cr>",              desc = "Diagnostics (Trouble)" },
		{ "<leader>dX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
		{ "<leader>cs", "<cmd>Trouble symbols toggle<cr>",                  desc = "Symbols (Trouble)" },
		{ "<leader>cS", "<cmd>Trouble lsp toggle<cr>",                      desc = "LSP references/definitions/... (Trouble)" },
		{ "<leader>tL", "<cmd>Trouble loclist toggle<cr>",                  desc = "Location List (Trouble)" },
		{ "<leader>tQ", "<cmd>Trouble qflist toggle<cr>",                   desc = "Quickfix List (Trouble)" },
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
}, {
	"folke/todo-comments.nvim",
	cmd = { "TodoTrouble", "TodoTelescope" },
	opts = {},
	-- stylua: ignore
	keys = {
		{ "]t",         function() require("todo-comments").jump_next() end,              desc = "Next Todo Comment" },
		{ "[t",         function() require("todo-comments").jump_prev() end,              desc = "Previous Todo Comment" },
		{ "<leader>dt", "<cmd>Trouble todo toggle<cr>",                                   desc = "Todo (Trouble)" },
		{ "<leader>dT", "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
		{ "<leader>st", "<cmd>TodoTelescope<cr>",                                         desc = "Todo" },
		{ "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>",                 desc = "Todo/Fix/Fixme" },
	},
},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "gofmt" },
				python = {
					"isort",
					"black"
				},
			},

			["*"] = { "codespell" },

			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},

			default_format_opts = {
				lsp_format = "fallback",
			},
		},
	}
}
