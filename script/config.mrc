; #= P&P.temp -rs
; @======================================:
; |  Peace and Protection                |
; |  Configuration dialogs               |
; `======================================'

; Main configuration dialog
dialog pnp.config {
  title "PnP Options"
  icon script\pnp.ico
  option dbu
  size -1 -1 250 175

  ; List of sections
  list 901, 5 5 58 164, size

  ; Whether a section has been loaded yet
  list 902, 1 1 1 1, hide

  ; Last section selected
  edit "", 903, 1 1 1 1, autohs hide

  button "OK", 905, 106 156 30 12, default group
  button "Cancel", 906, 141 156 30 12, cancel
  button "&Help", 907, 176 156 30 12, disable

  ; Blank tab
  tab "", 1, -25 -25 1 1, disable hide

  ; Hidden tabs to select areas
  tab "", 2, -25 -25 1 1, disable hide
  tab "", 3, -25 -25 1 1, disable hide
  tab "", 4, -25 -25 1 1, disable hide
  tab "", 7, -25 -25 1 1, disable hide
  tab "", 8, -25 -25 1 1, disable hide
  tab "", 9, -25 -25 1 1, disable hide
  tab "", 10, -25 -25 1 1, disable hide
  tab "", 11, -25 -25 1 1, disable hide
  tab "", 12, -25 -25 1 1, disable hide
  tab "", 13, -25 -25 1 1, disable hide
  tab "", 14, -25 -25 1 1, disable hide
  tab "", 17, -25 -25 1 1, disable hide
  tab "", 18, -25 -25 1 1, disable hide
  tab "", 19, -25 -25 1 1, disable hide
  tab "", 20, -25 -25 1 1, disable hide
  tab "", 21, -25 -25 1 1, disable hide
  tab "", 22, -25 -25 1 1, disable hide
  tab "", 24, -25 -25 1 1, disable hide
  tab "", 25, -25 -25 1 1, disable hide
  tab "", 26, -25 -25 1 1, disable hide
  tab "", 27, -25 -25 1 1, disable hide
  tab "", 28, -25 -25 1 1, disable hide
  tab "", 29, -25 -25 1 1, disable hide
  tab "", 30, -25 -25 1 1, disable hide
  tab "", 31, -25 -25 1 1, disable hide
  tab "", 32, -25 -25 1 1, disable hide
  tab "", 33, -25 -25 1 1, disable hide

  ; Away - Pager/Log [70-99]
  box "Pager", 70, 125 10 45 50, tab 2
  box "Away logging", 71, 175 10 65 50, tab 2
  text "&When away:", 72, 70 22 50 8, right tab 2
  combo 75, 130 20 35 50, drop tab 2
  text "&When auto-away:", 73, 70 34 50 8, right tab 2
  combo 76, 130 32 35 50, drop tab 2
  text "&When here :", 74, 70 46 50 8, right tab 2
  combo 77, 130 44 35 50, drop tab 2
  check "&On (away)", 78, 180 22 55 8, tab 2
  check "&On (auto-away)", 79, 180 34 55 8, tab 2
  box "What to log:", 80, 70 66 170 38, tab 2
  check "&Log private messages and", 81, 75 77 72 8, tab 2
  combo 82, 150 75 85 50, drop tab 2
  check "&Log channel events:", 83, 75 90 72 8, tab 2
  combo 84, 150 88 85 50, drop tab 2
  check "&Use 'classic' pager window", 85, 75 111 170 8, tab 2
  check "&Clear away log on away", 86, 75 120 170 8, tab 2
  check "&Close any open queries on away", 87, 75 129 170 8, tab 2
  check "&Save permanent copy of away log to logs directory", 88, 75 138 170 8, tab 2

  ; Away - Message [100-129]
  box "When you set away:", 100, 70 3 170 68, tab 3
  radio "&Send an action", 101, 75 12 60 8, group tab 3
  radio "&Send a message", 102, 75 21 60 8, tab 3
  text "to all", 103, 138 17 27 8, tab 3
  check "&channels", 104, 178 12 60 8, tab 3
  check "&chats/queries", 105, 178 21 60 8, tab 3
  check "&Ignore these channels:", 106, 75 35 71 8, tab 3
  edit "", 107, 146 34 87 11, autohs tab 3
  check "&Ignore channels where you are idle", 108, 75 46 100 8, tab 3
  text "minutes", 109, 192 47 45 8, tab 3
  edit "", 110, 175 45 15 11, autohs tab 3
  check "&Repeat this every", 111, 75 57 71 8, tab 3
  text "minutes", 112, 163 58 65 8, tab 3
  edit "", 113, 146 56 15 11, autohs tab 3
  box "Remind people that you're away if they:", 114, 70 76 170 75, tab 3
  check "&Send you a private message", 115, 75 85 160 8, tab 3
  check "&Trigger your mIRC highlight settings in a channel", 116, 75 94 160 8, tab 3
  check "&Use any of these words in a channel: (separate with commas)", 117, 75 103 160 8, tab 3
  edit "", 118, 84 113 122 11, autohs tab 3
  check "&Only remind if triggered in these channels:", 119, 75 126 160 8, tab 3
  edit "", 120, 84 136 122 11, autohs tab 3

  ; Away - Other [130-149]
  box "Auto-away", 130, 70 15 170 50, tab 4
  check "&Automatically set away after", 131, 75 25 77 8, tab 4
  text "minutes idle", 132, 172 26 70 8, tab 4
  edit "", 133, 153 24 15 11, autohs tab 4
  check "&Warn you before setting auto-away", 134, 75 38 160 8, tab 4
  check "&Perform auto-away quietly (don't message channels, etc.)", 135, 75 51 160 8, tab 4
  check "&Change nick on away to:", 136, 75 75 69 8, tab 4
  edit "", 137, 146 74 50 11, autohs tab 4
  text "", 138, 84 86 90 8, tab 4
  check "&Set away on all connections (by default)", 143, 75 99 160 8, tab 4
  check "&Disable sounds when away", 139, 75 108 160 8, tab 4
  check "&Disable event beeps when away", 140, 75 117 160 8, tab 4
  check "&Deop yourself in any channels when away", 141, 75 126 160 8, tab 4
  check "&Enable dedicated query window when away", 142, 75 135 160 8, tab 4

  ; Display - Nick colors [150-159]
  check "&Color nicknames in nicklist", 150, 75 25 170 8, tab 7
  check "&Color nicknames in channel text", 151, 75 38 170 8, tab 7
  text "&Use lagged nick color if lagged", 152, 84 52 77 8, tab 7
  edit "", 153, 162 50 15 11, autohs tab 7
  text "seconds", 154, 180 52 70 8, tab 7
  text "Nick colors are set in theme configuration.", 155, 84 75 160 8, tab 7
  button "&Edit Theme", 156, 84 87 50 12, tab 7

  ; Display - Notify [160-189]
  box "Notify format", 160, 125 37 55 80, tab 8
  box "Unnotify format", 161, 185 37 55 80, tab 8
  text "&Address matches:", 162, 65 49 57 8, right tab 8
  combo 165, 130 47 45 50, drop tab 8
  combo 169, 190 70 45 50, drop tab 8
  check "&Beep and flash", 172, 130 59 45 8, tab 8
  text "&Address fails:", 163, 65 72 57 8, right tab 8
  combo 166, 130 70 45 50, drop tab 8
  combo 168, 190 47 45 50, drop tab 8
  check "&Beep and flash", 173, 130 82 45 8, tab 8
  text "&No address check:", 164, 65 95 57 8, right tab 8
  combo 167, 130 93 45 50, drop tab 8
  combo 170, 190 93 45 50, drop tab 8
  check "&Beep and flash", 174, 130 105 45 8, tab 8
  text "When a user on your notify list comes online, PnP can check their address against a mask. (see /notif) PnP can show the notify differetly based on the results of this address check. 'Unnotify' is shown when a notify user leaves IRC.", 171, 70 5 170 32, tab 8
  text "&Show notifies to:", 175, 65 123 57 8, right tab 8
  combo 176, 130 121 80 50, drop tab 8
  check "&Show unnotify in quit color", 177, 130 133 115 8, tab 8
  check "&Show function keys with notify", 178, 130 142 115 8, tab 8

  ; Display - Ping [190-209]
  text "&Show channel pings to:", 190, 70 35 72 8, right tab 9
  combo 191, 145 33 80 50, drop tab 9
  text "&Show single pings to:", 192, 70 48 72 8, right tab 9
  combo 193, 145 46 80 50, drop tab 9
  box "Options:", 194, 70 75 170 54, tab 9
  check "&Minimize @Ping window when opened", 195, 75 85 160 8, tab 9
  check "&Bring @Ping window to front on new replies", 196, 75 95 160 8, tab 9
  check "&Retain replies for later viewing", 197, 75 105 160 8, tab 9
  check "&Show numeric codes when others ping you", 198, 75 115 160 8, tab 9

  ; Display - Server notices [210-229]
  text "Select shown notices and press 'Hide' to hide them, or select hidden notices and press 'Show' to show them again.", 210, 70 5 170 24, tab 10
  check "&Enable PnP server notice filtering: (when usermode +s on)", 213, 74 26 210 8, tab 10
  box "&Shown server notices:", 214, 70 37 170 56, tab 10
  list 216, 75 45 160 35, extsel sort tab 10
  list 217, 1 1 1 1, hide
  button "&Hide", 220, 205 77 30 11, tab 10
  box "&Hidden server notices:", 215, 70 96 170 56, tab 10
  list 218, 75 104 160 35, extsel sort tab 10
  list 219, 1 1 1 1, hide
  button "&Show", 221, 205 136 30 11, tab 10
  text "&Show to:", 222, 73 79 36 8, right tab 10
  combo 223, 110 77 90 50, drop tab 10

  ; Display - Text [230-249]
  check "&Copy private messages to active window", 231, 72 15 173 8, tab 11
  check "&Use PnP text theming", 230, 72 25 173 8, tab 11
  button "&Edit Theme", 244, 81 37 50 12, tab 11
  box "Notices:", 232, 74 57 80 40, tab 11
  radio "&Normal", 233, 84 67 65 8, group tab 11
  radio "&Notices window", 234, 84 76 65 8, tab 11
  radio "&Status window", 235, 84 85 65 8, tab 11
  box "Op Notices:", 236, 159 57 80 40, tab 11
  radio "&Normal", 237, 169 67 65 8, group tab 11
  radio "&Notices window", 238, 169 76 65 8, tab 11
  radio "&Events window", 239, 169 85 65 8, tab 11
  box "Services Notices:", 240, 74 102 80 40, tab 11
  radio "&Normal", 241, 84 112 65 8, group tab 11
  radio "&Notices window", 242, 84 121 65 8, tab 11
  radio "&Status window", 243, 84 130 65 8, tab 11

  ; Display - Wallops [250-269]
  text "Select shown wallops and press 'Hide' to hide them, or select hidden wallops and press 'Show' to show them again.", 250, 70 5 170 24, tab 12
  check "&Enable PnP wallop filtering: (when usermode +w on)", 253, 74 26 210 8, tab 12
  box "&Shown wallops:", 254, 70 37 170 56, tab 12
  list 256, 75 45 160 35, extsel sort tab 12
  list 257, 1 1 1 1, hide
  button "&Hide", 260, 205 77 30 11, tab 12
  box "&Hidden wallops:", 255, 70 96 170 56, tab 12
  list 258, 75 104 160 35, extsel sort tab 12
  list 259, 1 1 1 1, hide
  button "&Show", 261, 205 136 30 11, tab 12
  text "&Show to:", 262, 73 79 36 8, right tab 12
  combo 263, 110 77 90 50, drop tab 12

  ; Display - Whois replies [270-289]
  text "&Show whois replies to:", 270, 70 13 72 8, right tab 13
  combo 271, 145 11 80 50, drop tab 13
  box "Options:", 272, 70 25 170 78, tab 13
  check "&Show in query/chat if open", 273, 75 35 160 8, tab 13
  check "&Minimize @Whois window when opened", 274, 75 45 160 8, tab 13
  check "&Bring @Whois window to front on new replies", 275, 75 55 160 8, tab 13
  check "&Retain replies for later viewing", 276, 75 65 160 8, tab 13
  check "&Show extended server information", 277, 75 78 160 8, tab 13
  check "&Show shared channels in bold", 278, 75 88 160 8, tab 13
  box "Show nickname:", 279, 70 106 170 45, tab 13
  radio "&on all lines", 280, 75 116 160 8, group tab 13
  radio "&on first line only", 281, 75 126 160 8, tab 13
  radio "&on first line, but line up remaining lines", 282, 75 136 160 8, tab 13

  ; Display - Other [290-309]
  text "&Names list when joining:", 290, 70 23 72 8, right tab 14
  combo 291, 145 21 80 50, drop tab 14
  text "&Show MOTD on connect:", 292, 70 36 72 8, right tab 14
  combo 293, 145 34 80 50, drop tab 14
  text "&Time display format:", 294, 70 53 72 8, right tab 14
  combo 295, 145 51 80 50, drop edit tab 14
  text "&Date display format:", 296, 70 66 72 8, right tab 14
  combo 297, 145 64 80 50, drop edit tab 14
  box "Options:", 301, 70 85 170 54, tab 14
  check "&Show CTCPs, DNS, and away status to active window", 298, 75 95 160 8, tab 14
  check "&Show events/raws to active if channel/query not open", 302, 75 105 160 8, tab 14
  check "&Display MOTD to @MOTD window", 299, 75 115 160 8, tab 14
  check "&Show PnP splash screen during startup", 300, 75 125 160 8, tab 14

  ; Popups - Channel [310-329]
  box "Show these popups:", 329, 80 15 150 74, tab 17
  check "&Topic", 310, 85 25 70 10, tab 17
  check "&Modes", 311, 85 35 70 10, tab 17
  check "&Settings", 312, 85 45 70 10, tab 17
  check "&Banlist", 313, 85 55 70 10, tab 17
  check "&Bans", 314, 85 65 70 10, tab 17
  check "&Ping", 315, 85 75 70 10, tab 17
  check "&Scan", 316, 155 25 70 10, tab 17
  check "&Favorites", 317, 155 35 70 10, tab 17
  check "&Part", 318, 155 45 70 10, tab 17
  check "&Window", 319, 155 55 70 10, tab 17
  check "&Help", 320, 155 65 70 10, disable tab 17
  check "&Hide op popups if not opped", 321, 85 95 160 10, tab 17
  button "&Load default", 326, 85 112 60 12, tab 17
  button "&Load condensed", 327, 155 112 60 12, tab 17
  text "Tip: You can hold Ctrl when right-clicking to show hidden popups.", 328, 85 132 140 24, tab 17

  ; Popups - Menubar [330-349]
  box "Show these popups:", 349, 80 15 150 74, tab 18
  check "&Configure", 330, 85 25 70 10, tab 18
  check "&Last whois", 331, 85 35 70 10, tab 18
  check "&Lists", 332, 85 45 70 10, tab 18
  check "&Away", 333, 85 55 70 10, tab 18
  check "&Nickname", 334, 85 65 70 10, tab 18
  check "&List channels", 335, 155 25 70 10, tab 18
  check "&Channels", 336, 155 35 70 10, tab 18
  check "&Favorites", 337, 155 45 70 10, tab 18
  check "&Addons", 338, 155 55 70 10, tab 18
  check "&Help", 339, 155 65 70 10, disable tab 18
  button "&Load default", 346, 85 112 60 12, tab 18
  button "&Load condensed", 347, 155 112 60 12, tab 18
  text "Tip: You can hold Ctrl when right-clicking to show hidden popups.", 348, 85 132 140 24, tab 18

  ; Popups - Nicklist [350-369]
  box "Show these popups:", 369, 80 15 150 74, tab 19
  check "&Quick kick", 350, 85 25 70 10, tab 19
  check "&Quick ban", 351, 85 35 70 10, tab 19
  check "&Kick", 352, 85 45 70 10, tab 19
  check "&Bans", 353, 85 55 70 10, tab 19
  check "&Op / Halfop / Voice", 354, 85 65 70 10, tab 19
  check "&User info", 355, 85 75 70 10, tab 19
  check "&CTCP", 356, 155 25 70 10, tab 19
  check "&DCC", 357, 155 35 70 10, tab 19
  check "&Query", 358, 155 45 70 10, tab 19
  check "&Lists", 359, 155 55 70 10, tab 19
  check "&Notices", 360, 155 65 70 10, tab 19
  check "&Help", 361, 155 75 70 10, disable tab 19
  check "&Hide op popups if not opped", 362, 85 95 160 10, tab 19
  button "&Load default", 366, 85 112 60 12, tab 19
  button "&Load condensed", 367, 155 112 60 12, tab 19
  text "Tip: You can hold Ctrl when right-clicking to show hidden popups.", 368, 85 132 140 24, tab 19

  ; Popups - Query [370-389]
  box "Show these popups:", 389, 80 15 150 74, tab 20
  check "&Whois", 370, 85 25 70 10, tab 20
  check "&User info", 371, 85 35 70 10, tab 20
  check "&Ping", 372, 85 45 70 10, tab 20
  check "&CTCP", 373, 85 55 70 10, tab 20
  check "&DCC", 374, 85 65 70 10, tab 20
  check "&Ignore", 375, 85 75 70 10, tab 20
  check "&Userlist", 376, 155 25 70 10, tab 20
  check "&Notify", 377, 155 35 70 10, tab 20
  check "&Window", 378, 155 45 70 10, tab 20
  check "&Close", 379, 155 55 70 10, tab 20
  check "&Help", 380, 155 65 70 10, disable tab 20
  button "&Load default", 386, 85 112 60 12, tab 20
  button "&Load condensed", 387, 155 112 60 12, tab 20
  text "Tip: You can hold Ctrl when right-clicking to show hidden popups.", 388, 85 132 140 24, tab 20

  ; Popups - Status [390-409]
  box "Show these popups:", 409, 80 15 150 74, tab 21
  check "&List channels", 390, 85 25 70 10, tab 21
  check "&Channels", 391, 85 35 70 10, tab 21
  check "&Favorites", 392, 85 45 70 10, tab 21
  check "&Nickname", 393, 85 55 70 10, tab 21
  check "&Usermode", 394, 85 65 70 10, tab 21
  check "&Quit", 395, 85 75 70 10, tab 21
  check "&Server", 396, 155 25 70 10, tab 21
  check "&Stats", 397, 155 35 70 10, tab 21
  check "&Connect", 398, 155 45 70 10, tab 21
  check "&Window", 399, 155 55 70 10, tab 21
  check "&Help", 400, 155 65 70 10, disable tab 21
  button "&Load default", 406, 85 112 60 12, tab 21
  button "&Load condensed", 407, 155 112 60 12, tab 21
  text "Tip: You can hold Ctrl when right-clicking to show hidden popups.", 408, 85 132 140 24, tab 21

  ; Popups - @Windows [410-429]
  box "Show these popups:", 429, 80 15 150 74, tab 22
  check "&Select all", 410, 85 25 70 10, tab 22
  check "&Copy", 411, 85 35 70 10, tab 22
  check "&Window", 412, 85 45 70 10, tab 22
  check "&Close", 413, 85 55 70 10, tab 22
  check "&Hide", 414, 85 65 70 10, tab 22
  check "&Help", 415, 85 75 70 10, disable tab 22
  button "&Load default", 426, 85 112 60 12, tab 22
  button "&Load condensed", 427, 155 112 60 12, tab 22
  text "Tip: You can hold Ctrl when right-clicking to show hidden popups.", 428, 85 132 140 24, tab 22

  ; Channel options [430-459]
  text "&Channel:", 452, 65 8 36 8, right tab 24
  combo 453, 102 6 70 50, sort drop tab 24
  list 454, 1 1 1 1, hide
  edit "", 457, 1 1 1 1, hide autohs
  button "&Add...", 455, 176 5 30 12, tab 24
  button "&Remove", 456, 210 5 30 12, tab 24
  box "&Default tempban:", 430, 70 23 170 25, tab 24
  edit "", 431, 75 32 20 11, autohs tab 24
  text "&seconds, ban type:", 432, 97 34 50 8, tab 24
  combo 433, 147 32 88 70, drop tab 24
  box "&Default banmask:", 434, 70 51 170 25, tab 24
  combo 435, 75 60 38 50, drop tab 24
  text "@", 436, 115 62 7 8, tab 24
  combo 437, 124 60 111 60, drop tab 24
  check "&Check your op status before performing op commands", 442, 70 80 175 8, tab 24
  check "&Display note when users trigger channel protection", 443, 70 89 175 8, tab 24
  check "&Show clones on join", 444, 70 98 85 8, tab 24
  check "&Add delay between kicks", 445, 155 98 90 8, tab 24
  check "&IRCop check on join", 446, 70 107 85 8, tab 24
  check "&Show users banned", 447, 155 107 85 8, tab 24
  check "&Whois users on join...", 448, 70 121 85 8, tab 24
  check "...&but only if you're opped", 449, 155 121 90 8, tab 24
  check "...&only if you're not away", 450, 155 130 90 8, tab 24
  check "...&show results in channel", 451, 155 139 90 8, tab 24
  check "&Rejoin if alone and not op", 458, 70 139 85 8, tab 24

  ; DCC accept [40-69]
  text "These options determine how PnP handles DCCs. They override mIRC's DCC settings. Selecting 'Warn' will reject a DCC and send a notice reminding the user you are not accepting DCCs.", 40, 70 12 170 30, tab 25
  box "DCC chat", 41, 130 45 55 100, tab 25
  box "DCC send (file)", 42, 190 45 55 100, tab 25
  text "When here:", 43, 70 55 60 8, tab 25
  text "&Known user:", 44, 75 67 55 8, tab 25
  combo 50, 135 65 45 50, group drop tab 25
  combo 51, 195 65 45 50, drop tab 25
  text "&Unknown user:", 45, 75 79 55 8, tab 25
  combo 52, 135 77 45 50, drop tab 25
  combo 53, 195 77 45 50, drop tab 25
  text "When away:", 46, 70 91 60 8, tab 25
  text "&Known user:", 47, 75 103 55 8, tab 25
  combo 54, 135 101 45 50, drop tab 25
  combo 55, 195 101 45 50, drop tab 25
  text "&Unknown user:", 48, 75 115 55 8, tab 25
  combo 56, 135 113 45 50, drop tab 25
  combo 57, 195 113 45 50, drop tab 25
  text "&User with DCC auth:", 49, 75 127 55 8, tab 25
  combo 58, 135 125 45 50, drop tab 25
  combo 59, 195 125 45 50, drop tab 25

  ; Favorites [460-489,510-519]
  text "&Select/add a favorite network...", 460, 70 5 85 8, tab 26
  combo 470, 70 15 60 48, size edit tab 26
  button "&Add", 471, 135 15 20 12, tab 26
  button "&Del", 472, 135 30 20 12, tab 26
  text "...enter preferred info...", 461, 160 5 85 8, tab 26
  text "&Nick:", 462, 158 17 23 8, right tab 26
  edit "", 463, 182 15 63 11, autohs tab 26
  text "&Alt:", 464, 158 29 23 8, right tab 26
  edit "", 465, 182 27 63 11, autohs tab 26
  text "&E-Mail:", 466, 158 41 23 8, right tab 26
  edit "", 467, 182 39 63 11, autohs tab 26
  text "&Name:", 468, 158 53 23 8, right tab 26
  edit "", 469, 182 51 63 11, autohs tab 26
  list 487, 1 1 1 1, hide
  list 488, 1 1 1 1, hide
  list 489, 1 1 1 1, hide
  edit "", 512, 1 1 1 1, autohs hide
  text "&Add favorite channels:", 473, 70 75 85 8, tab 26
  combo 475, 70 85 60 48, size edit tab 26
  button "&Add", 476, 135 85 20 10, tab 26
  button "&Del", 477, 135 97 20 10, tab 26
  button "&Up", 478, 135 109 20 10, tab 26
  button "&Down", 479, 135 121 20 10, tab 26
  text "&Add favorite servers:", 474, 160 75 85 8, tab 26
  combo 480, 160 85 60 48, size edit tab 26
  button "&Add", 481, 225 85 20 10, tab 26
  button "&Del", 482, 225 97 20 10, tab 26
  button "&Up", 483, 225 109 20 10, tab 26
  button "&Down", 484, 225 121 20 10, tab 26
  check "&Join on connect", 485, 70 135 63 8, tab 26
  edit "", 510, 135 134 20 11, autohs tab 26
  check "&Connect on startup", 486, 160 135 85 8, tab 26

  ; Flashing [490-509]
  text "If mIRC is not the current application, it's taskbar button will flash on the following events, if selected.", 507, 70 12 170 30, tab 27
  box "When here:", 490, 125 35 55 50, tab 27
  box "When away:", 491, 185 35 55 50, tab 27
  text "New query window:", 492, 70 47 50 8, right tab 27
  text "Private message:", 493, 70 59 50 8, right tab 27
  text "DCC chat message:", 494, 70 71 50 8, right tab 27
  check "&Flash if here", 495, 130 47 45 8, tab 27
  check "&Flash if here", 497, 130 59 45 8, tab 27
  check "&Flash if here", 499, 130 71 45 8, tab 27
  check "&Flash if away", 496, 190 47 45 8, tab 27
  check "&Flash if away", 498, 190 59 45 8, tab 27
  check "&Flash if away", 500, 190 71 45 8, tab 27
  check "&Limit flashing to", 501, 70 95 48 8, tab 27
  edit "", 502, 120 94 20 11, autohs tab 27
  text "seconds (when here)", 503, 144 96 101 8, tab 27
  check "&Limit flashing to", 504, 70 107 48 8, tab 27
  edit "", 505, 120 106 20 11, autohs tab 27
  text "seconds (when away)", 506, 144 108 101 8, tab 27

  ; Language [520-539]
  text "Current language:", 520, 70 9 63 8, right tab 28
  edit "", 521, 135 7 70 11, autohs read tab 28
  text "Language selected:", 522, 70 21 63 8, right tab 28
  edit "", 523, 135 19 70 11, autohs read tab 28
  edit "", 529, 1 1 1 1, hide
  check "&Convert all popups to lowercase", 527, 135 31 110 8, tab 28
  check "&Convert ALL text to lowercase", 528, 135 40 110 8, tab 28
  text "To change PnP's language, select a language from the list below and click 'Select'. PnP will change to the new language when you close this options dialog. Please be patient, as loading a new language or changing the above options is time-consuming.", 524, 70 56 170 41, tab 28
  list 525, 70 97 135 50, sort tab 28
  button "&Select", 526, 210 97 30 12, tab 28

  ; Messages [540-559]
  text "&Editing", 541, 70 8 20 8, tab 29
  combo 542, 93 6 50 85, drop sort tab 29
  text "messages:", 543, 146 8 44 8, tab 29
  check "(alt. list format)", 555, 190 8 50 8, tab 29
  list 544, 70 19 170 49, size sort tab 29
  list 552, 1 1 1 1, hide
  list 553, 1 1 1 1, hide
  edit "", 556, 1 1 1 1, autohs hide
  edit "", 557, 1 1 1 1, autohs hide
  text "", 554, 70 72 170 8, tab 29
  text "&Enter a message or select a default from the dropdown:", 545, 70 82 170 8, tab 29
  combo 546, 70 92 170 85, edit drop tab 29
  text "This is a sample of how your message will look:", 547, 70 106 170 8, tab 29
  icon 548, 70 116 170 11, script\pnp.ico, tab 29
  text "", 549, 70 136 95 8, tab 29
  edit "", 550, 165 134 20 11, autohs tab 29
  edit "", 551, 188 134 20 11, autohs tab 29

  ; Protection [560-599]
  check "&Send script reply to VERSION CTCPs", 560, 70 5 175 8, tab 30
  check "&Reply to other CTCPs-", 561, 70 14 175 8, tab 30
  button "&Edit Replies", 562, 81 25 50 12, tab 30
  check "&DCC flood protection enabled", 563, 70 40 175 8, tab 30
  check "&CTCP flood protection enabled", 564, 70 49 175 8, tab 30
  check "&Change nick randomly if protection triggered", 565, 70 58 175 8, tab 30
  check "&Verify channels you are invited to", 581, 70 67 175 8, tab 30
  check "&Close DCC chat on flood:", 566, 70 84 80 8, tab 30
  edit "", 567, 150 83 20 11, autohs tab 30
  text "lines", 568, 172 85 25 8, tab 30
  edit "", 569, 198 83 20 11, autohs tab 30
  text "seconds", 570, 220 85 30 8, tab 30
  check "&Ignore queries on flood:", 571, 70 96 80 8, tab 30
  edit "", 572, 150 95 20 11, autohs tab 30
  text "queries", 573, 172 97 25 8, tab 30
  edit "", 574, 198 95 20 11, autohs tab 30
  text "seconds", 575, 220 97 30 8, tab 30
  check "&Ignore notices on flood:", 576, 70 108 80 8, tab 30
  edit "", 577, 150 107 20 11, autohs tab 30
  text "lines", 578, 172 109 25 8, tab 30
  edit "", 579, 198 107 20 11, autohs tab 30
  text "seconds", 580, 220 109 30 8, tab 30
  check "&Send self lag check every", 582, 70 123 80 8, tab 30
  edit "", 583, 150 122 20 11, autohs tab 30
  text "seconds", 584, 172 124 60 8, tab 30
  check "&Show self lag warnings at", 585, 70 135 80 8, tab 30
  edit "", 586, 150 134 20 11, autohs tab 30
  text "and", 587, 172 136 25 8, tab 30
  edit "", 588, 198 134 20 11, autohs tab 30
  text "seconds", 589, 220 136 30 8, tab 30

  ; Serverlist [600-619]
  text "PnP can include popups in status listing all known servers for a network. Add networks by entering their name (such as 'Undernet') and clicking 'Add', below.", 604, 70 5 170 24, tab 31
  check "&Enable serverlist popups in status:", 600, 70 30 170 8, tab 31
  combo 601, 70 40 135 60, size edit tab 31
  button "&Add", 602, 210 40 30 12, tab 31
  button "&Del", 603, 210 55 30 12, tab 31
  text "Servers shown in the serverlist are taken from mIRC's servers.ini. Update servers.ini and click 'Refresh' to refresh the serverlist popups.", 605, 70 105 170 24, tab 31
  button "&Refresh", 606, 190 129 50 12, tab 31
  edit "", 607, 1 1 1 1, hide
  text "The serverlist will refresh when you close this dialog.", 608, 70 129 120 16, hide tab 31

  ; Titlebar [620-649]
  check "&Update mIRC titlebar with info:", 638, 70 10 120 8, tab 32
  box "When here:", 620, 70 25 80 94, tab 32
  check "&Network", 621, 75 35 70 10, tab 32
  check "&Nickname", 622, 75 45 70 10, tab 32
  check "&Self-lag", 623, 75 55 70 10, tab 32
  check "&Active window", 624, 75 65 70 10, tab 32
  text "(and data)", 625, 84 74 61 10, tab 32
  check "&Pager", 626, 75 85 70 10, tab 32
  check "&Time", 627, 75 95 70 10, tab 32
  check "&Idle", 628, 75 105 70 10, tab 32
  box "When away:", 629, 160 25 80 94, tab 32
  check "&Network", 630, 165 35 70 10, tab 32
  check "&Nickname", 631, 165 45 70 10, tab 32
  check "&Self-lag", 632, 165 55 70 10, tab 32
  check "&Away reason", 633, 165 65 70 10, tab 32
  check "&Away logging", 634, 165 75 70 10, tab 32
  check "&Pager", 635, 165 85 70 10, tab 32
  check "&Time", 636, 165 95 70 10, tab 32
  check "&Idle", 637, 165 105 70 10, tab 32
  text "Note: Idle time will only be shown if over 90 seconds.", 639, 70 130 170 8, tab 32

  ; Other [650-679]
  text "&Channel nick-completion character(s):", 650, 70 15 100 8, right tab 33
  edit "", 651, 172 13 30 11, autohs tab 33
  text "&Inline nick-completion prefix:", 652, 70 27 100 8, right tab 33
  edit "", 653, 172 25 30 11, autohs tab 33
  check "&Ask if multiple matches found for nick-completion", 654, 75 42 170 8, tab 33
  check "&Use nick-completion in commands (/kick, /op, etc.)", 655, 75 51 170 8, tab 33
  check "&Strip colors/attributes from all script messages sent to IRC", 656, 75 65 170 8, tab 33
  box "Use /b as:", 657, 70 79 55 34, tab 33
  radio "/bac&k", 658, 80 89 40 8, group tab 33
  radio "/ba&n", 659, 80 99 40 8, tab 33
  box "FKeys for recent events: (CtrlF1, etc.)", 660, 130 79 115 34, tab 33
  radio "&Cycle through all choices", 661, 140 89 100 8, group tab 33
  radio "&Automatically use most recent", 662, 140 99 100 8, tab 33
  box "FKeys to use for misc. events such as DNS:", 663, 70 119 175 24, tab 33
  radio "&F7", 664, 80 129 50 8, group tab 33
  radio "&F10", 665, 130 129 50 8, tab 33
  radio "&Any", 666, 180 129 55 8, tab 33
}

; /_config [#]
; Open configuration dialog
alias _config {
  set -u %.section $1
  if ($1 == $null) set -u %.section $_dlgi(cfg)
  _dialog -md pnp.config pnp.config
}

; Dialog init
on *:DIALOG:pnp.config:init:*:{
  ; prep combos/lists
  loadbuf -otconfig $dname 901 "script\dlgtext.dat"
  var %num = 33
  ; (mark all sections as un-viewed)
  while (%num > 0) {
    did -a $dname 902 0
    dec %num
  }

  ; Used for preview of msgs
  window -fhnp +d @.msgprev 0 0 340 22

  ;  show first or selected section of dialog
  if ((%.section !isnum) || ($gettok($did(901,%.section),1,32) == $null) || ($findtok(1 6 16,%.section,32))) %.section = 2
  did -c $dname 901 %.section
  page.show %.section
  ;!! Need a timer for this at this time
  .timer -mio 1 0 did -c pnp.config %.section $chr(124) did -f pnp.config 901

  unset %.section
}

; Select new section, unless a 'blank' section was selected
; Selecting the top item of a group (Away, Display, Popups) will select the
; first item of the group
on *:DIALOG:pnp.config:sclick:901:{
  if ($gettok($did(901).seltext,1,32) == $null) did -c $dname 901 $did(903)
  elseif ($findtok(1 6 16,$did(901).sel,32)) {
    did -c $dname 901 $calc($did(901).sel + 1)
    page.show $did(901).sel
  }
  else page.show $did(901).sel
}

; Close dialog
on *:DIALOG:pnp.config:sclick:905:{
  ; Apply all modified pages
  var %num = 33
  while (%num > 0) {
    if ($did(902,%num) == 1) page.apply %num
    dec %num
  }

  ; Cleanup
  _dlgw cfg $did(903)
  window -c @.msgprev
  .remove script\temp\msgprev.bmp
  .timer.config.msgpreview off
  .timer.msgview.fix off
  _unload config
  dialog -x pnp.config
}

; Cleanup
on *:DIALOG:pnp.config:sclick:906:{
  _dlgw cfg $did(903)
  window -c @.msgprev
  .remove script\temp\msgprev.bmp
  .timer.config.msgpreview off
  .timer.msgview.fix off
  _unload config
}

; If tabs are 'clicked', undo any changes
on *:DIALOG:pnp.config:sclick:1,2,3,4,7,8,9,10,11,12,13,14,17,18,19,20,21,22,24,25,26,27,28,29,30,31,32,33:{
  did -f pnp.config 901
  did -c pnp.config $did(903)
}

; Handle various dynamic parts of the dialog- disable/enable on clicks, etc.
on *:DIALOG:pnp.config:*:*:{
  var %ranges = * 70-99 100-129 130-149 * * 150-159 160-189 190-209 210-229 230-249 250-269 270-289 290-309 * * 310-329 330-349 350-369 370-389 390-409 410-429 * 430-459 40-69 460-489 490-519 520-539 540-559 560-599 600-619 620-649 650-679

  ; Current range being shown
  var %shown = $gettok(%ranges,$did(901).sel,32)

  ; If an item in that range was modified, call page.mod
  if ($did isnum %shown) page.mod $did(901).sel
}

; /page.show n
; Show a page of the dialog
alias -l page.show {
  ; (do nothing if same page as before)
  if ($did(903) == $1) return

  ; If area hasn't been visited yet, we must prep it
  if ($did(902,$1) == 0) {
    ; Mark as visited and initialize
    did -o pnp.config 902 $1 1
    page.init $1
    page.mod $1 1
  }

  ; Fixes windows bug with showing && in tabbed dialogs
  if ($1 == 4) did -ro pnp.config 138 1 $chr(40) $+ use &&me&& to represent old nick $+ $chr(41)
  if ($1 == 29) {
    var %left = &&[&&
    var %right = &&]&&
    did -ro pnp.config 549 1 & $+ Brackets- Replace %left and %right with:
  }

  ; Remember what page we did last, show tab, move focus back to list, set default to O
  did -o pnp.config 903 1 $1
  did -c pnp.config $1
  did -f pnp.config 901
  did -t pnp.config 905
}

; /page.init n
; Prepare a page of the dialog from our configuration and/or prep any combos, lists, etc.
; Will not be called more than once for a page, so you can assume everything is blank/unchecked at this point
alias -l page.init {
  goto $1

  ; Away - Pager/Log
  :2
  did -a $dname 75,76,77 On
  did -a $dname 75,76,77 Off
  did -a $dname 75,76,77 Quiet
  loadbuf -otawayopt1 $dname 82 "script\dlgtext.dat"
  loadbuf -otawayopt2 $dname 84 "script\dlgtext.dat"
  did -c $dname 75 $iif($_cfgi(away.pager) == quiet,3,$iif($_cfgi(away.pager),1,2))
  did -c $dname 76 $iif($_cfgi(autoaway.pager) == quiet,3,$iif($_cfgi(autoaway.pager),1,2))
  did -c $dname 77 $iif($_cfgi(back.pager) == quiet,3,$iif($_cfgi(back.pager),1,2))
  if ($_cfgi(away.log)) did -c $dname 78
  if ($_cfgi(autoaway.log)) did -c $dname 79
  if ($hget(pnp.config,awaylog.msg)) did -c $dname 81
  did -c $dname 82 $calc(1 + $hget(pnp.config,awaylog.close))
  if ($hget(pnp.config,awaylog.chan)) {
    did -c $dname 83
    did -c $dname 84 $ifmatch
  }
  else did -c $dname 84 1
  if ($_cfgi(pager.classic)) did -c $dname 85
  if ($_cfgi(awaylog.clear)) did -c $dname 86
  if ($_cfgi(away.closeq)) did -c $dname 87
  if ($hget(pnp.config,awaylog.perm)) did -c $dname 88
  return

  ; Away - Message
  :3
  if ($_cfgi(away.act)) did -c $dname 101
  else did -c $dname 102
  if ($_cfgi(away.chan)) did -c $dname 104
  if ($_cfgi(away.msg)) did -c $dname 105
  if ($_cfgi(away.ignchan)) did -c $dname 106
  if ($_cfgi(away.ignchanlist)) did -a $dname 107 $ifmatch
  if ($_cfgi(away.ignidle)) did -c $dname 108
  if ($_cfgi(away.ignidletime) isnum) did -a $dname 110 $ifmatch
  else did -a $dname 110 30
  if ($_cfgi(away.rep)) did -c $dname 111
  if ($_cfgi(away.delay) isnum) did -a $dname 113 $ifmatch
  else did -a $dname 113 30
  if ($hget(pnp.config,away.remind)) did -c $dname 115
  if ($hget(pnp.config,awaywords.hl)) did -c $dname 116
  if ($hget(pnp.config,awaywords)) did -c $dname 117
  if ($hget(pnp.config,awaywords.words)) did -a $dname 118 $ifmatch
  if ($hget(pnp.config,awaywords.limit)) did -c $dname 119
  if ($hget(pnp.config,awaywords.chans)) did -a $dname 120 $ifmatch
  return

  ; Away - Other
  :4
  if ($hget(pnp.config,autoaway)) did -c $dname 131
  if ($hget(pnp.config,autoaway.time) isnum) did -a $dname 133 $calc($ifmatch / 60)
  else did -a $dname 133 30
  if ($_cfgi(autoaway.ask)) did -c $dname 134
  if ($_cfgi(autoaway.quiet)) did -c $dname 135
  if ($_cfgi(away.chnick)) did -c $dname 136
  if ($_cfgi(away.nick)) did -a $dname 137 $ifmatch
  else did -a $dname 137 &me&Away
  if ($_cfgi(away.sndoff)) did -c $dname 139
  if ($_cfgi(away.beepoff)) did -c $dname 140
  if ($_cfgi(away.deop)) did -c $dname 141
  if ($_cfgi(away.dq)) did -c $dname 142
  if ($_cfgi(away.allconnect)) did -c $dname 143
  return

  ; Display - Nick colors
  :7
  if ($_cfgi(nickcol)) did -c $dname 150
  if ($hget(pnp.config,themecol)) did -c $dname 151
  if ($hget(pnp.config,lagtime) isnum) did -a $dname 153 $ifmatch
  else did -a $dname 20
  return

  ; Display - Notify
  :8
  var %did = 165
  while (%did <= 170) {
    loadbuf -otnotify $dname %did "script\dlgtext.dat"
    inc %did
  }
  loadbuf -otnotifywin $dname 176 "script\dlgtext.dat"
  did -c $dname 165 $calc(1 + $findtok(ext hide,$_cfgi(notify.match),32))
  did -c $dname 166 $calc(1 + $findtok(ext hide,$_cfgi(notify.fail),32))
  did -c $dname 167 $calc(1 + $findtok(ext hide,$_cfgi(notify.nocheck),32))
  did -c $dname 168 $calc(1 + $findtok(ext hide,$_cfgi(unotify.match),32))
  did -c $dname 169 $calc(1 + $findtok(ext hide,$_cfgi(unotify.fail),32))
  did -c $dname 170 $calc(1 + $findtok(ext hide,$_cfgi(unotify.nocheck),32))
  if ($_cfgi(notify.beepmatch)) did -c $dname 172
  if ($_cfgi(notify.beepfail)) did -c $dname 173
  if ($_cfgi(notify.beepnocheck)) did -c $dname 174
  did -c $dname 176 $calc(1 + $findtok(-si2 none off,$hget(pnp.config,notify.win),32))
  if ($_cfgi(unotify.part)) did -c $dname 177
  if ($hget(pnp.config,show.fkeys)) did -c $dname 178
  return

  ; Display - Ping
  :9
  loadbuf -otpingwin1 $dname 191 "script\dlgtext.dat"
  loadbuf -otpingwin2 $dname 193 "script\dlgtext.dat"
  did -c $dname 191 $calc(1 + $findtok(-si2 @Ping * none,$hget(pnp.config,ping.bulk),32))
  did -c $dname 193 $calc(1 + $findtok(-si2 *,$hget(pnp.config,ping.one),32))
  if ($hget(pnp.config,ping.focus) == min) did -c $dname 195
  if ($hget(pnp.config,ping.focus) == front) did -c $dname 196
  if ($hget(pnp.config,ping.retain)) did -c $dname 197
  if ($hget(pnp.config,show.pingcode)) did -c $dname 198
  return

  ; Display - Server notices
  :10
  loadbuf -otsnotice $dname 223 "script\dlgtext.dat"
  if ($hget(pnp.config,snotice.on)) did -c $dname 213
  did -c $dname 223 $calc(1 + $findtok(-si2 @SNotice,$hget(pnp.config,snotice.win),32))
  var %ln = 1,%filter = $hget(pnp.config,snotice.f)
  while ($read(script\snotice.dat,n,%ln)) {
    var %data = $ifmatch,%to = 218
    if ($mid(%filter,%ln,1)) %to = 216
    did -a $dname %to %data
    did -i $dname $calc(%to + 1) $didwm($dname,%to,%data,1) %ln
    inc %ln
  }
  return

  ; Display - Text
  :11
  if ($hget(pnp.config,copy.query)) did -c $dname 231
  if ($_cfgi(texts)) did -c $dname 230
  if ($hget(pnp.config,reg.notice) isnum 0-2) did -c $dname $calc(233 + $ifmatch)
  else did -c $dname 233
  if ($hget(pnp.config,op.notice) isnum 0-2) did -c $dname $calc(237 + $ifmatch)
  else did -c $dname 237
  if ($hget(pnp.config,serv.notice) isnum 0-2) did -c $dname $calc(241 + $ifmatch)
  else did -c $dname 241

  return

  ; Display - Wallops
  :12
  loadbuf -otwallop $dname 263 "script\dlgtext.dat"
  if ($hget(pnp.config,wallop.on)) did -c $dname 253
  did -c $dname 263 $calc(1 + $findtok(-si2 @Wallop,$hget(pnp.config,wallop.win),32))
  var %ln = 1,%filter = $hget(pnp.config,wallop.f)
  while ($read(script\wallop.dat,n,%ln)) {
    var %data = $ifmatch,%to = 258
    if ($mid(%filter,%ln,1)) %to = 256
    did -a $dname %to %data
    did -i $dname $calc(%to + 1) $didwm($dname,%to,%data,1) %ln
    inc %ln
  }
  return

  ; Display - Whois replies
  :13
  loadbuf -otwhoiswin $dname 271 "script\dlgtext.dat"
  did -c $dname 271 $calc(1 + $findtok(-si2 @Whois *,$hget(pnp.config,whois.win),32))
  if ($_cfgi(whois.q)) did -c $dname 273
  if ($_cfgi(whois.focus) == min) did -c $dname 274
  if ($_cfgi(whois.focus) == front) did -c $dname 275
  if ($_cfgi(whois.retain)) did -c $dname 276
  if ($_cfgi(whois.serv)) did -c $dname 277
  if ($hget(pnp.config,whois.shared)) did -c $dname 278
  did -c $dname $calc(280 + $findtok(off hide,$hget(pnp.config,whois.nick),32))
  return

  ; Display - Other
  :14
  loadbuf -otnames $dname 291 "script\dlgtext.dat"
  loadbuf -otmotdwhen $dname 293 "script\dlgtext.dat"
  did -c $dname 291 $calc(1 + $_cfgi(show.names))
  did -c $dname 293 $calc(1 + $findtok(off changes,$_cfgi(motd.disp),32))
  if ($_cfgi(format.time)) did -o $dname 295 0 $ifmatch
  else did -o $dname 295 0 hh:nnt
  did -a $dname 295 05:30p
  did -a $dname 295 05:30pm
  did -a $dname 295 05:30P
  did -a $dname 295 05:30PM
  did -a $dname 295 17:30
  if ($_cfgi(format.date)) did -o $dname 297 0 $ifmatch
  else did -o $dname 297 0 ddd doo mmm yyyy
  did -a $dname 297 Mon 25th Jan 2002
  did -a $dname 297 Jan 25, 2002
  did -a $dname 297 01/25/02
  did -a $dname 297 25/01/02
  did -a $dname 297 01/25/2002
  did -a $dname 297 25/01/2002
  if ($_cfgi(eroute) == -ai2) did -c $dname 298
  if ($hget(pnp.config,rawroute) == -ai2) did -c $dname 302
  if ($_cfgi(motd.win) == @MOTD) did -c $dname 299
  if (!$_cfgi(hidesplash)) did -c $dname 300
  return

  ; Popups - Channel
  :17
  var %pos = 1,%data = $hget(pnp.config,popups.3)
  while (%pos <= 11) {
    if ($mid(%data,%pos,1)) did -c $dname $calc(309 + %pos)
    inc %pos
  }
  ; hide-ops are linked between this and nicklist page- so if we've visited nicklist, don't touch
  if ($did(902,19) == 0) {
    if ($hget(pnp.config,popups.hideop)) did -c $dname 321,362
  }
  return

  ; Popups - Menubar
  :18
  var %pos = 1,%data = $hget(pnp.config,popups.1)
  while (%pos <= 10) {
    if ($mid(%data,%pos,1)) did -c $dname $calc(329 + %pos)
    inc %pos
  }
  return

  ; Popups - Nicklist
  :19
  var %pos = 1,%data = $hget(pnp.config,popups.4)
  while (%pos <= 12) {
    if ($mid(%data,%pos,1)) did -c $dname $calc(349 + %pos)
    inc %pos
  }
  ; hide-ops are linked between this and nicklist page- so if we've visited channel, don't touch
  if ($did(902,17) == 0) {
    if ($hget(pnp.config,popups.hideop)) did -c $dname 321,362
  }
  return

  ; Popups - Query
  :20
  var %pos = 1,%data = $hget(pnp.config,popups.2)
  while (%pos <= 11) {
    if ($mid(%data,%pos,1)) did -c $dname $calc(369 + %pos)
    inc %pos
  }
  return

  ; Popups - Status
  :21
  var %pos = 1,%data = $hget(pnp.config,popups.5)
  while (%pos <= 11) {
    if ($mid(%data,%pos,1)) did -c $dname $calc(389 + %pos)
    inc %pos
  }
  return

  ; Popups - @Windows
  :22
  var %pos = 1,%data = $hget(pnp.config,popups.6)
  while (%pos <= 6) {
    if ($mid(%data,%pos,1)) did -c $dname $calc(409 + %pos)
    inc %pos
  }
  return

  ; Channel options
  :24
  loadbuf -ottempban $dname 433 "script\dlgtext.dat"
  loadbuf -otidentmask $dname 435 "script\dlgtext.dat"
  loadbuf -othostmask $dname 437 "script\dlgtext.dat"
  did -ac $dname 453 (default)
  did -a $dname 454 $hget(pnp.config,chopt)
  var %ch = $hmatch(pnp.config,chopt.?*,0)
  while (%ch) {
    var %item = $hmatch(pnp.config,chopt.?*,%ch)
    did -a $dname 453 $right(%item,-6)
    did -i $dname 454 $_scandid($dname,453,$right(%item,-6)) $hget(pnp.config,%item)
    dec %ch
  }
  return

  ; DCC accept
  :25
  var %did = 50,%opt = $hget(pnp.config,dcc.opt)
  while (%did <= 59) {
    loadbuf -otdccaccept $dname %did "script\dlgtext.dat"
    did -c $dname %did $gettok(1 3 4 2,$calc($mid(%opt,$calc(%did - 49),1) + 1),32)
    inc %did
  }
  return

  ; Favorites
  :26
  var %ini = $_cfg(config.ini)
  var %ln = $ini(%ini,favopt,0)
  while (%ln) {
    var %item = $ini(%ini,favopt,%ln)
    if (%item != all) did -a $dname 470 %item
    dec %ln
  }
  filter -ioct 1 32 $dname 470 $dname 470
  %ln = $did($dname,470).lines
  if (%ln) did -c $dname 470 1
  while (%ln) {
    var %item = $did($dname,470,%ln)
    var %favs = $readini(%ini,n,fav,%item)
    var %favservs = $readini(%ini,n,favserv,%item)
    var %favopts = $readini(%ini,n,favopt,%item)
    did -i $dname 487 1 - $replace(%favs,$chr(44),$chr(32))
    did -i $dname 488 1 - $replace(%favservs,$chr(44),$chr(32))
    did -i $dname 489 1 %favopts
    dec %ln
  }
  var %ln = 1,%chans
  while (%=chan. [ $+ [ %ln ] ] ) {
    %chans = %chans %=chan. [ $+ [ %ln ] ]
    inc %ln
  }
  did -i $dname 470 1 (channels menu)
  did -i $dname 487 1 - %chans
  did -i $dname 488 1 -
  did -i $dname 489 1 $iif($_cfgi(fill.chan),1,0) $iif($_cfgi(num.chan) isnum,$ifmatch,10) - - -
  did -i $+ $iif($did(470).lines < 2,c) $dname 470 1 (all networks)
  did -i $dname 487 1 - $replace($readini(%ini,n,fav,all),$chr(44),$chr(32))
  did -i $dname 488 1 -
  did -i $dname 489 1 $iif($gettok($readini(%ini,n,favopt,all),1,32),1 0 - - -,0 0 - - -)
  return

  ; Flashing
  :27
  var %opt = $hget(pnp.config,flash.opt),%pos = 1
  while (%pos <= 6) {
    if ($mid(%opt,%pos,1)) did -c $dname $calc(494 + %pos)
    inc %pos
  }
  if (($_cfgi(flash.here) isnum) && ($_cfgi(flash.here) > 0)) {
    did -a $dname 502 $ifmatch
    did -c $dname 501
  }
  else did -a $dname 502 10
  if (($_cfgi(flash.away) isnum) && ($_cfgi(flash.away) > 0)) {
    did -a $dname 505 $ifmatch
    did -c $dname 504
  }
  else did -a $dname 505 10
  return

  ; Language
  :28
  if ($readini(script\transup.ini,n,translation,enabled) == no) {
    did -ra $dname 524 This installation of PnP does not currently support translation. You may download a version that supports translation at pnp.kristshell.net/.
    did -b $dname 520,521,522,523,527,528,525,526
  }
  if ($readini(script\transup.ini,n,translation,language)) did -a $dname 521 $ifmatch
  else did -a $dname 521 English
  if ($readini(script\transup.ini,n,translation,transopt)) did -a $dname 529 $ifmatch
  else did -a $dname 529 -
  if (p isin $did($dname,529)) did -c $dname 527
  if (l isin $did($dname,529)) did -c $dname 528
  window -nhl @.trans
  var %num = $findfile(script\trans\,*.ini,@.trans)
  while (%num) {
    var %lang = $readini($line(@.trans,%num),n,info,language)
    if (%lang) did -a $dname 525 %lang
    dec %num
  }
  window -c @.trans
  return

  ; Messages
  :29
  window -nhl @.msgs
  loadbuf @.msgs script\msgdefs.dat
  var %ln = $line(@.msgs,0)
  var %last
  while (%ln) {
    var %data = $line(@.msgs,%ln)
    ; (ALL msgs data and current msg gets loaded into 552)
    var %curr = $read($_cfg(msgs.dat),ns,$gettok(%data,2,32))
    if (%curr == $null) %curr = $_p2s($gettok($gettok(%data,5,32),1,124))
    did -a $dname 552 $gettok(%data,1-4,32) %curr
    if ($gettok(%data,1,32) != %last) {
      %last = $ifmatch
      did -a $dname 542 $_p2s(%last)
    }
    dec %ln
  }
  window -c @.msgs
  did -ac $dname 542 (all)
  if ($hget(pnp.config,bracket.left)) did -a $dname 550 $ifmatch
  if ($hget(pnp.config,bracket.right)) did -a $dname 551 $ifmatch
  return

  ; Protection
  :30
  var %prot = $hget(pnp.config,myflood.prot)
  if (%prot & 1) did -c $dname 564
  if (%prot & 2) did -c $dname 563
  if (%prot & 4) did -c $dname 565
  if (%prot & 8) did -c $dname 560
  if (%prot & 16) did -c $dname 561
  if ($_cfgi(verify.inv)) did -c $dname 581
  var %cfg = $hget(pnp.config,xchat.cfg)
  if ($gettok(%cfg,1,32)) did -c $dname 566
  if ($gettok(%cfg,2,32) isnum) did -a $dname 567 $ifmatch
  else did -a $dname 567 50
  if ($gettok(%cfg,3,32) isnum) did -a $dname 569 $ifmatch
  else did -a $dname 569 5
  var %cfg = $_cfgi(xquery.cfg)
  if ($gettok(%cfg,1,32)) did -c $dname 571
  if ($gettok(%cfg,2,32) isnum) did -a $dname 572 $ifmatch
  else did -a $dname 572 5
  if ($gettok(%cfg,3,32) isnum) did -a $dname 574 $ifmatch
  else did -a $dname 574 5
  var %cfg = $hget(pnp.config,xnotice.cfg)
  if ($gettok(%cfg,1,32)) did -c $dname 576
  if ($gettok(%cfg,2,32) isnum) did -a $dname 577 $ifmatch
  else did -a $dname 577 30
  if ($gettok(%cfg,3,32) isnum) did -a $dname 579 $ifmatch
  else did -a $dname 579 5
  if (($_cfgi(sptime) isnum) && ($_cfgi(sptime) > 0)) {
    did -a $dname 583 $ifmatch
    did -c $dname 582
  }
  else {
    did -a $dname 583 30
  }
  if ($_cfgi(spwarn1) isnum) did -a $dname 586 $ifmatch
  if ($_cfgi(spwarn2) isnum) did -a $dname 588 $ifmatch
  if (($did($dname,586)) || ($did($dname,588))) did -c $dname 585
  else {
    did -ra $dname 586 30
    did -ra $dname 588 60
  }
  return

  ; Serverlist
  :31
  if ($_cfgx(serverlist,on)) did -c $dname 600
  var %nets = $_cfgx(serverlist,groups),%ln = 1
  while ($gettok(%nets,%ln,32)) {
    did -a $dname 601 $ifmatch
    inc %ln
  }
  return

  ; Titlebar
  :32
  if ($hget(pnp.config,title.bar)) did -c $dname 638
  var %here = $_cfgi(title.here)
  var %away = $_cfgi(title.away)
  var %pos = 1
  while (%pos <= 8) {
    if (($mid(%here,%pos,1)) && (%pos != 5)) did -c $dname $calc(620 + %pos)
    if ($mid(%away,%pos,1)) did -c $dname $calc(629 + %pos)
    inc %pos
  }
  return

  ; Other
  :33
  if ($hget(pnp.config,nc.char)) did -a $dname 651 $ifmatch
  if ($hget(pnp.config,nci.char)) did -a $dname 653 $ifmatch
  if ($_cfgi(nc.ask)) did -c $dname 654
  if ($hget(pnp.config,nc.cmd)) did -c $dname 655
  if ($hget(pnp.config,strip.auto)) did -c $dname 656
  if ($_cfgi(b.ban)) did -c $dname 659
  else did -c $dname 658
  if ($_cfgi(recent.auto)) did -c $dname 662
  else did -c $dname 661
  if ($_cfgi(reserve.fkey) == 2) did -c $dname 666
  elseif ($_cfgi(reserve.fkey) == 1) did -c $dname 664
  else did -c $dname 665
  return
}

; /page.apply n
; Save a page of the dialog to configuration
alias -l page.apply {
  ; Save current options?
  if ($istok(24 26 29,$1,32)) page.mod $1 0 1
  goto $1

  ; Away - Pager/Log
  :2
  _cfgw away.pager $gettok(1 0 quiet,$did(75).sel,32)
  _cfgw autoaway.pager $gettok(1 0 quiet,$did(76).sel,32)
  _cfgw back.pager $gettok(1 0 quiet,$did(77).sel,32)
  _cfgw away.log $did(78).state
  _cfgw autoaway.log $did(79).state
  `set awaylog.msg $did(81).state
  `set awaylog.close $calc($did(82).sel - 1)
  if (!$did(83).state) `set awaylog.chan 0
  else `set awaylog.chan $did(84).sel
  _cfgw pager.classic $did(85).state
  _cfgw awaylog.clear $did(86).state
  _cfgw away.closeq $did(87).state
  `set awaylog.perm $did(88).state
  return

  ; Away - Message
  :3
  _cfgw away.act $did(101).state
  _cfgw away.chan $did(104).state
  _cfgw away.msg $did(105).state
  _cfgw away.ignchan $did(106).state
  _cfgw away.ignchanlist $gettok($replace($did(107),$chr(32),$chr(44)),1-,44)
  _cfgw away.ignidle $did(108).state
  _cfgw away.ignidletime $iif($did(110) isnum,$did(110),30)
  _cfgw away.rep $did(111).state
  _cfgw away.delay $iif($did(113) isnum,$did(113),30)
  `set away.remind $did(115).state
  `set awaywords.hl $did(116).state
  `set awaywords $did(117).state
  `set awaywords.words $did(118)
  `set awaywords.limit $did(119).state
  `set awaywords.chans $gettok($replace($did(120),$chr(32),$chr(44)),1-,44)
  return

  ; Away - Other
  :4
  `set autoaway $did(131).state
  `set autoaway.time $iif($did(133) isnum,$int($calc($ifmatch * 60)),1800)
  _cfgw autoaway.ask $did(134).state
  _cfgw autoaway.quiet $did(135).state
  _cfgw away.chnick $did(136).state
  _cfgw away.nick $iif($did(137),$ifmatch,&me&Away)
  _cfgw away.sndoff $did(139).state
  _cfgw away.beepoff $did(140).state
  _cfgw away.deop $did(141).state
  _cfgw away.dq $did(142).state
  _cfgw away.allconnect $did(143).state
  return

  ; Display - Nick colors
  :7
  _cfgw nickcol $did(150).state
  `set themecol $did(151).state
  `set lagtime $iif($did(153) isnum,$ifmatch,20)
  _upd.texts
  .nickcol
  return

  ; Display - Notify
  :8
  _cfgw notify.match $gettok(show ext hide,$did(165).sel,32)
  _cfgw notify.fail $gettok(show ext hide,$did(166).sel,32)
  _cfgw notify.nocheck $gettok(show ext hide,$did(167).sel,32)
  _cfgw unotify.match $gettok(show ext hide,$did(168).sel,32)
  _cfgw unotify.fail $gettok(show ext hide,$did(169).sel,32)
  _cfgw unotify.nocheck $gettok(show ext hide,$did(170).sel,32)
  _cfgw notify.beepmatch $did(172).state
  _cfgw notify.beepfail $did(173).state
  _cfgw notify.beepnocheck $did(174).state
  `set notify.win $gettok(-ai2 -si2 none off,$did(176).sel,32)
  _cfgw unotify.part $did(177).state
  `set show.fkeys $did(178).state
  return

  ; Display - Ping
  :9
  `set ping.bulk $gettok(-ai2 -si2 @Ping * none,$did(191).sel,32)
  `set ping.one $gettok(-ai2 -si2 *,$did(193).sel,32)
  `set ping.focus $iif($did(195).state,min,$iif($did(196).state,front,norm))
  `set ping.retain $did(197).state
  `set show.pingcode $did(198).state
  return

  ; Display - Server notices
  :10
  `set snotice.on $did(213).state
  `set snotice.win $gettok(-ai2 -si2 @SNotice,$did(223).sel,32)
  var %filter = $str(0,$calc($did(217).lines + $did(219).lines))
  var %ln = $did(217).lines
  ; (set all in 'show' to 1 in filter)
  while (%ln) {
    var %pos = $did(217,%ln)
    %filter = $left(%filter,$calc(%pos - 1)) $+ 1 $+ $mid(%filter,$calc(%pos + 1))
    dec %ln
  }
  ; Set to a letter first due to mirc bug when comparing very large numeric strings
  `set snotice.f a
  `set snotice.f %filter
  return

  ; Display - Text
  :11
  `set copy.query $did(231).state
  _cfgw texts $did(230).state
  `set reg.notice $iif($did(234).state,1,$iif($did(235).state,2,0))
  `set op.notice $iif($did(238).state,1,$iif($did(239).state,2,0))
  `set serv.notice $iif($did(242).state,1,$iif($did(243).state,2,0))
  _upd.texts
  return

  ; Display - Wallops
  :12
  `set wallop.on $did(253).state
  `set wallop.win $gettok(-ai2 -si2 @Wallop,$did(263).sel,32)
  var %filter = $str(0,$calc($did(257).lines + $did(259).lines))
  var %ln = $did(257).lines
  ; (set all in 'show' to 1 in filter)
  while (%ln) {
    var %pos = $did(257,%ln)
    %filter = $left(%filter,$calc(%pos - 1)) $+ 1 $+ $mid(%filter,$calc(%pos + 1))
    dec %ln
  }
  ; Set to a letter first due to mirc bug when comparing very large numeric strings
  `set wallop.f a
  `set wallop.f %filter
  return

  ; Display - Whois replies
  :13
  `set whois.win $gettok(-ai2 -si2 @Whois *,$did(271).sel,32)
  _cfgw whois.q $did(273).state
  _cfgw whois.focus $iif($did(274).state,min,$iif($did(275).state,front,norm))
  _cfgw whois.retain $did(276).state
  _cfgw whois.serv $did(277).state
  `set whois.shared $did(278).state
  `set whois.nick $iif($did(280).state,on,$iif($did(281).state,off,hide))
  return

  ; Display - Other
  :14
  _cfgw show.names $calc($did(291).sel - 1)
  _cfgw motd.disp $gettok(on off changes,$did(293).sel,32)
  _cfgw format.time $iif($did(295),$did(295),hh:nnt)
  _cfgw format.date $iif($did(297),$did(297),ddd doo mmm yyy)
  _cfgw eroute $iif($did(298).state,-ai2,-si2)
  `set rawroute $iif($did(302).state,-ai2,-si2)
  _cfgw motd.win $iif($did(299).state,@MOTD,-si2)
  _cfgw hidesplash $iif($did(300).state,0,1)
  ; (update disp alias- eroute may have changed)
  theme.alias pnp.theme pnp.events
  return

  ; Popups - Channel
  :17
  var %pos = 1,%data
  while (%pos <= 11) {
    %data = %data $+ $did($calc(309 + %pos)).state
    inc %pos
  }
  `set popups.3 %data
  `set popups.hideop $did(321).state
  return

  ; Popups - Menubar
  :18
  var %pos = 1,%data
  while (%pos <= 10) {
    %data = %data $+ $did($calc(329 + %pos)).state
    inc %pos
  }
  `set popups.1 %data
  return

  ; Popups - Nicklist
  :19
  var %pos = 1,%data
  while (%pos <= 12) {
    %data = %data $+ $did($calc(349 + %pos)).state
    inc %pos
  }
  `set popups.4 %data
  `set popups.hideop $did(362).state
  return

  ; Popups - Query
  :20
  var %pos = 1,%data
  while (%pos <= 11) {
    %data = %data $+ $did($calc(369 + %pos)).state
    inc %pos
  }
  `set popups.2 %data
  return

  ; Popups - Status
  :21
  var %pos = 1,%data
  while (%pos <= 11) {
    %data = %data $+ $did($calc(389 + %pos)).state
    inc %pos
  }
  `set popups.5 %data
  return

  ; Popups - @Windows
  :22
  var %pos = 1,%data
  while (%pos <= 6) {
    %data = %data $+ $did($calc(409 + %pos)).state
    inc %pos
  }
  `set popups.6 %data
  return

  ; Channel options
  :24
  var %ln = $did(453).lines
  while (%ln) {
    var %chan = $did(453,%ln)
    if ($left(%chan,1) == $chr(40)) %chan = chopt
    else %chan = chopt. $+ %chan
    `set %chan $did(454,%ln)
    dec %ln
  }
  ; deleting channel(s)
  var %chanlist = $didtok($dname,453,44),%num = $hfind(pnp.config,chopt.*,0,w)
  while (%num > 0) {
    var %chan2 = $right($hfind(pnp.config,chopt.*,%num,w),-6)
    if (!$istok(%chanlist,%chan2,44)) { `set $hfind(pnp.config,chopt.*,%num,w) }
    dec %num
  }
  return

  ; DCC accept
  :25
  var %opt,%did = 50
  while (%did <= 59) {
    %opt = %opt $+ $gettok(0 3 1 2,$did(%did).sel,32)
    inc %did
  }
  `set dcc.opt %opt
  return

  ; Favorites
  :26
  ; (delete items no longer used)
  var %ini = $_cfg(config.ini)
  var %ln = $ini(%ini,favopt,0)
  while (%ln) {
    var %item = $ini(%ini,favopt,%ln)
    if (!$_scandid($dname,470,%item)) {
      _cfgxw fav %item
      _cfgxw favserv %item
      _cfgxw favopt %item
    }
    dec %ln
  }
  var %ln = $did(470).lines
  while (%ln) {
    var %sel = $did(470,%ln)
    if (%ln == 1) %sel = all
    ; Collect data
    var %chans = $gettok($did(487,%ln),2-,32)
    var %servs = $gettok($did(488,%ln),2-,32)
    var %opts = $did(489,%ln)
    ; Store where?
    if (%ln == 2) {
      ; Chans menu
      _cfgw fill.chan $gettok(%opts,1,32)
      _cfgw num.chan $iif($gettok(%opts,2,32) isnum,$ifmatch,10)
      unset %=chan.*
      var %tok = 1
      while ($gettok(%chans,%tok,32)) {
        %=chan. [ $+ [ %tok ] ] = $ifmatch
        inc %tok
      }
      if (%chans) %=chan.clr = Clear this list
    }
    else {
      ; Normal favorites
      _cfgxw fav %sel %chans
      _cfgxw favserv %sel %servs
      _cfgxw favopt %sel %opts
    }
    dec %ln
  }
  return

  ; Flashing
  :27
  var %opt,%pos = 495
  while (%pos <= 500) {
    %opt = %opt $+ $did(%pos).state
    inc %pos
  }
  `set flash.opt %opt
  if (($did(501).state) && ($did(502) isnum)) _cfgw flash.here $ifmatch
  else _cfgw flash.here 0
  if (($did(504).state) && ($did(505) isnum)) _cfgw flash.away $ifmatch
  else _cfgw flash.away 0
  return

  ; Language
  :28
  if ($readini(script\transup.ini,n,translation,enabled) == no) return
  var %flags = $iif($did(527).state,p) $+ $iif($did(528).state,l)
  var %oldflags = $iif(p isin $did(529),p) $+ $iif(l isin $did(529),l)
  if ($did(523) == $null) did -a $dname 523 $did(521)
  if (($did(521) != $did(523)) || (%flags != %oldflags)) {
    ; Translate! First find file.
    window -nhl @.trans
    var %num = $findfile(script\trans\,*.ini,@.trans)
    var %file
    while (%num) {
      var %lang = $readini($line(@.trans,%num),n,info,language)
      if (%lang == $did(523)) {
        %file = $line(@.trans,%num)
        break
      }
      dec %num
    }
    window -c @.trans
    ; File not found
    if (%file == $null) return
    if ($_okcancel(3,Applying the new translation options may take some time $+ $chr(44) during which you cannot use PnP. Continue?)) .timer -mio 1 0 translate -n $+ %flags %file
  }
  return

  ; Messages
  :29
  window -nhl @.msgs
  var %ln = $did(552).lines
  while (%ln) {
    aline @.msgs $gettok($did(552,%ln),2,32) $replace($gettok($did(552,%ln),5-,32),$chr(1),&)
    dec %ln
  }
  savebuf @.msgs " $+ $_cfg(msgs.dat) $+ "
  window -c @.msgs
  `set bracket.left $did(550)
  `set bracket.right $did(551)
  return

  ; Protection
  :30
  var %prot = 0
  if ($did(564).state) inc %prot 1
  if ($did(563).state) inc %prot 2
  if ($did(565).state) inc %prot 4
  if ($did(560).state) inc %prot 8
  if ($did(561).state) inc %prot 16
  `set myflood.prot %prot
  _cfgw verify.inv $did(581).state
  `set xchat.cfg $did(566).state $iif($did(567) isnum,$did(567),50) $iif($did(569) isnum,$did(569),5)
  _cfgw xquery.cfg $did(571).state $iif($did(572) isnum,$did(572),5) $iif($did(574) isnum,$did(574),5)
  `set xnotice.cfg $did(576).state $iif($did(577) isnum,$did(577),30) $iif($did(579) isnum,$did(579),5)
  _cfgw sptime $iif(($did(582).state) && ($did(583) isnum),$did(583),0)
  _cfgw spwarn1 $iif(($did(585).state) && ($did(586) isnum),$did(586),0)
  _cfgw spwarn2 $iif(($did(585).state) && ($did(588) isnum),$did(588),0)
  return

  ; Serverlist
  :31
  _cfgxw serverlist on $did(600).state
  var %nets,%ln = 1
  while ($did(601,%ln)) {
    %nets = %nets $ifmatch
    inc %ln
  }
  _cfgxw serverlist groups %nets
  if ($did(607)) _cfgxw serverlist last
  .timer -mio 1 0 .serverlist
  return

  ; Titlebar
  :32
  `set title.bar $did(638).state
  var %here,%away,%pos = 1
  while (%pos <= 8) {
    if (%pos == 5) %here = %here $+ 0
    else %here = %here $+ $did($calc(620 + %pos)).state
    %away = %away $+ $did($calc(629 + %pos)).state
    inc %pos
  }
  _cfgw title.here %here
  _cfgw title.away %away
  ; (update current title settings of cids)
  var %scon = $scon(0)
  while (%scon) {
    hadd pnp. $+ $scon(%scon) title $iif($hget(pnp. $+ $scon(%scon),away),%away,%here)
    dec %scon
  }
  return

  ; Other
  :33
  `set nc.char $did(651)
  `set nci.char $did(653)
  _cfgw nc.ask $did(654).state
  `set nc.cmd $did(655).state
  `set strip.auto $did(656).state
  _cfgw b.ban $did(659).state
  _cfgw recent.auto $did(662).state
  _cfgw reserve.fkey $iif($did(664).state,1,$iif($did(665).state,0,2))
  return
}

; /page.mod n [x] [y]
; Called when any item is modified or activated- sclick, edit, dclick
; Also called right after page.init
; Update any disable/enable, etc.
; [x] is true if this is being called right after init.
; [y] is true if being called manually from page.apply telling us to save any final changes.
alias -l page.mod {
  goto $1

  ; Away - Pager/Log
  :2
  did $iif($did(81).state,-e,-b) $dname 82
  did $iif($did(83).state,-e,-b) $dname 84
  return

  ; Away - Message
  :3
  did $iif($did(104).state,-e,-b) $dname 106,108
  did $iif(($did(106).state) && ($did(106).enabled),-e,-b) $dname 107
  did $iif(($did(108).state) && ($did(108).enabled),-e,-b) $dname 110
  did $iif($did(111).state,-e,-b) $dname 113
  did $iif(($did(116).state) || ($did(117).state),-e,-b) $dname 119
  did $iif($did(117).state,-e,-b) $dname 118
  did $iif(($did(119).state) && ($did(119).enabled),-e,-b) $dname 120
  return

  ; Away - Other
  :4
  did $iif($did(131).state,-e,-b) $dname 133,134,135
  did $iif($did(136).state,-e,-b) $dname 137
  return

  ; Display - Nick colors
  :7
  if (($devent == sclick) && ($did == 156)) ncedit
  return

  ; Display - Notify
  :8
  did $iif($did(176,1).sel != 4,-e,-b) $dname 165,166,167,168,169,170,172,173,174,177,178
  return

  ; Display - Ping
  :9
  did $iif(($did(191,1).sel == 3) && (!$did(196).state),-e,-b) $dname 195
  did $iif(($did(191,1).sel == 3) && (!$did(195).state),-e,-b) $dname 196
  return

  ; Display - Server notices
  :10
  ; Move?
  if ($did == 220) {
    while ($did(216,1).sel) {
      var %ln = $ifmatch
      var %text = $did(216,%ln)
      var %value = $did(217,%ln)
      did -d $dname 216 %ln
      did -d $dname 217 %ln
      did -a $dname 218 %text
      did -i $dname 219 $didwm($dname,218,%text,1) %value
    }
  }
  if ($did == 221) {
    while ($did(218,1).sel) {
      var %ln = $ifmatch
      var %text = $did(218,%ln)
      var %value = $did(219,%ln)
      did -d $dname 218 %ln
      did -d $dname 219 %ln
      did -a $dname 216 %text
      did -i $dname 217 $didwm($dname,216,%text,1) %value
    }
  }
  did $iif($did(213).state,-e,-b) $dname 216,218
  did $iif(($did(216,0).sel) && ($did(216).enabled),-e,-b) $dname 220
  did $iif(($did(218,0).sel) && ($did(218).enabled),-e,-b) $dname 221
  return

  ; Display - Text
  :11
  if (($devent == sclick) && ($did == 244)) textsch
  return

  ; Display - Wallops
  :12
  ; Move?
  if ($did == 260) {
    while ($did(256,1).sel) {
      var %ln = $ifmatch
      var %text = $did(256,%ln)
      var %value = $did(257,%ln)
      did -d $dname 256 %ln
      did -d $dname 257 %ln
      did -a $dname 258 %text
      did -i $dname 259 $didwm($dname,258,%text,1) %value
    }
  }
  if ($did == 261) {
    while ($did(258,1).sel) {
      var %ln = $ifmatch
      var %text = $did(258,%ln)
      var %value = $did(259,%ln)
      did -d $dname 258 %ln
      did -d $dname 259 %ln
      did -a $dname 256 %text
      did -i $dname 257 $didwm($dname,256,%text,1) %value
    }
  }
  did $iif($did(253).state,-e,-b) $dname 256,258
  did $iif(($did(256,0).sel) && ($did(256).enabled),-e,-b) $dname 260
  did $iif(($did(258,0).sel) && ($did(258).enabled),-e,-b) $dname 261
  return

  ; Display - Whois replies
  :13
  did $iif(($did(271,1).sel == 3) && (!$did(275).state),-e,-b) $dname 274
  did $iif(($did(271,1).sel == 3) && (!$did(274).state),-e,-b) $dname 275
  return

  ; Display - Other
  :14
  if ($devent == sclick) {
    if ($did == 295) .timer -mio 1 0 did -o $dname 295 0 $gettok(hh:nnt*hh:nntt*hh:nnT*hh:nnTT*HH:nn,$did(295).sel,42)
    if ($did == 297) .timer -mio 1 0 did -o $dname 297 0 $gettok(ddd doo mmm yyyy*mmm d $+ $chr(44) yyyy*mm/dd/yy*dd/mm/yy*mm/dd/yyyy*dd/mm/yyyy,$did(297).sel,42)
  }
  return

  ; Popups - Channel
  :17
  did $iif($did(321).state,-c,-u) $dname 362
  var %load
  if (($devent == sclick) && ($did == 326)) %load = 11111111011
  if (($devent == sclick) && ($did == 327)) %load = 01101010100
  if (%load) {
    var %pos = 1
    while (%pos <= 11) {
      did $iif($mid(%load,%pos,1),-c,-u) $dname $calc(309 + %pos)
      inc %pos
    }
  }
  return

  ; Popups - Menubar
  :18
  var %load
  if (($devent == sclick) && ($did == 346)) %load = 1111001111
  if (($devent == sclick) && ($did == 347)) %load = 1010001110
  if (%load) {
    var %pos = 1
    while (%pos <= 10) {
      did $iif($mid(%load,%pos,1),-c,-u) $dname $calc(329 + %pos)
      inc %pos
    }
  }
  return

  ; Popups - Nicklist
  :19
  did $iif($did(362).state,-c,-u) $dname 321
  var %load
  if (($devent == sclick) && ($did == 366)) %load = 001111111111
  if (($devent == sclick) && ($did == 367)) %load = 110011000110
  if (%load) {
    var %pos = 1
    while (%pos <= 12) {
      did $iif($mid(%load,%pos,1),-c,-u) $dname $calc(349 + %pos)
      inc %pos
    }
  }
  return

  ; Popups - Query
  :20
  var %load
  if (($devent == sclick) && ($did == 386)) %load = 01011111101
  if (($devent == sclick) && ($did == 387)) %load = 10101111010
  if (%load) {
    var %pos = 1
    while (%pos <= 11) {
      did $iif($mid(%load,%pos,1),-c,-u) $dname $calc(369 + %pos)
      inc %pos
    }
  }
  return

  ; Popups - Status
  :21
  var %load
  if (($devent == sclick) && ($did == 406)) %load = 11111111111
  if (($devent == sclick) && ($did == 407)) %load = 01111010100
  if (%load) {
    var %pos = 1
    while (%pos <= 11) {
      did $iif($mid(%load,%pos,1),-c,-u) $dname $calc(389 + %pos)
      inc %pos
    }
  }
  return

  ; Popups - @Windows
  :22
  var %load
  if (($devent == sclick) && ($did == 426)) %load = 111001
  if (($devent == sclick) && ($did == 427)) %load = 110100
  if (%load) {
    var %pos = 1
    while (%pos <= 6) {
      did $iif($mid(%load,%pos,1),-c,-u) $dname $calc(409 + %pos)
      inc %pos
    }
  }
  return

  ; Channel options
  :24
  ; Save current options?
  if ((($3) || (($devent == sclick) && (($did == 453) || ($did == 455)))) && ($did(457))) {
    var %opt = $did(431)
    if (%opt !isnum) %opt = 300
    %opt = %opt $mid(1236789,$did(433).sel,1)
    %opt = %opt $mid(1230,$did(435).sel,1)
    %opt = %opt $mid(254361,$did(437).sel,1)
    %opt = %opt $iif($did(442).state,1,0)
    %opt = %opt $iif($did(443).state,1,0)
    %opt = %opt $iif($did(444).state,1,0)
    %opt = %opt $iif($did(445).state,1,0)
    %opt = %opt $iif($did(446).state,1,0)
    %opt = %opt $iif($did(447).state,1,0)
    %opt = %opt $iif($did(448).state,1,0)
    %opt = %opt $iif($did(449).state,1,0)
    %opt = %opt $iif($did(450).state,1,0)
    %opt = %opt $iif($did(451).state,1,0)
    %opt = %opt $iif($did(458).state,1,0)
    did -o $dname 454 $did(457) %opt
    ; Done if just saving (page.apply)
    if ($3) return
  }
  ; Remove selected channel?
  if (($devent == sclick) && ($did == 456)) {
    var %ln = $did(453).sel
    did -d $dname 453 %ln
    did -d $dname 454 %ln
    ; (select default now)
    did -c $dname 453 $didwm($dname,453,$chr(40) $+ *,1)
  }
  ; Add new channel?
  if (($devent == sclick) && ($did == 455)) {
    var %add = $_rentry($chr(35),0,$null,Channel to add?)
    ; Exists? (select)
    if ($_scandid($dname,453,%add)) did -c $dname 453 $ifmatch
    ; Add (and select)
    else {
      did -ac $dname 453 %add
      var %ln = $_scandid($dname,453,%add)
      did -i $dname 454 %ln $hget(pnp.config,chopt)
    }
  }
  ; Load set of options?
  if (($2) || (($devent == sclick) && (($did == 453) || ($did == 455) || ($did == 456)))) {
    var %opt = $did(454,$did(453).sel)
    if (($gettok(%opt,1,32) isnum) && ($ifmatch > 0)) did -ra $dname 431 $ifmatch
    else did -ra $dname 431 300
    did -c $dname 433 $mid(123004567,$gettok(%opt,2,32),1)
    did -c $dname 435 $mid(4123,$calc($gettok(%opt,3,32) + 1),1)
    did -c $dname 437 $mid(614325,$gettok(%opt,4,32),1)
    did $iif($gettok(%opt,5,32),-c,-u) $dname 442
    did $iif($gettok(%opt,6,32),-c,-u) $dname 443
    did $iif($gettok(%opt,7,32),-c,-u) $dname 444
    did $iif($gettok(%opt,8,32),-c,-u) $dname 445
    did $iif($gettok(%opt,9,32),-c,-u) $dname 446
    did $iif($gettok(%opt,10,32),-c,-u) $dname 447
    did $iif($gettok(%opt,11,32),-c,-u) $dname 448
    did $iif($gettok(%opt,12,32),-c,-u) $dname 449
    did $iif($gettok(%opt,13,32),-c,-u) $dname 450
    did $iif($gettok(%opt,14,32),-c,-u) $dname 451
    did $iif($gettok(%opt,15,32),-c,-u) $dname 458
    did -ra $dname 457 $did(453).sel
  }
  did $iif($left($did(453).seltext,1) == $chr(40),-b,-e) $dname 456
  did $iif($did(448).state,-e,-b) $dname 449,450,451
  return

  ; DCC accept
  :25
  return

  ; Favorites
  :26
  ; Add chans/servers
  if (($devent == sclick) && ($did == 476)) {
    var %add = $gettok($did(475,0),1,32)
    if ($_scandid($dname,475,%add)) did -c $dname 475 $ifmatch
    else did -ac $dname 475 %add
  }
  if (($devent == sclick) && ($did == 481)) {
    var %add = $replace($did(480,0),$chr(44),$chr(32),:,$chr(32))
    if (($gettok(%add,2,32) !isnum) && ($gettok(%add,2,32) != $null)) %add = $gettok(%add,1,32) 6667 $gettok(%add,2-,32)
    if ($gettok(%add,3,32) isnum) %add = $gettok(%add,1-2,32)
    if ($gettok(%add,3-,32) != $null) %add = $gettok(%add,1-2,32) $_s2p($gettok(%add,3-,32))
    %add = $replace(%add,$chr(32),:)
    if ($_scandid($dname,480,%add)) did -c $dname 480 $ifmatch
    else did -ac $dname 480 %add
  }
  ; Del/Up/Down chans/servers
  if (($devent == sclick) && ($did isnum 477-479)) {
    var %del = $gettok($did(475,0),1,32)
    if ($_scandid($dname,475,%del)) {
      var %ln = $ifmatch
      did -d $dname 475 $ifmatch
      if ($did == 478) did -ic $dname 475 $iif(%ln <= 1,1,$calc(%ln - 1)) %del
      if ($did == 479) did -ic $dname 475 $iif(%ln > $did(475).lines,%ln,$calc(%ln + 1)) %del
    }
  }
  if (($devent == sclick) && ($did isnum 482-484)) {
    var %del = $replace($did(480,0),$chr(44),:,$chr(32),:)
    if ($_scandid($dname,480,%del)) {
      var %ln = $ifmatch
      did -d $dname 480 $ifmatch
      if ($did == 483) did -ic $dname 480 $iif(%ln <= 1,1,$calc(%ln - 1)) %del
      if ($did == 484) did -ic $dname 480 $iif(%ln > $did(480).lines,%ln,$calc(%ln + 1)) %del
    }
  }
  ; Add/Del networks
  if (($devent == sclick) && ($did == 471)) {
    did -ac $dname 470 $gettok($did(470,0),1,32)
    did -a $dname 487 -
    did -a $dname 488 -
    did -a $dname 489 0 0 - - -
  }
  if (($devent == sclick) && ($did == 472)) {
    var %del = $gettok($did(470,0),1,32)
    if ($_scandid($dname,470,%del)) {
      var %ln = $ifmatch
      did -d $dname 470 %ln
      did -d $dname 487 %ln
      did -d $dname 488 %ln
      did -d $dname 489 %ln
      did -c $dname 470 1
      ; (now there is no current view)
      did -r $dname 512
    }
  }
  ; Display new data if a matching item is selected/entered and it differs from the current view
  ; Also saves data, including from a mod.apply call ($3)
  if (($3) || (($_scandid($dname,470,$did(470,0))) && ($ifmatch != $did(512)))) {
    ; Remembers $3 if that's set, but then %ln is never used.
    var %ln = $ifmatch
    ; Save currently viewed data?
    if ($did(512) isnum) {
      var %chans = -
      var %servs = -
      var %pos = 1
      while ($did(475,%pos)) {
        %chans = %chans $ifmatch
        inc %pos
      }
      %pos = 1
      while ($did(480,%pos)) {
        %servs = %servs $ifmatch
        inc %pos
      }
      var %opts = $iif($did(485).state,1,0) $iif($did(486).state,1,0)
      ; (chan menu? diff option)
      if ($did(512) == 2) {
        if ($did(510) isnum 1-15) %opts = $gettok(%opts,1,32) $ifmatch
        else %otps = $gettok(%opts,1,32) 15
      }
      %opts = %opts $iif($did(463) == $null,-,$gettok($did(463),1,32))
      %opts = %opts $iif($did(465) == $null,-,$gettok($did(465),1,32))
      %opts = %opts $iif($did(467) == $null,-,$gettok($did(467),1,32))
      %opts = %opts $did(469)
      ; Save data
      did -o $dname 487 $did(512) %chans
      did -o $dname 488 $did(512) %servs
      did -o $dname 489 $did(512) %opts
    }
    ; Don't bother displaying anything if $3 true (page.apply)
    if ($3) return
    ; 1 = all, 2 = chan menu, 3+ = networks
    var %chans = $gettok($did(487,%ln),2-,32)
    var %servs = $gettok($did(488,%ln),2-,32)
    var %opts = $did(489,%ln)
    ; Load em in
    did -r $dname 475,480,463,465,467,469
    var %pos = 1
    while ($gettok(%chans,%pos,32)) {
      did -a $dname 475 $ifmatch
      inc %pos
    }
    %pos = 1
    while ($gettok(%servs,%pos,32)) {
      did -a $dname 480 $ifmatch
      inc %pos
    }
    did $iif($gettok(%opts,1,32),-c,-u) $dname 485
    did $iif($gettok(%opts,2,32),-c,-u) $dname 486
    if ($gettok(%opts,2,32) isnum 1-15) did -ra $dname 510 $ifmatch
    else did -ra $dname 510 15
    if (($gettok(%opts,3,32) != -) && ($ifmatch != $null)) did -a $dname 463 $ifmatch
    if (($gettok(%opts,4,32) != -) && ($ifmatch != $null)) did -a $dname 465 $ifmatch
    if (($gettok(%opts,5,32) != -) && ($ifmatch != $null)) did -a $dname 467 $ifmatch
    if ($gettok(%opts,6-,32) != $null) did -a $dname 469 $ifmatch
    ; Text on some of these options and/or hide some
    did -ra $dname 473 $iif(%ln == 2,&Channels menu:,&Add favorite channels:)
    did -ra $dname 485 $iif(%ln == 2,&Auto-fill menu to,&Join on connect)
    did $iif(%ln == 2,-v,-h) $dname 510
    ; (includes disable/enable the Del button)
    did $iif(%ln < 3,-b,-e) $dname 461,462,463,464,465,466,467,468,469,474,480,481,482,483,484,486,472
    ; Current line being displayed
    did -ra $dname 512 %ln
  }
  ; If entered text is not (* and differs from selected view, enable Add button
  did $iif(($left($did(470,0),1) != $chr(40)) && ($gettok($did(470,0),1,32) != $did(470,$did(512))),-e,-b) $dname 471
  ; Add/Del buttons on other two lists
  did $iif(($_scandid($dname,475,$did(475,0))) || (!$_ischan($did(475,0))),-b,-e) $dname 476
  did $iif($_scandid($dname,475,$did(475,0)),-e,-b) $dname 477,478,479
  did $iif(($_scandid($dname,480,$did(480,0))) || (. !isin $did(480,0)),-b,-e) $dname 481
  did $iif($_scandid($dname,480,$did(480,0)),-e,-b) $dname 482,483,484
  did $iif($did(485).state,-e,-b) $dname 510
  ; Set Enter to press appropriate Add button when entering text
  if ($devent == edit) {
    if ($did == 470) did -t $dname 471
    if ($did == 475) did -t $dname 476
    if ($did == 480) did -t $dname 481
  }
  return

  ; Flashing
  :27
  did $iif($did(501).state,-e,-b) $dname 502
  did $iif($did(504).state,-e,-b) $dname 505
  return

  ; Language  
  :28
  if ($readini(script\transup.ini,n,translation,enabled) == no) return
  if ((($devent == dclick) && ($did == 525)) || (($devent == sclick) && ($did == 526))) {
    did -ra $dname 523 $did(525).seltext
  }
  did $iif($did(525,0).sel == 0,-b,-e) $dname 526
  return

  ; Messages
  :29
  ; Save changes to currently selected message? (if showing a new set or new selected msg)
  if (($did(556)) && (($3) || (($devent == sclick) && (($did == 542) || ($did == 544) || ($did == 555))))) {
    ; Save to sub-list
    did -o $dname 553 $gettok($did(556),1,32) $gettok($did(553,$gettok($did(556),1,32)),1-4,32) $did(546)
    ; Save to main list
    did -o $dname 552 $gettok($did(556),2,32) $gettok($did(552,$gettok($did(556),2,32)),1-4,32) $did(546)
    ; Done if just saving (page.apply)
    if ($3) return
  }
  ; Show a different set of messages?
  if (($2) || (($devent == sclick) && (($did == 542) || ($did == 555)))) {
    var %cat = $_s2p($did(542).seltext)
    if ($left(%cat,1) == $chr(40)) %cat = &
    did -r $dname 544,553
    var %num = 1
    :loop29
    %num = $didwm($dname,552,%cat *,%num)
    if (%num) {
      var %data = $did(552,%num)
      if ($did(555).state) did -ac $dname 544 $gettok(%data,5-,32)
      else did -ac $dname 544 $_p2s($gettok(%data,3,32))
      ; (store actual data on each msg in other list, including line in original list to save it to)
      ; (line, codename, longname, params, current setting)
      did -i $dname 553 $did(544).sel %num $gettok(%data,2-,32)
      inc %num
      goto loop29
    }
    did -c $dname 544 1
    did -z $dname 544
  }
  ; Show data for a new selected message?
  if (($2) || (($devent == sclick) && (($did == 542) || ($did == 544) || ($did == 555)))) {
    var %data = $did(553,$did(544).sel)
    did -ra $dname 554 $_p2s($gettok(%data,3,32))
    did -r $dname 546
    did -o $dname 546 0 $replace($gettok(%data,5-,32),$chr(1),&)
    ; Fill with defaults
    var %defs = $read(script\msgdefs.dat,nw,& $gettok(%data,2,32) *)
    %defs = $gettok(%defs,5-,32)
    var %pos = 1
    while ($gettok(%defs,%pos,32)) {
      did -a $dname 546 $_p2s($gettok($ifmatch,-1,124))
      inc %pos
    }
    ; Add 'random' line
    did -a $dname 546
    did -a $dname 546 (random line from text file...)
    ; Remember which lines we're editing
    did -ra $dname 556 $did(544).sel $gettok(%data,1,32)
  }
  ; Load a newly selected default?
  if (($devent == sclick) && ($did == 546)) {
    ; Blank line? revert
    if (($did(546).sel == $null) || ($did(546).sel == $calc($did(546).lines - 1))) msgview.fix $_s2p($did(557))
    ; Random?
    elseif ($did(546).sel == $did(546).lines) {
      _ssplay Question
      var %file = $sfile($mircdir $+ \*.txt,File to take random replies from?)
      if (%file) msgview.fix !Random: $+ %file
      ; (no file- revert)
      else msgview.fix $_s2p($did(557))
    }
    else {
      var %data = $did(553,$did(544).sel)
      var %defs = $read(script\msgdefs.dat,nw,& $gettok(%data,2,32) *)
      var %text = $gettok($gettok(%defs,$calc(4 + $did(546).sel),32),1,124)
      msgview.fix %text
    }
  }
  ; Show preview of current message? (longer wait for typing)
  if ($2) {
    ; Save most recent edit in 557
    did -ra $dname 557 $did(546)
    msgprev.update
  }
  elseif ((($devent == sclick) && (($did == 542) || ($did == 544) || ($did == 546) || ($did == 555))) || ($devent == edit)) {
    ; Save most recent edit in 557 (anytime except when selecting a default)
    if (($did != 546) || ($devent != sclick)) did -ra $dname 557 $did(546)
    .timer.config.msgpreview -mio 1 $iif($devent == edit,1500,500) msgprev.update
  }
  return

  ; Protection
  :30
  if (($devent == sclick) && ($did == 562)) ctcpedit
  did $iif(($did(563).state) || ($did(564).state),-e,-b) $dname 565
  did $iif($did(566).state,-e,-b) $dname 567,569
  did $iif($did(571).state,-e,-b) $dname 572,574
  did $iif($did(576).state,-e,-b) $dname 577,579
  did $iif($did(582).state,-e,-b) $dname 583
  did $iif($did(585).state,-e,-b) $dname 586,588
  return

  ; Serverlist
  :31
  did $iif($did(600).state,-e,-b) $dname 601
  ; Refresh button
  if (($devent == sclick) && ($did == 606)) {
    did -ra $dname 607 1
    did -v $dname 608
  }
  ; Add/del
  if (($devent == sclick) && ($did == 602)) {
    did -ac $dname 601 $gettok($did(601),1,32)
  }
  if (($devent == sclick) && ($did == 603)) {
    var %item = $gettok($did(601),1,32)
    did -d $dname 601 $_scandid($dname,601,%item)
    did -o $dname 601 0 %item
  }
  ; Enter = add button
  if (($devent == edit) && ($did == 601)) did -t $dname 602
  did $iif((!$_scandid($dname,601,$gettok($did(601),1,32))) && ($did(601) != $null) && ($did(600).state),-e,-b) $dname 602
  did $iif(($_scandid($dname,601,$gettok($did(601),1,32))) && ($did(601) != $null) && ($did(600).state),-e,-b) $dname 603
  did $iif((!$did(607)) && ($did(600).state),-e,-b) $dname 606
  return

  ; Titlebar
  :32
  did $iif($did(638).state,-e,-b) $dname 621,622,623,624,625,626,627,628,630,631,632,633,634,635,636,637
  return

  ; Other
  :33
  did $iif(($did(655).state) || ($did(651) != $null) || ($did(653) != $null),-e,-b) $dname 654
  return
}

; Corrects message view to $_p2s($1) using a timer
alias -l msgview.fix { .timer.msgview.fix -mio 1 0 msgview.fix2  $+ $1 }
alias -l msgview.fix2 { did -o pnp.config 546 0 $replace($_p2s($1),$chr(1),&) | did -ra pnp.config 557 $did(pnp.config,546) }

; Update message preview
alias -l msgprev.update {
  if ($dialog(pnp.config) == $null) return
  .timer.msgview.fix -e
  var %torep = $gettok($did(pnp.config,553,$did(pnp.config,544).sel),4,32)
  var %text = $replace($did(pnp.config,546),$chr(1),&)
  if (!Random:* iswm %text) %text = $read($gettok(%text,2-,58),n,1)
  ; Color, Replace codes
  var %dispcol = $gettok(%torep,1,44)
  %text = $msg.compile(%text,&test&,1,&[&,$did(pnp.config,550),&]&,$did(pnp.config,551), [ $+ [ $gettok(%torep,2-,44) ] ] )
  drawrect -f @.msgprev $color(back) 1 0 0 340 22
  if (%text != $null) drawtext -pb @.msgprev $color(%dispcol) $color(back) " $+ $window(Status Window).font $+ " $window(Status Window).fontsize 3 1 $iif(%dispcol == act,* $me) %text
  drawsave @.msgprev script\temp\msgprev.bmp
  did -g pnp.config 548 script\temp\msgprev.bmp
}
