------------------
---- MONITORS ----
------------------

hl.monitor({
    output   = "DP-1",
    mode     = "1600x900@60",
    position = "0x0",
    scale    = "1",
})

hl.monitor({
    output   = "DP-3",
    mode     = "1920x1080@165",
    position = "1600x0",
    scale    = "1",
})

---------------------
---- MY PROGRAMS ----
---------------------

local terminal    = "ghostty"
local fileManager = "dolphin"
local menu = "rofi -show drun"
local runmenu = "rofi -show run"

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function () 
  hl.exec_cmd("waybar & awww-daemon")
  hl.exec_cmd("awww img ~/.local/share/wallpapers/gruvbox-arch.png")
  hl.exec_cmd("hyprctl setcursor Bibata-Modern-Classic 24")
  hl.exec_cmd("hyprshade on blue-light-filter")
  hl.exec_cmd("hyprctl dispatch workspace 1")
end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("QT_QPA_PLATFORMTHEME","qt6ct")

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    general = {
        gaps_in  = 0,
        gaps_out = 0,

        border_size = 2,

        col = {
            active_border   = "rgba(fabd2fff)",
            inactive_border = "rgba(504945ff)",
        },

        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
    },

    decoration = {
        rounding       = 0,

        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = false,
        },

        blur = {
            enabled   = false,
        },
    },

    animations = {
        enabled = true,
    },
})

hl.curve("decel",       { type = "bezier", points = { {0.05, 0.7},  {0.01, 1}    } })
hl.curve("easeOutExpo", { type = "bezier", points = { {0.16, 1},    {0.3, 1}     } })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 10, bezier = "default" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 3, bezier = "decel" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 2.5, bezier = "decel" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 2, bezier = "easeOutExpo", style = "fade" })


hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },
})

----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper = 1,
        disable_hyprland_logo   = true,
    },
})


---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "us",
        kb_options = "",

        follow_mouse = 1,
        sensitivity = -0.5,
        accel_profile = "flat",
    },
    cursor = {
        default_monitor = "DP-3"
    }
})

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"

hl.bind(mainMod .. " + W", hl.dsp.window.close())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))    -- dwindle only
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("hyprshade toggle blue-light-filter"))

hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(runmenu))

hl.bind(mainMod .. " + A", hl.dsp.exec_cmd("atlauncher"))
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("zen-browser -p Qyoh"))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("zen-browser -p Zayden"))
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd("ghostty -e bluetuith"))
hl.bind(mainMod .. " + I", hl.dsp.exec_cmd("ghostty -e nmtui"))

hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("grim -g '$(slurp)'"))

hl.bind(mainMod .. " + SHIFT + G", hl.dsp.exec_cmd("bash ~/.config/waybar/launch.sh"))

hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

for i = 11, 20 do
    local fkey = i - 10 -- 11->1, 20->10
    hl.bind(mainMod .. " + F" .. fkey,
        hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + F" .. fkey,
        hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- drag and resize
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("playerctl play-pause"),                           { locked = true, repeating = true })


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------
for i = 1, 10 do
    hl.workspace_rule({
        workspace = tostring(i),
        monitor = "DP-3",
        default = (i == 1),
    })
end

for i = 11, 20 do
    hl.workspace_rule({
        workspace = tostring(i),
        monitor = "DP-1",
        default = (i == 11),
    })
end

hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

hl.window_rule({
    name  = "no-border-when-one-window",
    match = { workspace = "w[t1]" },
    border_size = 0,
})
