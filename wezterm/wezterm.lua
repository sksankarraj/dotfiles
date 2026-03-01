local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font_with_fallback({"JetBrains Mono"})
config.font_size = 14

config.enable_tab_bar = false
config.window_decorations = "RESIZE"

-- config.color_scheme = 'gruvbox light, hard (base16)'
config.color_scheme = "Catppuccin Mocha"
config.max_fps = 120
config.animation_fps = 120
config.front_end = "WebGpu"

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

local mux = wezterm.mux

config.native_macos_fullscreen_mode = true

wezterm.on('gui-startup', function(window)
  local tab, pane, window = mux.spawn_window(cmd or {})
  local gui_window = window:gui_window();
  gui_window:perform_action(wezterm.action.ToggleFullScreen, pane)
end)


return config
