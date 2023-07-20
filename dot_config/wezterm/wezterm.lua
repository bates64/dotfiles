local wezterm = require 'wezterm'

local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font = wezterm.font 'ComicCodeLigatures Nerd Font'

config.color_scheme = 'carbonfox'

config.window_padding = {
	left = 8,
	right = 8,
	top = 8,
	bottom = 8,
}

return config
