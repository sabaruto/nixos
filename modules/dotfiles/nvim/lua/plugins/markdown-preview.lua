return {
	{
		"dcai/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		config = function(_, _)
			vim.fn["mkdp#util#install"]()
		end,
	},
}
