return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { { "folke/neoconf.nvim", cmd = "Neoconf", opts = {} } },
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			diagnostics = {
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			},
		},
		config = function()
			vim.lsp.enable("gitlab_ci_ls")
			vim.lsp.enable("ts_ls")
			vim.lsp.enable("nixd")
			vim.lsp.enable("basedpyright")
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("jsonls")
			vim.lsp.enable("gopls")
			vim.lsp.enable("golang_ci_lint")
			vim.lsp.enable("marksman")
		end,
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "gofmt" },
				python = {
					"black",
					"isort",
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
	},
	{
		"mfussenegger/nvim-lint",
		opts = {
			events = { "BufWritePost", "BufReadPost", "InsertLeave" },
			linters_by_ft = {
				go = { "golangcilint" },
				python = { "mypy" },
			},
		},
		config = function(_, opts)
			local M = {}

			local lint = require("lint")
			function M.debounce(ms, fn)
				local timer = vim.uv.new_timer()
				return function(...)
					local argv = { ... }
					timer:start(ms, 0, function()
						timer:stop()
						vim.schedule_wrap(fn)(unpack(argv))
					end)
				end
			end

			function M.lint()
				-- Use nvim-lint's logic first:
				-- * checks if linters exist for the full filetype first
				-- * otherwise will split filetype by "." and add all those linters
				-- * this differs from conform.nvim which only uses the first filetype that has a formatter
				local names = lint._resolve_linter_by_ft(vim.bo.filetype)

				-- Create a copy of the names table to avoid modifying the original.
				names = vim.list_extend({}, names)

				-- Add fallback linters.
				if #names == 0 then
					vim.list_extend(names, lint.linters_by_ft["_"] or {})
				end

				-- Add global linters.
				vim.list_extend(names, lint.linters_by_ft["*"] or {})

				-- Filter out linters that don't exist or don't match the condition.
				local ctx = { filename = vim.api.nvim_buf_get_name(0) }
				ctx.dirname = vim.fn.fnamemodify(ctx.filename, ":h")
				names = vim.tbl_filter(function(name)
					local linter = lint.linters[name]
					return linter and not (type(linter) == "table" and linter.condition and not linter.condition(ctx))
				end, names)

				-- Run linters.
				if #names > 0 then
					lint.try_lint(names)
				end
			end

			vim.api.nvim_create_autocmd(opts.events, {
				group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
				callback = M.debounce(100, M.lint),
			})
		end,
	},
	{
		"ThePrimeagen/refactoring.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		keys = function()
			local refactoring = require("refactoring")
			return {
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
						refactoring.refactor("Inline Variable")
					end,
					mode = { "n", "v" },
					desc = "Inline Variable",
				},
				{
					"<leader>rb",
					function()
						refactoring.refactor("Extract Block")
					end,
					desc = "Extract Block",
				},
				{
					"<leader>rf",
					function()
						refactoring.refactor("Extract Block To File")
					end,
					desc = "Extract Block To File",
				},
				{
					"<leader>rP",
					function()
						refactoring.debug.printf({ below = false })
					end,
					desc = "Debug Print",
				},
				{
					"<leader>rp",
					function()
						refactoring.debug.print_var({ normal = true })
					end,
					desc = "Debug Print Variable",
				},
				{
					"<leader>rc",
					function()
						refactoring.debug.cleanup({})
					end,
					desc = "Debug Cleanup",
				},
				{
					"<leader>rf",
					function()
						refactoring.refactor("Extract Function")
					end,
					mode = "v",
					desc = "Extract Function",
				},
				{
					"<leader>rF",
					function()
						refactoring.refactor("Extract Function To File")
					end,
					mode = "v",
					desc = "Extract Function To File",
				},
				{
					"<leader>rx",
					function()
						refactoring.refactor("Extract Variable")
					end,
					mode = "v",
					desc = "Extract Variable",
				},
				{
					"<leader>rp",
					function()
						refactoring.debug.print_var()
					end,
					mode = "v",
					desc = "Debug Print Variable",
				},
			}
		end,
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
	{ "nvim-neotest/nvim-nio" },
}
