return {
	"stevearc/conform.nvim",
	enabled = true,
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

			javascript = {
				"prettierd",
				"prettier",
				stop_after_first = true
			},

			java = {
				"clang-format"
			},
		},

		-- Set default options
		default_format_opts = {
			lsp_format = "fallback",
		},

		-- Set up format-on-save
		format_on_save = {
			timeout_ms = 20000,
			lsp_format = "fallback"
		},

		-- Customize formatters
		formatters = {
			shfmt = {
				prepend_args = { "-i", "2" },
			},
		},
	},
	init = function()
		-- If you want the formatexpr, here is the place to set it
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
