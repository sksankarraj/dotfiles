local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("Ubuntu Mono")
config.font_size = 14

config.enable_tab_bar = false
config.window_decorations = "RESIZE"

config.color_scheme = 'Catppuccin Mocha'

local mux = wezterm.mux

wezterm.on('gui-startup', function(window)
  local tab, pane, window = mux.spawn_window(cmd or {})
  local gui_window = window:gui_window();
  gui_window:perform_action(wezterm.action.ToggleFullScreen, pane)
end)

config.native_macos_fullscreen_mode = true

return config

