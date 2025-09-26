if vim.g.vscode then
else
	require("config.options")
	require("config.usercommands")
	require("config.keymaps")
	require("config.autocmds")
	require("config.plugins")
	require("config.colorscheme")
	vim.cmd("colorscheme rose-pine-dawn")
end
