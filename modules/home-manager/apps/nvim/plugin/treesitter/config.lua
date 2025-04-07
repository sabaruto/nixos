vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		vim.cmd("TSEnable hightlight")
	end
})
