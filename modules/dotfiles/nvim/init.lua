if vim.g.vscode then
	require("vscode-config.keymaps")
else
	require("config.options")
	require("config.usercommands")
	require("config.keymaps")
	require("config.autocmds")
	require("config.plugins")
	require("config.colorscheme")
	vim.cmd("colorscheme rose-pine-moon")
end
