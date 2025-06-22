return {
	{
		"sabaruto/markdown-preview.nvim",
		branch = "update",
		-- enabled = false,
		-- dir = "~/github.com/sabaruto/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		config = function(_, _) vim.fn["mkdp#util#install"]() end,
	}
}
