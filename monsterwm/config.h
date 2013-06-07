#ifndef CONFIG_H
#define CONFIG_H

/** modifiers **/
#define MOD1            Mod1Mask    /* ALT key */
#define MOD4            Mod4Mask    /* Super/Windows key */
#define MOD5            Mod5Mask    /* Alt Gr key */
#define CONTROL         ControlMask /* Control key */
#define SHIFT           ShiftMask   /* Shift key */

/** generic settings **/
#define MASTER_SIZE     0.5
#define SHOW_PANEL      True      /* show panel by default on exec */
#define TOP_PANEL       True      /* False means panel is on bottom */
#define PANEL_HEIGHT    14        /* 0 for no space for panel, thus no panel */
#define DEFAULT_MODE    TILE      /* initial layout/mode: TILE MONOCLE BSTACK GRID FLOAT */
#define ATTACH_ASIDE    True      /* False means new window is master */
#define FOLLOW_WINDOW   True      /* follow the window when moved to a different desktop */
#define FOLLOW_MOUSE    False     /* focus the window the mouse just entered */
#define CLICK_TO_FOCUS  True      /* focus an unfocused window when clicked  */
#define FOCUS_BUTTON    Button1   /* mouse button to be used along with CLICK_TO_FOCUS */
#define BORDER_WIDTH    5         /* window border width */
#define FOCUS           "#262935" /* focused window border color    */
#define UNFOCUS         "#202224" /* unfocused window border color  */
#define MINWSZ          50        /* minimum window size in pixels  */
#define DEFAULT_DESKTOP 0         /* the desktop to focus initially */
#define DESKTOPS        4         /* number of desktops - edit DESKTOPCHANGE keys to suit */

/**
 * layouts for each desktops
 */
static const int initlayouts[] = { TILE, BSTACK, FLOAT, MONOCLE, };

/**
 * open applications to specified desktop with specified mode.
 * if desktop is negative, then current is assumed
 */
static const AppRule rules[] = { \
    /*  class     desktop  follow  float */
    { "mpv",         3,    True,   False },
    { "mplayer2",    3,    True,   False },
    { "Gimp",        2,    False,  True  },
    { "dwb",         1,    True,   False },
    { "Skype",       2,    False,  True  },
    { "sxiv",        3,    False,  True  },
    { "zathura",     0,    False,  False },
    { "mcomix",      3,    False,  False },
};

/* helper for spawning shell commands */
#define SHCMD(cmd) {.com = (const char*[]){"/bin/sh", "-c", cmd, NULL}}

/**
 * custom commands
 * must always end with ', NULL };'
 */
static const char *termcmd[] = { "urxvtc", NULL };
static const char *menucmd[] = { "interrobang", NULL };
static const char *appmenu[] = { "gtkm", NULL };
static const char *browsercmd[] = { "dwb", NULL };
static const char *volup[] = { "dvol", "-i", "5", NULL };
static const char *voldown[] = { "dvol", "-d", "5", NULL };
static const char *volmute[] = { "dvol", "-t", NULL };
static const char *lolicmd[] = { "lolictrl", NULL };
static const char *mpdplay[] = { "mpc", "toggle", NULL };
static const char *mpdnext[] = { "mpc", "next", NULL };
static const char *mpdprev[] = { "mpc", "prev", NULL };
static const char *mpdstop[] = { "mpc", "stop", NULL };
static const char *mpdmenu[] = { "lolimpdnu", NULL };

#define DESKTOPCHANGE(K,N) \
    {  MOD4,             K,              change_desktop, {.i = N}}, \
    {  MOD4|ShiftMask,   K,              client_to_desktop, {.i = N}},

/**
 * keyboard shortcuts
 */
static Key keys[] = {
    /* modifier          key            function           argument */
    {  MOD4,             XK_Return,     spawn,             {.com = termcmd}},
    {  MOD4,             XK_p,          spawn,             {.com = menucmd}},
    {  MOD4,             XK_b,          spawn,             {.com = browsercmd}},
    {  MOD4,             XK_Prior,      spawn,             {.com = volup}},
    {  MOD4,             XK_Next,       spawn,             {.com = voldown}},
    {  MOD4,             XK_End,        spawn,             {.com = volmute}},
    {  MOD4,             XK_d,          spawn,             {.com = lolicmd}},
    {  MOD4,             XK_Down,       spawn,             {.com = mpdplay}},
    {  MOD4,             XK_Left,       spawn,             {.com = mpdprev}},
    {  MOD4,             XK_Right,      spawn,             {.com = mpdnext}},
    {  MOD4,             XK_Up,         spawn,             {.com = mpdstop}},
    {  MOD4,             XK_m,          spawn,             {.com = mpdmenu}},
    {  MOD4,             XK_F11,        togglepanel,       {NULL}},
    {  MOD4,             XK_BackSpace,  focusurgent,       {NULL}},
    {  MOD4,             XK_q,          killclient,        {NULL}},
    {  MOD4,             XK_j,          next_win,          {NULL}},
    {  MOD4,             XK_k,          prev_win,          {NULL}},
    {  MOD1,             XK_h,          resize_master,     {.i = -5}}, /* decrease size in px */
    {  MOD1,             XK_l,          resize_master,     {.i = +5}}, /* increase size in px */
    {  MOD1,             XK_k,          resize_stack,      {.i = -5}}, /* shrink   size in px */
    {  MOD1,             XK_j,          resize_stack,      {.i = +5}}, /* grow     size in px */
    {  MOD4|CONTROL,     XK_h,          rotate,            {.i = -1}},
    {  MOD4|CONTROL,     XK_l,          rotate,            {.i = +1}},
    {  MOD4|SHIFT,       XK_h,          rotate_filled,     {.i = -1}},
    {  MOD4|SHIFT,       XK_l,          rotate_filled,     {.i = +1}},
    {  MOD4,             XK_Tab,        last_desktop,      {NULL}},
    {  MOD4,             XK_Return,     swap_master,       {NULL}},
    {  MOD4|SHIFT,       XK_j,          move_down,         {NULL}},
    {  MOD4|SHIFT,       XK_k,          move_up,           {NULL}},
    {  MOD4|SHIFT,       XK_t,          switch_mode,       {.i = TILE}},
    {  MOD4|SHIFT,       XK_m,          switch_mode,       {.i = MONOCLE}},
    {  MOD4|SHIFT,       XK_b,          switch_mode,       {.i = BSTACK}},
    {  MOD4|SHIFT,       XK_g,          switch_mode,       {.i = GRID}},
    {  MOD4|SHIFT,       XK_f,          switch_mode,       {.i = FLOAT}},
    {  MOD1|SHIFT,       XK_r,          quit,              {.i = 0}}, /* quit with exit value 0 */
    {  MOD1|SHIFT,       XK_q,          quit,              {.i = 1}}, /* quit with exit value 1 */
    {  MOD5,             XK_j,          moveresize,        {.v = (int []){   0,  25,   0,   0 }}}, /* move down  */
    {  MOD5,             XK_k,          moveresize,        {.v = (int []){   0, -25,   0,   0 }}}, /* move up    */
    {  MOD5,             XK_l,          moveresize,        {.v = (int []){  25,   0,   0,   0 }}}, /* move right */
    {  MOD5,             XK_h,          moveresize,        {.v = (int []){ -25,   0,   0,   0 }}}, /* move left  */
    {  MOD1|SHIFT,       XK_j,          moveresize,        {.v = (int []){   0,   0,   0,  25 }}}, /* height grow   */
    {  MOD1|SHIFT,       XK_k,          moveresize,        {.v = (int []){   0,   0,   0, -25 }}}, /* height shrink */
    {  MOD1|SHIFT,       XK_l,          moveresize,        {.v = (int []){   0,   0,  25,   0 }}}, /* width grow    */
    {  MOD1|SHIFT,       XK_h,          moveresize,        {.v = (int []){   0,   0, -25,   0 }}}, /* width shrink  */
       DESKTOPCHANGE(    XK_1,                             0)
       DESKTOPCHANGE(    XK_2,                             1)
       DESKTOPCHANGE(    XK_3,                             2)
       DESKTOPCHANGE(    XK_4,                             3)
};

static Button buttons[] = {
    {  MOD1,             Button1,       mousemotion,       {.i = MOVE}},
    {  MOD1,             Button3,       mousemotion,       {.i = RESIZE}},
    {  CONTROL,          Button3,       spawn,             {.com = appmenu}},
};
#endif

/* vim: set ft=c et: */
