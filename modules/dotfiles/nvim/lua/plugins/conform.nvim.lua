return {
	"stevearc/conform.nvim",
	enabled = true,
	-- event = { "BufWritePre" },
	-- cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			nix = { "nixfmt" },
			lua = { "stylua" },
			python = { "isort", "black" },

			javascript = {
				"prettierd",
				"prettier",
				stop_after_first = true,
			},

			java = {
				"intellij",
				stop_after_first = true,
			},
		},

		default_format_opts = {
			lsp_format = "fallback",
		},

		-- format_on_save = {
		-- 	timeout_ms = 20000,
		-- 	lsp_format = "fallback"
		-- },

		-- Customize formatters
		formatters = {
			intellij = {
				command = "idea-community",
				stdin = false,
				args = {
					"format",
					"-s",
					os.getenv("HOME") .. "/github.com/sabaruto/nixos/tools/java/xml/profiles-v21.xml",
					"$FILENAME",
				},
			},
			my_formatter = {
				command = "my_cmd",
			},
		},
	},

	init = function()
		-- If you want the formatexpr, here is the place to set it
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"


		vim.api.nvim_create_user_command("Format", function(args)
			local range = nil
			if args.count ~= -1 then
				local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
				range = {
					start = { args.line1, 0 },
					["end"] = { args.line2, end_line:len() },
				}
			end
			require("conform").format({ async = true, lsp_format = "fallback", range = range })
		end, { range = true })
	end,
}
