-- Icons
local wd_icons = require("nvim-web-devicons")
wd_icons.setup()

-- Colourscheme
local rose_pine = require("rose-pine")
rose_pine.setup()
vim.cmd("colorscheme rose-pine")

-- Which Key
local wk = require("which-key")

wk.setup({
	preset = "helix",
	win = { row = 50, col = 0 },
	spec = {
		{
			mode = { "n", "v" },
			{ "<leader><tab>", group = "tabs" },
			{
				"<leader>b",
				group = "buffer",
				expand = function()
					return require("which-key.extras").expand.buf()
				end
			},
			{ "<leader>c", group = "code" },
			{ "<leader>d", group = "debug" },
			{ "<leader>f", group = "file" },
			{ "<leader>g", group = "git" },
			{ "<leader>p", group = "persistence" },
			{ "<leader>q", group = "quit/session" },
			{ "<leader>s", group = "search" },
			{ "<leader>u", group = "ui", icon = { icon = "󰙵 ", color = "cyan" } },
			{ "<leader>x", group = "windows" },
			{ "[", group = "prev" },
			{ "]", group = "next" },
			{ "g", group = "goto" },
			{ "gs", group = "surround" },
			{ "z", group = "fold" },
			{
				"<leader>?",
				function()
					require("which-key").show({ global = true })
				end,
				desc = " Keymaps (which-key)",
			},
		},
	},
})

require("config.plugins.treesitter")

-- Better Escape
local better_escape = require("better_escape")
better_escape.setup()

-- Flash
local flash = require("flash")
flash.setup()

wk.add({
	{
		mode = { "n", "x", "o" },
		{ "<c-s>", flash.jump },
		{ "S",     flash.treesitter },
	},
	{ mode = { "o" },      "r",     flash.remote,            desc = "Remote Flash" },
	{ mode = { "o", "x" }, "R",     flash.treesitter_search, desc = "Treesitter Search" },
	{ mode = { "c" },      "<c-s>", flash.toggle,            desc = "Toggle Flash Search" },
})

-- Persistence
local prs = require("persistence")
prs.setup()

wk.add({
	{ "<leader>ps", prs.load },
	{ "<leader>pS", prs.select },
	{ "<leader>pl", function() prs.load({ last = true }) end },
	{ "<leader>pd", prs.stop },
})

-- Neo Tree
local neo_tree = require("neo-tree")
neo_tree.setup(
	{
		popup_border_style = "",
		open_files_do_not_replace_types = { "terminal", "trouble", "qf" },

		source_selector = { winbar = true },
		filesystem = {
			follow_current_file = { enabled = true },
			hijack_netrw_behavior = "disabled",
		},

		sources = {
			"filesystem",
			"buffers",
			"git_status",
		},

		window = {
			mappings = {
				["l"] = "open",
				["h"] = "close_node",
			},
		},

		buffers = {
			follow_current_file = { enabled = true },
			window = {
				mappings = {
					["l"] = "open",
					["h"] = "close_node",
				},
			},
		},

		git_status = {
			window = {
				mappings = {
					["l"] = "open",
					["h"] = "close_node",
				},
			},
		},

		zk = {
			follow_current_file = true,
		},
	}
)

wk.add({
	{ "<leader>t", ":Neotree toggle<CR>", desc = "Toggle Neotree" }
})

-- Noice
local noice = require("noice")

noice.setup({
	lsp = {
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
		},
		presets = {
			command_palette = false,
			long_message_to_split = true,
			inc_rename = true,
		},
	}
})

require("config.plugins.lualine")

-- !--LSP--!
require("lspconfig")

vim.lsp.enable({
	"jsonls",
	"lua_ls",
	"nil_ls",
	"vale_ls",
	"nixd",
	"statix",
	"gopls",
	"pyright",
	"lemminx",
	"spectral",
	"html",
	"cssls",
	"yamlls",
	"markdown_oxide",
})

vim.lsp.config("*", {
	root_markers = { ".git" },
	capabilities = {
		textDocument = {
			semanticTokens = {
				multilineTokenSupport = true,
			},
		},
	},
})

require("config.plugins.blink")
-- require("config.plugins.nvim-lint")
require("config.plugins.conform")

require("config.plugins.snacks")
wk.add(
	{
		{ "<leader>Z",  function() Snacks.zen.zoom() end,                desc = "Toggle Zoom", },
		{ "<leader>.",  function() Snacks.scratch() end,                 desc = "Toggle Scratch Buffer", },
		{ "<leader>S",  function() Snacks.scratch.select() end,          desc = "Select Scratch Buffer", },
		{ "<leader>n",  function() Snacks.notifier.show_history() end,   desc = "Notification History", },
		{ "<leader>bd", function() Snacks.bufdelete() end,               desc = "Delete Buffer", },
		{ "<leader>fR", function() Snacks.rename.rename_file() end,      desc = "Rename File", },
		{ "<leader>gB", function() Snacks.gitbrowse() end,               desc = "Git Browse",                mode = { "n", "v" }, },
		{ "<leader>gg", function() Snacks.lazygit() end,                 desc = "Lazygit", },
		{ "<leader>un", function() Snacks.notifier.hide() end,           desc = "Dismiss All Notifications", },
		{ "]]",         function() Snacks.words.jump(vim.v.count1) end,  desc = "Next Reference",            mode = { "n", "t" }, },
		{ "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference",            mode = { "n", "t" }, },
		{
			"<leader>N",
			desc = "Neovim News",
			function()
				Snacks.win({
					file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
					width = 0.6,
					height = 0.6,
					wo = { spell = false, wrap = false, signcolumn = "yes", statuscolumn = " ", conceallevel = 3, },
				})
			end,
		},
	})

require("config.plugins.mini")
wk.add({
	{ "<leader>e", "<CMD>lua require('mini.files').open(vim.api.nvim_buf_get_name(0), true)<CR>", desc = "Open mini files (current directory)" },
	{ "<leader>E", "<CMD>lua require('mini.files').open(vim.uv.cwd(), true)<CR>",                 desc = "Open mini files (cwd)" },
})

require("config.plugins.gitsigns")

require("config.plugins.telescope")
local telescope = require("telescope.builtin")
local telescope_ext = require("telescope").extensions
wk.add({
	{
		mode = { "n", "v" },
		{ "gd",         telescope.lsp_definitions,       desc = "Goto Definitions" },
		{ "gi",         telescope.lsp_implementations,   desc = "Goto Implementations" },
		{ "gr",         telescope.lsp_references,        desc = "Goto References" },
		{ "gt",         telescope.lsp_type_definitions,  desc = "Goto type References" },
		{ "gps",        telescope.lsp_workspace_symbols, desc = "Goto workspace symbols" },

		-- find
		{ "<leader>ff", telescope.find_files,            desc = "Find files" },
		{ "<leader>fw", telescope.grep_string,           desc = "Find files with word under cursor" },

		{
			"<leader>fS",
			telescope.lsp_document_symbols,
			desc = "Find document symbols"
		},
		{ "<leader>fr", telescope.registers, desc = "Find registers" },
		{ "<leader>fo", telescope.oldfiles,  desc = "Find recent files" },

		{
			"<leader>f/",
			telescope.current_buffer_fuzzy_find,
			desc = "Find buffers with fuzzy find"
		},
		{ "<leader>fk", telescope.keymaps,     desc = "Find keymaps" },
		{ "<leader>fc", telescope.colorscheme, desc = "Find colorschemes" },
		{
			"<leader>fb",
			function()
				telescope_ext.file_browser.file_browser({ path = "%:p:h" })
			end,
			desc = "Find Folders / Files"
		},

		{
			"<leader>fB",
			telescope_ext.file_browser.file_browser,
			desc = "Find Folders / Files (cwd)"
		},


		{
			"<leader>fm",
			telescope_ext.media_files.media_files,
			desc = "Find Media Files"
		},


		-- search
		{ "<leader>/",   telescope.live_grep,    desc = "Find files by grep" },

		-- Git
		{ "<leader>gf",  telescope.git_files,    desc = "Find git files" },
		{ "<leader>gb",  telescope.git_branches, desc = "Find git branches" },
		{ "<leader>gs",  telescope.git_status,   desc = "Find git status" },
		{ "<leader>gS",  telescope.git_status,   desc = "Find git stash" },

		{ "<leader>gcc", telescope.git_commits,  desc = "Find git commits" },

		{
			"<leader>gcb",
			telescope.git_bcommits,
			desc = "Find and checkout git commits"
		},

		{ "<leader>gC", function() telescope_ext.conflicts.conflicts({}) end, desc = "Find conflicting files" },
	}
})
