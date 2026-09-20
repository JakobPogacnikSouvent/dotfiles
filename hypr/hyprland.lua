local colors = require("colors")

--###############
--## MONITORS ###
--###############

require("monitors")

--##################
--## MY PROGRAMS ###
--##################

require("programs")

--################
--## AUTOSTART ###
--################

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:

-- exec-once = $terminal
-- exec-once = nm-applet &
-- exec-once = waybar & hyprpaper & firefox

-- exec-once = systemctl --user start xdg-desktop-portal-wlr.service
-- exec-once = systemctl --user restart xdg-desktop-portal.service

hl.on("hyprland.start", function () 
  hl.dispatch(hl.dsp.focus({ workspace = "1" }))
end)

--############################
--## ENVIRONMENT VARIABLES ###
--############################

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")

--####################
--## LOOK AND FEEL ###
--####################

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1.0 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })
hl.animation({
    leaf = "global",
    enabled = true,
    speed = 10,
    bezier = "default",
})
hl.animation({
    leaf = "border",
    enabled = true,
    speed = 5.39,
    bezier = "easeOutQuint",
})
hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 4.79,
    bezier = "easeOutQuint",
})
hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 4.1,
    bezier = "easeOutQuint",
    style = "popin 87%",
})
hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 1.49,
    bezier = "linear",
    style = "popin 87%",
})
hl.animation({
    leaf = "fadeIn",
    enabled = true,
    speed = 1.73,
    bezier = "almostLinear",
})
hl.animation({
    leaf = "fadeOut",
    enabled = true,
    speed = 1.46,
    bezier = "almostLinear",
})
hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 3.03,
    bezier = "quick",
})
hl.animation({
    leaf = "layers",
    enabled = true,
    speed = 3.81,
    bezier = "easeOutQuint",
})
hl.animation({
    leaf = "layersIn",
    enabled = true,
    speed = 4,
    bezier = "easeOutQuint",
    style = "fade",
})
hl.animation({
    leaf = "layersOut",
    enabled = true,
    speed = 1.5,
    bezier = "linear",
    style = "fade",
})
hl.animation({
    leaf = "fadeLayersIn",
    enabled = true,
    speed = 1.79,
    bezier = "almostLinear",
})
hl.animation({
    leaf = "fadeLayersOut",
    enabled = true,
    speed = 1.39,
    bezier = "almostLinear",
})
hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 1.94,
    bezier = "almostLinear",
    style = "fade",
})
hl.animation({
    leaf = "workspacesIn",
    enabled = true,
    speed = 1.21,
    bezier = "almostLinear",
    style = "fade",
})
hl.animation({
    leaf = "workspacesOut",
    enabled = true,
    speed = 1.94,
    bezier = "almostLinear",
    style = "fade",
})

require("input")

hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5,
})

require("keybindings")

require("windowrules")

hl.config({
    general = {
        gaps_in = 1,
        gaps_out = 5,
        border_size = 3,
        -- https://wiki.hyprland.org/Configuring/Vari`ables/#variable-types for info about colors
        col = {
	    active_border = colors.green,
            -- active_border = colors.green .. " " .. colors.aqua .. " " .. colors.purple .. " 0deg",
            inactive_border = "rgba(00000000)",
        },
        -- Set to true enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,
        -- Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        allow_tearing = false,
        layout = "master",
    },
    -- https://wiki.hyprland.org/Configuring/Variables/#decoration
    decoration = {
        rounding = 9,
        rounding_power = 2,
        dim_special = 0.8,
        -- Change transparency of focused and unfocused windows
        active_opacity = 1,
        inactive_opacity = 1,
        shadow = {
            enabled = false,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },
        -- https://wiki.hyprland.org/Configuring/Variables/#blur
        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
        },
    },
    -- https://wiki.hyprland.org/Configuring/Variables/#animations
    animations = {
        enabled = true,
        -- Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
    },
    -- Ref https://wiki.hyprland.org/Configuring/Workspace-Rules/
    -- "Smart gaps" / "No gaps when only"
    -- uncomment all if you wish to use that.
    -- workspace = w[tv1], gapsout:0, gapsin:0
    -- workspace = f[1], gapsout:0, gapsin:0
    -- windowrulev2 = bordersize 0, floating:0, onworkspace:w[tv1]
    -- windowrulev2 = rounding 0, floating:0, onworkspace:w[tv1]
    -- windowrulev2 = bordersize 0, floating:0, onworkspace:f[1]
    -- windowrulev2 = rounding 0, floating:0, onworkspace:f[1]
    -- See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
    dwindle = {
        -- pseudotile = true # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true, -- You probably want this
    },
    -- See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
    master = {
        new_status = "slave",
        mfact = 0.7,
    },
    -- https://wiki.hyprland.org/Configuring/Variables/#misc
    misc = {
        force_default_wallpaper = -1, -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo = true, -- If true disables the random hyprland logo / anime girl background. :(
        middle_click_paste = false,
    },
    cursor = {
        no_warps = true,
        warp_on_change_workspace = 2,
        warp_on_toggle_special = 2,
        inactive_timeout = 3,
    },
    --############
    --## INPUT ###
    --############
    -- https://wiki.hyprland.org/Configuring/Variables/#gestures
    -- gestures {
    --     workspace_swipe = false
    -- }
    -- Example per-device config
    -- See https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs for more
    --##################
    --## KEYBINDINGS ###
    --##################
    binds = {
        hide_special_on_workspace_change = true,
    },
    --#############################
    --## WINDOWS AND WORKSPACES ###
    --#############################
})

hl.on("hyprland.start", function()
    hl.exec_cmd("waybar & hyprpaper")
    hl.exec_cmd("Telegram")
    hl.exec_cmd("discord")
    -- hl.exec_cmd("slack")
    hl.exec_cmd("hyprsunset")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("hyprctl dispatch workspace 1")
    hl.exec_cmd("~/.config/hypr/scripts/clear-mfact.sh")
end)


