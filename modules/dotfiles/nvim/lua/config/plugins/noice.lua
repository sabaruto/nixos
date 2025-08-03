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
	},
})
