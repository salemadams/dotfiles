-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

config.font = wezterm.font("CaskaydiaCove Nerd Font Mono")

config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.8
config.macos_window_background_blur = 10

-- Tokyo Dark color scheme
config.colors = {
  foreground = '#a0a8cd',
  background = '#11121D',
  cursor_bg = '#a0a8cd',
  cursor_fg = '#11121D',
  cursor_border = '#a0a8cd',
  selection_fg = '#a0a8cd',
  selection_bg = '#212234',

  ansi = {
    '#06080a', -- black
    '#ee6d85', -- red
    '#95c561', -- green
    '#d7a65f', -- yellow
    '#7199ee', -- blue
    '#a485dd', -- magenta
    '#38a89d', -- cyan
    '#a0a8cd', -- white
  },

  brights = {
    '#212234', -- bright black
    '#ee6d85', -- bright red
    '#95c561', -- bright green
    '#d7a65f', -- bright yellow
    '#7199ee', -- bright blue
    '#a485dd', -- bright magenta
    '#38a89d', -- bright cyan
    '#a0a8cd', -- bright white
  },
}

return config
