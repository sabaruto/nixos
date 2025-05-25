local wezterm = require('wezterm')

local config = wezterm.config_builder()

config.font_size = 12
config.color_scheme = 'Rosé Pine (Gogh)'
config.window_decorations = 'INTEGRATED_BUTTONS'

return config
