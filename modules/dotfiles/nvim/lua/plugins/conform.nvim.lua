return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			-- Customize or remove this keymap to your liking
			"<leader>f",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},

	opts = {
		-- Define your formatters
		formatters_by_ft = {
			nix = { "nixfmt" },
			lua = { "stylua" },
			python = { "isort", "black" },

			java = { "google-java-format" },

			javascript = {
				"prettierd",
				"prettier",
				stop_after_first = true
			},
		},

		-- Set default options
		default_format_opts = {
			lsp_format = "fallback",
		},

		-- Set up format-on-save
		format_on_save = { timeout_ms = 20000 },

		-- Customize formatters
		formatters = {
			shfmt = {
				prepend_args = { "-i", "2" },
			},

			["google-java-format"] = {
				prepend_args = { "--aosp", "--fix-imports-only" }
			},
		},
	},

	config = function(_, opts)
		local conform = require('conform')

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				require("conform").format({ bufnr = args.buf })
			end,
		})

		conform.setup(opts)
	end,
	init = function()
		-- If you want the formatexpr, here is the place to set it
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
