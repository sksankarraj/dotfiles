local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("GeistMono Nerd Font Mono", {weight="Regular"})
config.font_size = 12

config.enable_tab_bar = false
config.window_decorations = "RESIZE"

config.color_scheme = 'Gruvbox light, hard (base16)'
config.max_fps = 60

local mux = wezterm.mux

wezterm.on('gui-startup', function(window)
  local tab, pane, window = mux.spawn_window(cmd or {})
  local gui_window = window:gui_window();
  gui_window:perform_action(wezterm.action.ToggleFullScreen, pane)
end)

config.native_macos_fullscreen_mode = true

return config
