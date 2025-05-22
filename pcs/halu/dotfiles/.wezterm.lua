local wezterm = require("wezterm")

local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- change config now
config.default_domain = 'WSL:NixOS'
config.font_size = 10
config.font = wezterm.font("CaskaydiaCove Nerd Font")
config.color_scheme = 'Catppuccin Latte (Gogh)'

config.leader = {
	key = " ",
	mods = "CTRL|ALT",
	timeout_milliseconds = 1000
}

config.keys = {
	{
		key = '-',
		mods = "LEADER",
		action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }
	},
	{
		key = '|',
		-- Shift it active when '|' is being used
		mods = "LEADER|SHIFT",
		action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
	},
	{
		key = 'q',
		mods = "LEADER",
		action = wezterm.action.CloseCurrentPane { confirm = false }
	},
	{
		key = 'q',
		mods = "CTRL|ALT",
		action = wezterm.action.CloseCurrentPane { confirm = true }
	},
	{
		key = 'm',
		mods = "CTRL|ALT",
		action = wezterm.action.PaneSelect
	},
	{
		key = 'TAB',
		mods = "LEADER",
		action = wezterm.action.PaneSelect
	}
}

return config
