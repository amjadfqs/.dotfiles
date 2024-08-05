local wezterm = require("wezterm")
-- [[ constants ]]
-- padding
local padding_on = { left = 12, right = 12, top = 8, bottom = 8 }
local padding_off = { left = 0, right = 0, top = 0, bottom = 0 }

--gpu
local gpus = wezterm.gui.enumerate_gpus()

-- [[ config ]]
local config = wezterm.config_builder()

-- font
local font = wezterm.font("JetBrainsMono Nerd Font")

-- general
config.animation_fps = 60
config.max_fps = 60
config.front_end = "WebGpu"
config.webgpu_preferred_adapter = gpus[2]
config.enable_wayland = false

-- font
config.font_size = 12

-- theme
config.term = "wezterm"

-- ANSI and Bright colors
config.color_schemes = {
	["catppuccin-macchiato"] = {
		foreground = "#cad3f5",
		background = "#24273a",
		cursor_bg = "#f4dbd6",
		cursor_border = "#f4dbd6",
		cursor_fg = "#181926",
		selection_bg = "#5b6078",
		selection_fg = "#cad3f5",
		scrollbar_thumb = "#5b6078",
		split = "#6e738d",
		ansi = { "#494d64", "#ed8796", "#a6da95", "#eed49f", "#8aadf4", "#f5bde6", "#8bd5ca", "#b8c0e0" },
		brights = { "#5b6078", "#ed8796", "#a6da95", "#eed49f", "#8aadf4", "#f5bde6", "#8bd5ca", "#a5adcb" },
		indexed = { [16] = "#f5a97f", [17] = "#f4dbd6" },
		tab_bar = {
			background = "#181926",
			inactive_tab_edge = "#363a4f",
			active_tab = { bg_color = "#c6a0f6", fg_color = "#181926" },
			inactive_tab = { bg_color = "#1e2030", fg_color = "#cad3f5" },
			inactive_tab_hover = { bg_color = "#24273a", fg_color = "#cad3f5" },
			new_tab = { bg_color = "#363a4f", fg_color = "#cad3f5" },
			new_tab_hover = { bg_color = "#494d64", fg_color = "#cad3f5" },
		},
	},
}

-- Assign the color scheme to use
config.color_scheme = "catppuccin-macchiato"

-- tab bar
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
config.tab_max_width = 24

-- window
config.enable_scroll_bar = false
config.window_background_opacity = 0.90
config.window_frame = { font = font, font_size = 10.0 }
config.window_padding = padding_on
config.window_decorations = "NONE"

-- [[ events ]]

-- toggle padding on demand
wezterm.on("toggle-padding", function(window, _)
	local overrides = window:get_config_overrides() or {}

	if wezterm.GLOBAL.has_padding == false then
		overrides.window_padding = padding_on
		wezterm.GLOBAL.has_padding = true
	else
		overrides.window_padding = padding_off
		wezterm.GLOBAL.has_padding = false
	end

	window:set_config_overrides(overrides)
end)

-- [[ key bindings ]]
config.keys = {
	{ key = "K", mods = "CTRL", action = wezterm.action.ShowDebugOverlay },
	-- toggle padding
	{
		key = "P",
		mods = "CTRL|SHIFT",
		action = wezterm.action.EmitEvent("toggle-padding"),
	},

	-- nagivate tabs
	{
		key = "{",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		key = "}",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivateTabRelative(1),
	},

	-- move tabs
	{
		key = "{",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.MoveTabRelative(-1),
	},
	{
		key = "}",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.MoveTabRelative(1),
	},

	-- navigate panes
	{
		key = "H",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "L",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "K",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "J",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},

	-- resize panes
	{
		key = "H",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "L",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
	},
	{
		key = "K",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
	},
	{
		key = "J",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
	},

	-- vertical split
	{
		key = "_",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},

	-- horizontal split
	{
		key = "|",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitHorizontal,
	},

	{ key = "K", mods = "CTRL", action = wezterm.action.ShowDebugOverlay },
}

return config
