return {
	{
		"sabaruto/markdown-preview.nvim",
		branch = "theodosia/full-upgrade",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end
	}
}
