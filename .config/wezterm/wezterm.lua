
local format = require('format')
local status = require('status')
local event = require('event')
local keymap = require('keymap')
local mousemap = require('mousemap')

local wezterm = require('wezterm');

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config = {
  -- キーバインド系
  disable_default_key_bindings = true,
  keys = keymap.keys,
  key_tables = keymap.key_tables,
  leader = { 
    key = ",", 
    mods = "CTRL", 
    timeout_milliseconds = 2000 
  },
  -- 見た目系
  color_scheme = "catppuccin-macchiato",
  -- window_background_opacity = 0.523,
  --win32_system_backdrop = 'Acrylic',
  font = wezterm.font_with_fallback {
    "Hack Nerd Font Propo",
    "HackGenNerd Console",
    "Noto Sans CJK JP",
  },
  font_size = 14.0,
  window_frame = {
    font = wezterm.font { family ='Roboto', weight = 'Bold' },
    font_size = 11.0,
  },
  status_update_interval = 1000,
  window_decorations = "RESIZE",
  mouse_bindings = mousemap.mouse_bindings,
  -- タブ系
  enable_tab_bar = true,
  -- タイトルバー系
  -- 実行・動作系
}

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
  config.default_prog = { "C:/Program Files/PowerShell/7/pwsh.exe", "-NoLogo"}
else
  config.default_prog = { "/usr/bin/zsh" }
end 

return config
