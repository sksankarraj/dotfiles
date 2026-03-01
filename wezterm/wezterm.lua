local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("ubuntu mono", {weight="regular"})
config.font_size = 12

config.enable_tab_bar = false
config.window_decorations = "resize"

-- config.color_scheme = 'gruvbox light, hard (base16)'
config.color_scheme = "catppuccin mocha"
config.max_fps = 60

local mux = wezterm.mux

wezterm.on('gui-startup', function(window)
  local tab, pane, window = mux.spawn_window(cmd or {})
  local gui_window = window:gui_window();
  gui_window:perform_action(wezterm.action.togglefullscreen, pane)
end)

config.native_macos_fullscreen_mode = true

return config
