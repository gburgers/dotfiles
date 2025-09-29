-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

config.automatically_reload_config = true
config.window_close_confirmation = "NeverPrompt"
config.adjust_window_size_when_changing_font_size = false
config.window_decorations = "RESIZE"
config.check_for_updates = false
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false

-- or, changing the font size and color scheme.
config.font =
  wezterm.font('JetBrains Mono', { weight = 'Medium' })
config.font_size = 16
config.color_scheme = 'Catppuccin Mocha'
config.window_background_opacity = 0.85

config.hide_tab_bar_if_only_one_tab = true
config.enable_scroll_bar = true

config.window_padding = {
	left = 20,
	right = 0,
	top = 2,
	bottom = 0,
}

-- Finally, return the configuration to wezterm:
return config
