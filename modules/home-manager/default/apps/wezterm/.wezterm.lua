local wezterm = require('wezterm')

local config = wezterm.config_builder()

config.font_size = 12
config.color_scheme = 'Rosé Pine Dawn (Gogh)'
config.font = wezterm.font("MartianMono Nerd Font")
config.window_decorations = 'NONE'

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
		key = 'Tab',
		mods = "LEADER",
		action = wezterm.action.PaneSelect
	}
}

return config
