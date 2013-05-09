/* see LICENSE for copyright and license */

#ifndef CONFIG_H
#define CONFIG_H

/** modifiers **/
#define MOD1            Mod1Mask    /* ALT key */
#define MOD4            Mod4Mask    /* Super/Windows key */
#define MOD5            Mod5Mask    /* Altgr key */
#define CONTROL         ControlMask /* Control key */
#define SHIFT           ShiftMask   /* Shift key */

/** generic settings **/
#define MASTER_SIZE     0.52
#define SHOW_PANEL      True      /* show panel by default on exec */
#define TOP_PANEL       True      /* False means panel is on bottom */
#define PANEL_HEIGHT    14        /* 0 for no space for panel, thus no panel */
#define DEFAULT_MODE    TILE      /* initial layout/mode: TILE MONOCLE BSTACK GRID FLOAT */
#define ATTACH_ASIDE    True      /* False means new window is master */
#define FOLLOW_WINDOW   False     /* follow the window when moved to a different desktop */
#define FOLLOW_MOUSE    False     /* focus the window the mouse just entered */
#define CLICK_TO_FOCUS  True      /* focus an unfocused window when clicked  */
#define FOCUS_BUTTON    Button1   /* mouse button to be used along with CLICK_TO_FOCUS */
#define BORDER_WIDTH    4         /* window border width */
#define FOCUS           "#303031"
#define UNFOCUS         "#151516" /* unfocused window border color  */
#define MINWSZ          50        /* minimum window size in pixels  */
#define DEFAULT_DESKTOP 0         /* the desktop to focus initially */
#define DESKTOPS        4         /* number of desktops - edit DESKTOPCHANGE keys to suit */
#define USELESSGAP      4         /* the size of the useless gap in pixels */

/**
 * open applications to specified desktop with specified mode.
 * if desktop is negative, then current is assumed
 */
static const AppRule rules[] = { \
    /*  class     desktop  follow  float */
    { "MPlayer",      2,    True,   False },
    { "mplayer2",     2,    True,   False },
    { "VLC",          2,    True,   False },
    { "gbdfed",       2,    False,  True  },
    { "xfontsel",     2,    False,  True  },
    { "Gimp",         2,    False,  True  },
    { "nitrogen",     2,    False,  True  },
    { "lxappearance", 2,    False,  True  },
    { "Opera",        1,    True,   False },
    { "Firefox",      1,    True,   False },
    { "Skype",        2,    False,  True  },
    { "Pidgin",       2,    False,  True  },
    { "Luakit",       1,    True,   False },
    { "dwb",          1,    True,   False },
    { "Uzbl",         1,    True,   False },
    { "Deluge",       2,    False,  True  },
    { "Thunar",       2,    False,  True  },
    { "rox",          2,    False,  True  },
    { "medit",        0,    False,  True  },
    { "Zenity",      -1,    False,  True  },
};

/* helper for spawning shell commands */
#define SHCMD(cmd) {.com = (const char*[]){"/bin/sh", "-c", cmd, NULL}}

/**
 * custom commands
 * must always end with ', NULL };'
 */
static const char *termcmd[]     = { "termite", NULL };
static const char *menucmd[]     = { "dmenu_run", "-fn", "-*-cure-medium-*-*-*-11-*-*-*-*-*-*-*", "-nb", "#151515", "-nf", "#D7D7D7", "-sb", "#739896", "-sf", "#EFEFEF", NULL };
static const char *tmuxcmd[]     = { "termite", "-e", "tmux", NULL };
static const char *webcmd[]      = { "luakit", NULL };
static const char *vimcmd[]      = { "gvim", NULL };
static const char *zenitycolor[] = { "zenity", "--color-selection", NULL };
static const char *mpdstop[]     = { "mpc", "stop", NULL };
static const char *mpdtoggle[]   = { "mpc", "toggle", NULL };
static const char *mpdnext[]     = { "mpc", "next", NULL };
static const char *mpdprev[]     = { "mpc", "prev", NULL };
static const char *volup[]       = { "amixer", "-q", "sset", "PCM", "1%+", "unmute", NULL };
static const char *voldown[]     = { "amixer", "-q", "sset", "PCM", "1%-", "unmute", NULL };
static const char *volmute[]     = { "amixer", "-q", "sset", "Master", "toggle", NULL };
static const char *scrotcmd[]    = { "scrot", "/mnt/data/Scrots/%d-%m-%Y_%H:%M.png", NULL };
static const char *lockcmd[]     = { "i3lock", "-c", "141619", NULL };
static const char *reboot[]      = { "sudo", "systemctl", "reboot", NULL };
static const char *shutdown[]    = { "sudo", "systemctl", "poweroff", NULL };

#define DESKTOPCHANGE(K,N) \
    {  MOD4,             K,   change_desktop, {.i = N}}, \
    {  MOD4|ShiftMask,   K,   client_to_desktop, {.i = N}},

/**
 * keyboard shortcuts
 */
static Key keys[] = {
    /* modifier          key            function           argument */
    {  MOD4,             XK_Return,     spawn,             {.com = termcmd}},
    {  MOD4,             XK_p,          spawn,             {.com = menucmd}},
    {  MOD4,             XK_b,          spawn,             {.com = webcmd}},
    {  MOD4,             XK_g,          spawn,             {.com = vimcmd}},
    {  MOD4,             XK_z,          spawn,             {.com = zenitycolor}},
    {  MOD4,             XK_t,          spawn,             {.com = tmuxcmd}},
    {  0,                0x1008FF15,    spawn,             {.com = mpdstop}},
    {  0,                0x1008FF14,    spawn,             {.com = mpdtoggle}},
    {  0,                0x1008FF16,    spawn,             {.com = mpdprev}},
    {  0,                0x1008FF17,    spawn,             {.com = mpdnext}},
    {  0,                0x1008FF13,    spawn,             {.com = volup}},
    {  0,                0x1008FF11,    spawn,             {.com = voldown}},
    {  0,                0x1008FF12,    spawn,             {.com = volmute}},
    {  0,                XK_Print,      spawn,             {.com = scrotcmd}},
    {  MOD1|CONTROL,     XK_l,          spawn,             {.com = lockcmd}},
    {  MOD1|CONTROL,     XK_r,          spawn,             {.com = reboot}},
    {  MOD1|CONTROL,     XK_q,          spawn,             {.com = shutdown}},
    {  MOD4,             XK_F10,        togglepanel,       {NULL}},
    {  MOD4,             XK_BackSpace,  focusurgent,       {NULL}},
    {  MOD4,             XK_q,          killclient,        {NULL}},
    {  MOD4,             XK_j,          next_win,          {NULL}},
    {  MOD4,             XK_k,          prev_win,          {NULL}},
    {  MOD4,             XK_h,          resize_master,     {.i = -5}}, /* decrease size in px */
    {  MOD4,             XK_l,          resize_master,     {.i = +5}}, /* increase size in px */
    {  MOD4,             XK_o,          resize_stack,      {.i = -5}}, /* shrink   size in px */
    {  MOD4,             XK_p,          resize_stack,      {.i = +5}}, /* grow     size in px */
    {  MOD4,             XK_Tab,        last_desktop,      {NULL}},
    {  MOD4,             XK_m,          swap_master,       {NULL}},
    {  MOD4|SHIFT,       XK_j,          move_down,         {NULL}},
    {  MOD4|SHIFT,       XK_k,          move_up,           {NULL}},
    {  MOD4|SHIFT,       XK_t,          switch_mode,       {.i = TILE}},
    {  MOD4|SHIFT,       XK_m,          switch_mode,       {.i = MONOCLE}},
    {  MOD4|SHIFT,       XK_b,          switch_mode,       {.i = BSTACK}},
    {  MOD4|SHIFT,       XK_g,          switch_mode,       {.i = GRID}},
    {  MOD4|SHIFT,       XK_f,          switch_mode,       {.i = FLOAT}},
    {  MOD4|SHIFT,       XK_r,          quit,              {.i = 0}}, /* quit with exit value 0 */
    {  MOD4|SHIFT,       XK_q,          quit,              {.i = 1}}, /* quit with exit value 1 */
    {  MOD1,             XK_j,          moveresize,        {.v = (int []){   0,  15,   0,   0 }}}, /* move down  */
    {  MOD1,             XK_k,          moveresize,        {.v = (int []){   0, -15,   0,   0 }}}, /* move up    */
    {  MOD1,             XK_l,          moveresize,        {.v = (int []){  15,   0,   0,   0 }}}, /* move right */
    {  MOD1,             XK_h,          moveresize,        {.v = (int []){ -15,   0,   0,   0 }}}, /* move left  */
    {  MOD1|SHIFT,       XK_j,          moveresize,        {.v = (int []){   0,   0,   0,  15 }}}, /* height grow   */
    {  MOD1|SHIFT,       XK_k,          moveresize,        {.v = (int []){   0,   0,   0, -15 }}}, /* height shrink */
    {  MOD1|SHIFT,       XK_l,          moveresize,        {.v = (int []){   0,   0,  15,   0 }}}, /* width grow    */
    {  MOD1|SHIFT,       XK_h,          moveresize,        {.v = (int []){   0,   0, -15,   0 }}}, /* width shrink  */
       DESKTOPCHANGE(    XK_1,                             0)
       DESKTOPCHANGE(    XK_2,                             1)
       DESKTOPCHANGE(    XK_3,                             2)
};

/**
 * mouse shortcuts
 */
static Button buttons[] = {
    {  MOD1,    Button1,     mousemotion,   {.i = MOVE}},
    {  MOD1,    Button3,     mousemotion,   {.i = RESIZE}},
};
#endif

/* vim: set et ts=4 sts=4 sw=4: */
