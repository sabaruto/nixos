vim.cmd.runtime("ftplugin/plugins/render-markdown.lua")

-- zk
if vim.fs.root(0, { ".zk" }) then
	vim.cmd.runtime("ftplugin/plugins/zk.lua")
end
