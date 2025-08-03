require("render-markdown").setup({
	preset = "obsidian",
	completions = {
		lsp = {
			enabled = true,
		},
	},
})

-- zk
if vim.fs.root(0, { ".zk" }) then
	vim.cmd.runtime("ftplugin/plugins/zk.lua")
end
