return {
	{
		"obsidian-nvim/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		lazy = true,
		event = {
			"BufReadPre " .. vim.fn.expand "~" .. "/personal-library/*.md",
			"BufNewFile " .. vim.fn.expand "~" .. "/personal-library/*.md",

			"BufReadPre " .. vim.fn.expand "~" .. "/notes/*.md",
			"BufNewFile " .. vim.fn.expand "~" .. "/notes/*.md",
			"BufReadPre " .. vim.fn.expand "~" .. "/github.com/t-aaronobelley/obsidian-notes/*.md",
			"BufNewFile " .. vim.fn.expand "~" .. "/github.com/t-aaronobelley/obsidian-notes/*.md",
		},

		ui = {
			enable = true,
		},

		dependencies = {
			"nvim-lua/plenary.nvim",
			"preservim/vim-markdown",
			"folke/snacks.nvim",
		},
		opts = {
			notes_dubdir = "rough_notes",
			disable_frontmatter = true,

			workspaces = {
				{
					name = "personal library",
					path = "~/personal-library",
				},
				{
					name = "Notes",
					path = "~/notes",
				},
				{
					name = "Teya notes",
					path = "~/github.com/t-aaronobelley/obsidian-notes"
				},
				{
					name = "no-vault",
					path = function()
						return assert(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))
					end,
					overrides = {
						notes_subdir = vim.NIL,
						new_notes_location = "current_dir",
						templates = {
							folder = vim.NIL,
						},
						disable_frontmatter = true,
					},
				}

			},

			daily_notes = {
				-- Optional, if you keep daily notes in a separate directory.
				folder = "rough-notes",
				-- Optional, if you want to change the date format for the ID of daily notes.
				date_format = "%d-%m-%Y",
				-- Optional, if you want to change the date format of the default alias of daily notes.
				alias_format = "%B %-d, %Y",
				-- Optional, default tags to add to each new daily note created.
				default_tags = { "daily-notes" },
				-- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
				template = nil
			},

			note_id_func = function(title)
				-- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
				-- In this case a note with the title 'My new note' will be given an ID that looks
				-- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
				local suffix = ""
				if title ~= nil then
					-- If title is given, transform it into valid file name.
					suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
				else
					-- If title is nil, just add 4 random uppercase letters to the suffix.
					for _ = 1, 4 do
						suffix = suffix .. string.char(math.random(65, 90))
					end
				end
				return tostring(os.time()) .. "-" .. suffix
			end,

			mappings = {
				-- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
				["gf"] = {
					action = function()
						return require("obsidian").util.gf_passthrough()
					end,
					opts = { noremap = false, expr = true, buffer = true },
				},

				-- Toggle check-boxes.
				["<leader>tc"] = {
					action = function()
						return require("obsidian").util.toggle_checkbox()
					end,
					opts = { buffer = true },
				},

				-- Smart action depending on context, either follow link or toggle checkbox.
				["<cr>"] = {
					action = function()
						return require("obsidian").util.smart_action()
					end,
					opts = { buffer = true, expr = true },
				}
			},

			completion = {
				nvim_cmp = false,
				blink = true,
			},

			open = {
				use_advanced_uri = true,
			},

			new_notes_location = "notes_subdir",
			wiki_link_func = "prepend_note_id",
		},
		keys = {
			-- { ft = "markdown" }
			{ "<localleader>n", "<cmd>ObsidianNew<cr>",         ft = "markdown", desc = "Create new Obsidian Page" },
			{ "<localleader>g", "<cmd>ObsidianOpen<cr>",        ft = "markdown", desc = "Open file in Obsidian App" },
			{ "<localleader>f", "<cmd>ObsidianQuickSwitch<cr>", ft = "markdown", desc = "Open Obsidian File" },
			{ "<localleader>l", "<cmd>ObsidianFollowLink<cr>",  ft = "markdown", desc = "Follow Obsidian Link" },
			{ "<localleader>t", "<cmd>ObsidianTags<cr>",        ft = "markdown", desc = "Search Obsidian tags" },
			{ "<localleader>s", "<cmd>ObsidianSearch<cr>",      ft = "markdown", desc = "Search for notes in vault" },
		}
	}
}
