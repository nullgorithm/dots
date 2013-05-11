--------------------------
-- Default luakit theme --
--------------------------

local theme = {}

-- Default settings
theme.font = "Alterebro Pixel Font 12"
theme.fg   = "#909090"
theme.bg   = "#151515"

-- Genaral colours
theme.success_fg = "#4A5D74"
theme.loaded_fg  = "#BB883A"
theme.error_fg = "#afafaf"
theme.error_bg = "#7D3022"

-- Warning colours
theme.warning_fg = "#F00"
theme.warning_bg = "#FFF"

-- Notification colours
theme.notif_fg = "#444"
theme.notif_bg = "#FFF"

-- Menu colours
theme.menu_fg                   = "#525252"
theme.menu_bg                   = "#dddfea"
theme.menu_selected_fg          = "#efefef"
theme.menu_selected_bg          = "#386FC5"
theme.menu_title_bg             = "#151515"
theme.menu_primary_title_fg     = "#adafbd"
theme.menu_secondary_title_fg   = "#808080"

-- Proxy manager
theme.proxy_active_menu_fg      = '#000'
theme.proxy_active_menu_bg      = '#FFF'
theme.proxy_inactive_menu_fg    = '#888'
theme.proxy_inactive_menu_bg    = '#FFF'

-- Statusbar specific
theme.sbar_fg         = "#909598"
theme.sbar_bg         = "#151515"

-- Downloadbar specific
theme.dbar_fg         = "#909090"
theme.dbar_bg         = "#151515"
theme.dbar_error_fg   = "#A43B27"

-- Input bar specific
theme.ibar_fg           = "#181818"
theme.ibar_bg           = "#dddfea"

-- Tab label
theme.tab_fg            = "#a0a0a0"
theme.tab_bg            = "#181818"
theme.tab_ntheme        = "#ddd"
theme.selected_fg       = "#efefef"
theme.selected_bg       = "#303030"
theme.selected_ntheme   = "#ddd"
theme.loading_fg        = "#33AADD"
theme.loading_bg        = "#000"

-- Trusted/untrusted ssl colours
theme.trust_fg          = "#8C9A4A"
theme.notrust_fg        = "#A43B27"

return theme
-- vim: et:sw=4:ts=8:sts=4:tw=80
