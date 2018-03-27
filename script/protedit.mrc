; #= P&P.temp -rs
; ########################################
; Peace and Protection
; Protection system editing (channel)
; ########################################

; Channel protection config dialog

alias _protedit if ($_ischan($1)) { set -u %.editing $1 | set -u %.create 1 } | elseif (($1 == $null) && ($active ischan)) { set -u %.editing $active | set -u %.create 0 } | _dialog -md chanprot chanprot
dialog chanprot {
  title "Channel Protection"
  icon script\pnp.ico
  option dbu
  size -1 -1 250 175

  list 250, 1 1 1 1, hide

  box "Channel:", 249, 2 2 245 25

  text "&Edit protection for:", 248, 5 13 52 10, right

  combo 247, 60 11 85 100, drop sort

  button "&Add...", 246, 150 11 45 10
  button "&Remove...", 245, 200 11 40 10

  text "&Editing settings for:", 244, 5 34 52 10, right

  combo 243, 60 32 85 100, drop

  box "", 242, 2 45 245 108

  text "User will be punished for:", 33, 7 55 125 8

  text "", 1, 6 67 42 8, right
  combo 2, 50 65 46 60, drop
  edit "", 3, 100 65 20 11
  text "", 4, 121 67 35 8
  text "", 5, 121 67 70 8
  edit "", 6, 156 65 17 11
  text "", 7, 174 67 27 8
  button "&Actions...", 8, 205 65 37 10

  text "", 9, 6 80 42 8, right
  combo 10, 50 78 46 60, drop
  edit "", 11, 100 78 20 11
  text "", 12, 121 80 35 8
  text "", 13, 121 80 70 8
  edit "", 14, 156 78 17 11
  text "", 15, 174 80 27 8
  button "&Actions...", 16, 205 78 37 10

  text "", 17, 6 93 42 8, right
  combo 18, 50 91 46 60, drop
  edit "", 19, 100 91 20 11
  text "", 20, 121 93 35 8
  text "", 21, 121 93 70 8
  edit "", 22, 156 91 17 11
  text "", 23, 174 93 27 8
  button "&Actions...", 24, 205 91 37 10

  text "", 25, 6 106 42 8, right
  combo 26, 50 104 46 60, drop
  edit "", 27, 100 104 20 11
  text "", 28, 121 106 35 8
  text "", 29, 121 106 70 8
  edit "", 30, 156 104 17 11
  text "", 31, 174 106 27 8
  button "&Actions...", 32, 205 104 37 10

  box "Advanced", 34, 3 82 243 5, hide
  check "&Enable mass join flood protection: Temporarily set modes", 35, 8 96 142 8, 3state hide
  edit "", 53, 151 94 20 11, autohs hide
  text "for:", 54, 172 96 10 8, hide
  edit "", 36, 7 105 15 11, hide
  text "percent joins within", 37, 23 107 71 8, hide
  edit "", 38, 94 105 17 11, hide
  text "seconds (min.", 39, 113 107 42 8, hide
  edit "", 40, 155 105 17 11, hide
  text "joins, max.", 41, 173 107 35 8, hide
  edit "", 42, 209 105 17 11, hide
  text "joins)", 43, 227 107 15 8, hide
  check "&Enable channel limit protection: Maintain channel limit of:", 44, 8 126 150 8, 3state hide
  edit "", 45, 7 135 15 11, hide
  text "percent extra, refresh after", 46, 23 137 71 8, hide
  edit "", 47, 94 135 17 11, hide
  text "seconds (min.", 48, 113 137 42 8, hide
  edit "", 49, 155 135 17 11, hide
  text "extra, max.", 50, 173 137 35 8, hide
  edit "", 51, 209 135 17 11, hide
  text "extra)", 52, 227 137 15 8, hide

  check "&Detect bans against you", 55, 50 93 67 8, 3state hide
  check "&Ignore bans of *!*@*", 56, 122 93 65 8, 3state hide
  check "&Detect clones only if same ident", 57, 50 105 100 8, 3state hide
  check "&Deop unrecognized users who become opped", 58, 50 117 125 8, 3state hide
  check "&Deop unrecognized users opped by a server", 59, 50 129 125 8, 3state hide

  text "r", 60, 1 1 1 1, hide

  check "&One topic equals", 61, 35 119 65 8, 3state hide
  edit "", 62, 100 117 20 11, hide
  text "lines", 63, 121 119 50 8, hide
  check "&Sound requests equal", 64, 35 131 65 8, 3state hide
  edit "", 65, 100 130 20 11, hide
  text "lines", 66, 121 132 50 8, hide

  text "r", 67, 1 1 1 1, hide

  check "&Invalid DCC protection enabled", 68, 50 92 100 8, 3state hide
  check "&CTCPs will actually be 'counted' as this many CTCPs for flood detection:", 69, 7 108 177 8, 3state hide
  text "PING:", 70, 17 119 22 8, hide
  text "ECHO:", 71, 17 130 22 8, hide
  text "TIME:", 72, 17 141 22 8, hide
  text "VERSION:", 73, 62 119 35 8, hide
  text "USERINFO:", 74, 62 130 35 8, hide
  text "CLIENTINFO:", 75, 62 141 35 8, hide
  text "SOUND:", 76, 125 119 25 8, hide
  text "XDCC:", 77, 125 130 25 8, hide
  text "DCC:", 78, 125 141 25 8, hide
  text "FINGER:", 79, 177 119 25 8, hide
  text "Other:", 80, 177 130 25 8, hide
  text "Replies:", 81, 177 141 25 8, hide
  edit "", 82, 35 117 20 11, hide
  edit "", 83, 35 128 20 11, hide
  edit "", 84, 35 139 20 11, hide
  edit "", 85, 97 117 20 11, hide
  edit "", 86, 97 128 20 11, hide
  edit "", 87, 97 139 20 11, hide
  edit "", 88, 150 117 20 11, hide
  edit "", 89, 150 128 20 11, hide
  edit "", 90, 150 139 20 11, hide
  edit "", 91, 202 117 20 11, hide
  edit "", 92, 202 128 20 11, hide
  edit "", 93, 202 139 20 11, hide

  check "&Detect mode of +l 1", 94, 50 119 153 8, 3state hide
  button "&Actions...", 96, 205 117 37 10, hide
  check "&Detect two or more of: +k, +l, and +i, set in one line", 95, 50 131 153 8, 3state hide
  button "&Actions...", 97, 205 130 37 10, hide

  check "&Enable word 'kicks', group one", 98, 50 66 85 8, 3state hide
  button "&Words...", 99, 137 65 50 10, hide
  check "&Enable word 'kicks', group two", 100, 50 79 85 8, 3state hide
  button "&Words...", 101, 137 78 50 10, hide
  check "&Scan users for 'bad' channels", 102, 50 92 85 8, 3state hide
  button "&Channels...", 103, 137 91 50 10, hide

  check "&Enforce bans (kick any non-op who is banned)", 118, 50 55 125 8, 3state hide
  check "&Ops immune from text protections", 119, 50 66 125 8, 3state hide
  check "&Halfops immune from text protections", 121, 50 75 127 8, 3state hide
  check "&Voiced users immune from text protections", 120, 50 84 125 8, 3state hide
  check "&Text protections enabled (according to settings)", 109, 50 95 150 8, 3state hide
  check "&CTCP/DCC protections enabled (according to settings)", 110, 50 104 150 8, 3state hide
  check "&All other protections enabled (according to settings)", 111, 50 113 150 8, 3state hide
  text "&Allow", 112, 57 126 15 8, hide
  edit "", 113, 72 124 20 11, hide
  text "seconds before moving to next action", 114, 95 126 125 8, hide
  text "&Wait", 115, 57 138 15 8, hide
  edit "", 116, 72 136 20 11, hide
  text "seconds before resetting to first action", 117, 95 138 125 8, hide

  text "(note- attributes include colors, bold, underline, etc)", 122, 40 117 150 8, hide

  button "OK", 241, 15 158 27 12, OK default
  button "Cancel", 240, 50 158 27 12, cancel
  button "&Help", 239, 85 158 27 12, disable

  edit "", 238, 1 1 1 1, hide autohs
  edit "", 235, 1 1 1 1, hide autohs
  edit "", 234, 1 1 1 1, hide autohs

  text "Note:", 236, 130 160 17 10, right
  check "= use global default settings", 237, 150 160 100 8, 3state
}
on *:DIALOG:chanprot:init:*:{
  did -cu chanprot 237
  did -a chanprot 250 * $hget(pnp.config,cflags)
  did -ac chanprot 247 ( $+ Default settings $+ )

  window -hl @.chanprot
  filter -fw $_cfg(cfgvar.dat) @.chanprot cflags.*
  var %chan,%num = 1
  :loop1
  if ($line(@.chanprot,%num)) {
    %chan = $right($gettok($ifmatch,1,32),-7)
    if (%.editing == %chan) { did -ac chanprot 247 %chan | unset %.editing }
    else did -a chanprot 247 %chan
    did -a chanprot 250 %chan $gettok($line(@.chanprot,%num),2-,32)
    inc %num | goto loop1
  }
  window -c @.chanprot
  if ((%.editing) && (%.create)) {
    did -ac chanprot 247 %.editing
    did -a chanprot 250 %.editing $_p2s($str(?,80))
  }

  unset %.editing %.create

  %num = 2
  :loop2
  loadbuf -otprotlvl chanprot %num script\dlgtext.dat
  if (%num < 26) { inc %num 8 | goto loop2 }

  loadbuf -otprotcat chanprot 243 script\dlgtext.dat

  if ($_dlgi(chanprot) isnum) %num = $ifmatch
  else %num = 7
  _findcurrsel
  did -c chanprot 243 %num
  _showsetn %num
  _loadother
}
on *:DIALOG:chanprot:sclick:241:{
  _dlgw chanprot $did(243).sel
  ; save settings, remove any channels that were deleted
  _saveother
  _saveset

  `set cflags $gettok($did(250,1),2-,32)

  window -hl @.chanprot
  filter -fw $_cfg(cfgvar.dat) @.chanprot cflags.*
  var %doing,%filter,%chan,%num = 2
  :loop1
  if ($did(250,%num) != $null) {
    %chan = cflags. $+ $gettok($ifmatch,1,32)
    if ($gettok($ifmatch,2-,32) != $_p2s($str(?,80))) {
      `set %chan $gettok($did(250,%num),2-,32)
      %chan = %chan *
      %filter = $fline(@.chanprot,%chan,0)
      :loop1b
      if (%filter) {
        if ($gettok($line(@.chanprot,$fline(@.chanprot,%chan,%filter)),1,32) == $gettok(%chan,1,32)) dline @.chanprot $fline(@.chanprot,%chan,%filter)
        else { dec %filter | goto loop1b }
      }
    }
    else `set %chan
    inc %num |  goto loop1
  }

  window -hl @.actions
  loadbuf @.actions $_cfg(actions.dat)

  :loop2
  if ($line(@.chanprot,1) != $null) {
    %chan = $gettok($ifmatch,1,32)
    `set %chan
    %chan = $right(%chan,-7)
    `set wordk1. $+ %chan
    `set wordk2. $+ %chan
    `set pervscan. $+ %chan

    %doing = * $+ %chan *
    %filter = $fline(@.actions,%doing,0)
    :loop2b
    if (%filter) {
      if ($right($gettok($line(@.actions,$fline(@.actions,%doing,%filter)),1,32),$len(%chan)) == %chan) dline @.actions $fline(@.actions,%doing,%filter)
      dec %filter | goto loop2b
    }

    dline @.chanprot 1
    goto loop2
  }

  savebuf @.actions $_cfg(actions.dat)
  close -@ @.actions @.chanprot
  _upd.prot

  _unload protedit
}
on *:DIALOG:chanprot:sclick:240:_unload protedit
on *:DIALOG:chanprot:sclick:237:did -cu chanprot 237
on *:DIALOG:chanprot:sclick:243:_saveset | _showsetn $did($did).sel
on *:DIALOG:chanprot:sclick:247:{
  _saveother
  _saveset
  _findcurrsel
  _showset $did(238)
  _loadother
}
alias -l _findcurrsel {
  if ($left($did(chanprot,247,$did(chanprot,247).sel),1) == $chr(40)) {
    did -c chanprot 250 1
    did -o chanprot 235 1 *
  }
  else {
    did -o chanprot 235 1 $did(chanprot,247,$did(chanprot,247).sel)
    var %num = 1
    :loop
    if ($gettok($did(chanprot,250,%num),1,32) == $did(chanprot,235)) did -c chanprot 250 %num
    else { inc %num |  goto loop }
  }
  did -o chanprot 234 1 $gettok($did(chanprot,250,$did(chanprot,250).sel),2-,32)
}
on *:DIALOG:chanprot:sclick:96:_pae model $did(235)
on *:DIALOG:chanprot:sclick:97:_pae tover $did(235)
on *:DIALOG:chanprot:sclick:99:_wcled wordk1. $did(235) Word
on *:DIALOG:chanprot:sclick:101:_wcled wordk2. $did(235) Word
on *:DIALOG:chanprot:sclick:103:_wcled pervscan. $did(235) Channel
on *:DIALOG:chanprot:sclick:246:_saveother | _saveset | _cpar a
on *:DIALOG:chanprot:sclick:245:_saveother | _saveset | _cpar r
alias -l _cpar {
  if ($1 == r) {
    if ($did(chanprot,235) == *) _error You cannot delete the default settings.
    _okcancel 1 Delete channel-specific settings for $did(chanprot,235) $+ ?
    did -d chanprot 247 $did(chanprot,247).sel
    did -d chanprot 250 $did(chanprot,250).sel
    did -c chanprot 247 $did(chanprot,247).lines
    _findcurrsel
  }
  else {
    var %newchan = $_rentry($chr(35),0,$active,New channel to edit protection settings for?)
    if (!$_ischan(%newchan)) _error That is not a valid channel name.
    var %num = $did(chanprot,250).lines
    :loop1
    if ($gettok($did(chanprot,250,%num),1,32) == %newchan) _error That channel already has protection settings.Select it from the drop-down menu to edit the settings.
    elseif (%num > 1) { dec %num |  goto loop1 }
    if ($did(chanprot,247).lines == 1) var %basedon = ( $+ Default settings $+ )
    else {
      _ssplay Question
      var %basedon = $$dialog(paddchan,paddchan,-4)
    }
    if ($left(%basedon,1) == $chr(40)) %basedon = $_p2s($str(?,80))
    else {
      %num = 1
      :loop2
      if ($gettok($did(chanprot,250,%num),1,32) == %basedon) %basedon = $gettok($did(chanprot,250,%num),2-,32)
      else { inc %num |  goto loop2 }
    }
    did -ac chanprot 247 %newchan
    did -ac chanprot 250 %newchan %basedon
    did -o chanprot 235 1 %newchan
    did -o chanprot 234 1 %basedon
  }
  _showset $did(chanprot,238)
  _loadother
}
on *:DIALOG:chanprot:sclick:*:{
  if ($did < 1) return
  if (($did($did).state == 2) && ($did(235) == *)) did -u chanprot $did
  var %from,%where
  if ($did < 33) {
    if (8 // $did) {
      ; Punishments button
      %from = $gettok($did(238),$calc($did / 8 + 1),32)
      _pae $gettok(%from,$numtok(%from,44),44) $did(235)
    }
    else {
      ; Pre-set values
      %where = $calc($did - ($did % 8) + 3)
      %from = $gettok($did(238),$calc($int($calc($did / 8)) + 2),32)
      if ($did($did).sel == 1) { did -on chanprot %where 1 0 | did -on chanprot $calc(%where + 3) 1 0 }
      elseif ($did($did).sel < 5) {
        did -on chanprot %where 1 $gettok(%from,$calc(2 + $did($did).sel * 2),44)
        did -on chanprot $calc(%where + 3) 1 $gettok(%from,$calc(3 + $did($did).sel * 2),44)
      }
      elseif ($did($did).sel == 6) {
        did -om chanprot %where 1 $gettok($did(250,1),$calc($gettok(%from,2,44) + 1),32)
        did -om chanprot $calc(%where + 3) 1 $gettok($did(250,1),$calc($gettok(%from,4,44) + 1),32)
      }
      else did -n chanprot %where $+ , $+ $calc(%where + 3)
    }
  }
  elseif ($did == 69) _sclicktrigset 69 33,34,35,36,37,38,39,40,41,42,43,44 82,83,84,85,86,87,88,89,90,91,92,93
  elseif ($did == 35) _sclicktrigset 35 3,60,63,61,62 53,36,38,40,42
  elseif ($did == 44) _sclicktrigset 44 65,68,66,67 45,47,49,51
  elseif ($did == 61) _sclicktrigset 61 20 62
  elseif ($did == 64) _sclicktrigset 64 21 65
}
on *:DIALOG:chanprot:edit:*:if ($did < 30) did -c chanprot $calc($did - ($did % 8) + 2) 5
alias -l _sclicktrigset {
  var %num = $numtok($2,44)
  :loop
  did $iif($did($1).state != 1,-m,-n) $+ $iif($did(235) != *,o) chanprot $gettok($3,%num,44) 1 $gettok($did(250,1),$calc(1 + $gettok($2,%num,44)),32)
  if (%num > 1) { dec %num | goto loop }
}
alias -l _showsetn {
  if ($1 == 1) _showset 98-103 wordk1 wordk2 pervscan
  elseif ($1 == 2) _showset 68-93 Onesite $+ :,29,CTCPs,30,seconds,6,15,4,15,3,20,ctcp Allsites $+ :,31,CTCPs,32,seconds,8,5,6,8,4,10,allc invdcc
  elseif ($1 == 3) _showset 34-54 Joining/parting:,57,joins/parts,58,seconds,6,10,5,15,4,20,joinp
  elseif ($1 == 4) _showset 55-59 Nickflood:,4,nickchanges,5,seconds,5,10,4,15,3,15,nick Clones:,1,maxusersfromonesite,0,0,4,-,3,-,2,-,clones banyou
  elseif ($1 == 5) _showset 109-121
  elseif ($1 == 6) _showset 94-97 Massdeop:,46,deops,47,seconds,7,10,5,10,3,10,deop Masskick:,48,kicks,49,seconds,8,10,6,10,4,10,kick Massban:,50,bannedusers,51,seconds,8,8,6,8,4,8,mbanu Massban:,52,bans,53,seconds,9,8,6,8,3,8,mbanb
  elseif ($1 == 7) _showset 61-66 Textflood:,6,bytes,7,seconds,2000,8,1200,10,750,12,text Textscroll:,8,lines,9,seconds,10,10,8,12,6,12,scroll Repeating:,10,repeats,11,seconds,4,60,3,120,2,180,repeat Noticeflood:,12,lines,13,seconds,5,15,4,20,3,30,notice
  else _showset 122 Toomanycaps:,14,percentof,15,letters,90,30,80,20,60,10,caps Attributeflood:,17,attributes,18,seconds,250,10,150,15,75,20,attrfl Attributeabuse:,19,attributesinoneline,0,0,100,-,50,-,20,-,attrab
}
alias -l _showset {
  var %todo,%bit,%opt,%sec,%flags = $did(chanprot,234),%defflags = $gettok($did(chanprot,250,1),2-,32),%num = 2,%where = 1

  if ($did(chanprot,235) == *) did -h chanprot 236,237
  else did -v chanprot 236,237

  %num = 2 | %where = 1
  :loop1
  %todo = $ [ $+ [ %num ] ]
  if ($numtok(%todo,44) > 1) {
    if ($did(chanprot,235) == *) { if ($did(chanprot,$calc(%where + 1)).lines > 5) did -d chanprot $calc(%where + 1) 6 }
    else { if ($did(chanprot,$calc(%where + 1)).lines < 6) did -a chanprot $calc(%where + 1) Global default }

    %bit = $gettok($did(chanprot,234),$gettok(%todo,2,44),32)
    if ($gettok(%todo,4,44)) %sec = $gettok($did(chanprot,234),$ifmatch,32)
    else %sec = -

    if ((%bit == 0) || (%sec == 0)) { %bit = 0 | %sec = 0 | %opt = 1 }
    elseif ((%bit == ?) || (%sec == ?)) { %opt = 6 | %bit = $gettok($gettok($did(chanprot,250,1),2-,32),$gettok(%todo,2,44),32) | %sec = $gettok($gettok($did(chanprot,250,1),2-,32),$gettok(%todo,4,44),32) }
    elseif ((%bit == $gettok(%todo,6,44)) && (%sec == $gettok(%todo,7,44))) %opt = 2
    elseif ((%bit == $gettok(%todo,8,44)) && (%sec == $gettok(%todo,9,44))) %opt = 3
    elseif ((%bit == $gettok(%todo,10,44)) && (%sec == $gettok(%todo,11,44))) %opt = 4
    else %opt = 5

    did -va chanprot %where & $+ $_p2s($gettok(%todo,1,44))
    did -vc chanprot $calc(%where + 1) %opt
    did -vo $+ $iif(%opt == 6,m,n) chanprot $calc(%where + 2) 1 %bit
    if ($gettok(%todo,4,44)) {
      did -va chanprot $calc(%where + 3) $_p2s($gettok(%todo,3,44))
      did -h chanprot $calc(%where + 4)
      did -vo $+ $iif(%opt == 6,m,n) chanprot $calc(%where + 5) 1 %sec
      did -va chanprot $calc(%where + 6) $_p2s($gettok(%todo,5,44))
    }
    else {
      did -h chanprot $calc(%where + 3) $+ , $+ $calc(%where + 5) $+ , $+ $calc(%where + 6)
      did -va chanprot $calc(%where + 4) $_p2s($gettok(%todo,3,44))
    }
    did -v chanprot $calc(%where + 7)
    inc %where 8
  }
  else {
    :loop2 | did -h chanprot %where | if (8 \\ %where) { inc %where | goto loop2 } | inc %where
    if (%todo) did -v chanprot $calc(%where - 1)
  }
  if (%where < 32) { inc %num | goto loop1 }

  did $iif($numtok($2,44) > 1,-v,-h) chanprot 33

  %where = $gettok($did(chanprot,238),1,32)
  did -o chanprot 238 1 $1-

  if (%where == $1) return
  if (%where) _bulkdid -h chanprot $replace(%where,-,$chr(32))
  if ($1) _bulkdid -v chanprot $replace($1,-,$chr(32))
}
alias -l _saveset {
  var %todo,%bit,%sec,%num = 2,%where = 1,%flags = $did(234)

  :loop
  %todo = $gettok($did(238),%num,32)
  if ($numtok(%todo,44) > 1) {
    %bit = $calc($did($calc(%where + 2)))
    if ($gettok(%todo,4,44)) {
      %sec = $calc($did($calc(%where + 5)))
      if ($did($calc(%where + 1)).sel == 6) { %bit = ? | %sec = ? }
      elseif ((%bit == 0) || (%sec == 0)) { %bit = 0 | %sec = 0 }
      %flags = $puttok($puttok(%flags,%bit,$gettok(%todo,2,44),32),%sec,$gettok(%todo,4,44),32)
    }
    else {
      if ($did($calc(%where + 1)).sel == 6) %bit = ?
      %flags = $puttok(%flags,%bit,$gettok(%todo,2,44),32)
    }
  }
  if (%num < 5) { inc %where 8 | inc %num | goto loop }
  did -o chanprot 234 1 %flags
  did -oc chanprot 250 $did(250).sel $did(235) %flags
}
alias -l _loadother {
  ; Checkboxes
  var %bit,%num = 1
  :loop
  %bit = $gettok($did(chanprot,234),$gettok(24 25 22 74 54 55 45 56 2 69 70 71 72 73 77 78 23 80,%num,32),32)
  did $iif(%bit == ?,-cu,$iif(%bit == 1,-c,-u)) chanprot $gettok(98 100 102 68 94 95 55 56 57 119 120 109 110 111 58 59 118 121,%num,32)
  if (%num < 18) { inc %num | goto loop }

  ; Checkboxes with associated editboxs
  _loadtrigset 28 69 33,34,35,36,37,38,39,40,41,42,43,44 82,83,84,85,86,87,88,89,90,91,92,93
  _loadtrigset 59 35 3,60,63,61,62 53,36,38,40,42
  _loadtrigset 64 44 65,68,66,67 45,47,49,51
  _loadtrigset 20 61 20 62
  _loadtrigset 21 64 21 65

  ; Misc
  if ($gettok($did(chanprot,234),75,32) != ?) did -o chanprot 113 1 $ifmatch
  else did -o chanprot 113 1 $gettok($did(chanprot,250,1),76,32)
  if ($gettok($did(chanprot,234),76,32) != ?) did -o chanprot 116 1 $ifmatch
  else did -o chanprot 116 1 $gettok($did(chanprot,250,1),77,32)
}
alias -l _loadtrigset {
  var %use,%bit,%todo
  if ($gettok($did(chanprot,234),$1,32) == ?) { did -cu chanprot $2 | %use = $gettok($did(chanprot,250,1),2-,32) | %bit = m }
  elseif ($gettok($did(chanprot,234),$1,32) == 0) { did -u chanprot $2 | %use = $did(chanprot,234) | %bit = m }
  else { did -c chanprot $2 | %use = $did(chanprot,234) | %bit = n }
  var %num = $numtok($3,44)
  :loop
  %todo = $gettok(%use,$gettok($3,%num,44),32)
  if (%todo == ?) %todo = $gettok($did(chanprot,250,1),$calc(1 + $gettok($3,%num,44)),32)
  did -o $+ %bit chanprot $gettok($4,%num,44) 1 $_p2s(%todo)
  if (%num > 1) { dec %num | goto loop }
}
alias -l _saveother {
  ; save other settings
  var %bit,%num = 1
  %.flags = $did(234)

  ; Checkboxes
  %num = 1
  :loop
  %bit = $did($gettok(98 100 102 68 94 95 55 56 57 119 120 109 110 111 58 59 118 121,%num,32)).state
  if (%bit == 2) %bit = ?
  %.flags = $puttok(%.flags,%bit,$gettok(24 25 22 74 54 55 45 56 2 69 70 71 72 73 77 78 23 80,%num,32),32)
  if (%num < 18) { inc %num | goto loop }

  ; Checkboxes with associated editboxs
  _savetrigset 28 69 33,34,35,36,37,38,39,40,41,42,43,44 82,83,84,85,86,87,88,89,90,91,92,93
  _savetrigset 59 35 3,60,63,61,62 53,36,38,40,42
  _savetrigset 64 44 65,68,66,67 45,47,49,51
  _savetrigset2 61 62 20
  _savetrigset2 64 65 21

  ; Misc
  if ($did(235) == *) { %bit = $iif($did(113) isnum,$did(113),6) | %num = $iif($did(116) isnum,$did(116),300) }
  else {
    %bit = $iif(($did(113) isnum) && ($did(113) != $gettok($did(chanprot,250,1),76,32)),$did(113),?)
    %num = $iif(($did(116) isnum) && ($did(116) != $gettok($did(chanprot,250,1),77,32)),$did(116),?)
  }

  %.flags = $puttok($puttok(%.flags,%bit,75,32),%num,76,32)

  did -o chanprot 234 1 %.flags
  did -oc chanprot 250 $did(250).sel $did(235) %.flags
  unset %.flags
}
alias -l _savetrigset {
  if ($did($2).state == 2) var %bit = ?
  else var %bit = $did($2).state
  %.flags = $puttok(%.flags,%bit,$1,32)
  var %num = $numtok($3,44)
  :loop
  if ($did($2).state == 2) %bit = ?
  else %bit = $did($gettok($4,%num,44))
  if ($gettok($4,%num,44) == 53) { %bit = $_s2p(%bit) | if (%bit == $null) %bit = + }
  elseif (%bit !isnum) { if ($did(235) == *) %bit = 0 | else %bit = ? }
  %.flags = $puttok(%.flags,%bit,$gettok($3,%num,44),32)
  if (%num > 1) { dec %num | goto loop }
}
alias -l _savetrigset2 {
  if ($did($1).state == 0) var %bit = 0
  elseif ($did($1).state == 2) var %bit = ?
  elseif ($did($2) isnum) var %bit = $did($2)
  else var %bit = 1
  %.flags = $puttok(%.flags,%bit,$3,32)
}

; Punishment editing
alias -l _pae {
  set -u %.protect $1 | set -u %.chan $2
  _dialog -am protact protact
}
dialog protact {
  title "Protection Actions (Punishments)"
  icon script\pnp.ico
  option dbu
  size -1 -1 142 117

  text "&Actions: (used successively for repeat violators)", 1, 2 2 125 10

  list 2, 2 12 100 75
  list 3, 2 12 100 75, hide disable

  button "&Edit...", 4, 105 11 35 12, default
  button "&Add...", 5, 105 27 35 12
  button "&Del", 6, 105 43 35 12
  button "&Up", 7, 105 59 35 12
  button "&Down", 8, 105 75 35 12

  check "&Use global default actions", 9, 5 89 100 10

  button "OK", 10, 2 102 35 12, OK
  button "Cancel", 11, 67 102 35 12, cancel

  edit "", 12, 1 1 1 1, hide autohs
}
on *:DIALOG:protact:sclick:10:{
  window -hl @.actions
  loadbuf @.actions $_cfg(actions.dat)
  var %doing,%filter,%num = 1
  :loop1
  %doing = $gettok($did(12),1,32) $+ %num $+ $gettok($did(12),2,32) *
  %filter = $fline(@.actions,%doing,0)
  :loop1b
  if (%filter) {
    if ($gettok($line(@.actions,$fline(@.actions,%doing,%filter)),1,32) == $gettok(%doing,1,32)) { dline @.actions $fline(@.actions,%doing,%filter) | inc %num | goto loop1 }
    dec %filter | goto loop1b
  }
  %num = 1
  if (($did(9).state == 0) || ($gettok($did(12),2,32) == *)) {
    :loop2
    if ($did(2,%num)) {
      aline @.actions $gettok($did(12),1,32) $+ %num $+ $gettok($did(12),2,32) $_convact1($gettok($ifmatch,1,32)) $_convact2($gettok($ifmatch,2,32)) $right($left($gettok($ifmatch,3-,32),-1),-1)
      inc %num | goto loop2
    }
  }
  savebuf @.actions $_cfg(actions.dat)
  window -c @.actions
}
on *:DIALOG:protact:init:*:{
  did -a protact 12 %.protect %.chan

  if (%.chan == *) { 
    _loadpa %.protect * 2
    did -cb protact 9
  }
  else {
    _loadpa %.protect %.chan 2 | _loadpa %.protect * 3
    if ($read($result,tns,%.protect $+ 1 $+ %.chan) == $null) { _visprota -h -v -b | did -c protact 9 }
  }

  unset %.protect %.chan
}
alias -l _loadpa {
  var %num = 1,%file = $_cfg(actions.dat)

  did -r protact $3
  :loop
  if ($read(%file,tns,$1 $+ %num $+ $2) != $null) {
    did -a protact $3 $_dispact($ifmatch)
    inc %num | goto loop
  }

  return %file
}
alias -l _dispact tokenize 32 $1- | return $gettok(* mode+i mode+m mode+im warn warn-chan warn-self warn-ops warn-msg,$1,32) $gettok((custom) bk bk0 bk2 cb deop fk kick tempban warn warn-chan warn-self warn-ops warn-msg,$2,32) " $+ $3- $+ "
alias -l _convact1 return $findtok(* mode+i mode+m mode+im warn warn-chan warn-self warn-ops warn-msg,$1,1,32)
alias -l _convact2 return $findtok((custom) bk bk0 bk2 cb deop fk kick tempban warn warn-chan warn-self warn-ops warn-msg,$1,1,32)
alias -l _visprota did $1 protact 2 | did $2 protact 3 | did $3 protact 4,5,6,7,8
on *:DIALOG:protact:sclick:9:{
  if ($did(9).state) _visprota -h -v -b
  else _visprota -v -h -e
}
on *:DIALOG:protact:dclick:2:_paed e
on *:DIALOG:protact:sclick:4:_paed e
on *:DIALOG:protact:sclick:5:_paed a
on *:DIALOG:protact:sclick:6:if ($did(protact,2).sel isnum) did -d protact 2 $ifmatch
on *:DIALOG:protact:sclick:7:if ($did(protact,2).sel > 1) { did -i protact 2 $calc($ifmatch + 1) $did(protact,2,$calc($ifmatch - 1)) | did -d protact 2 $calc($ifmatch - 1) }
on *:DIALOG:protact:sclick:8:if (($did(protact,2).sel) && ($did(protact,2).sel < $did(protact,2).lines)) { did -i protact 2 $ifmatch $did(protact,2,$calc($ifmatch + 1)) | did -d protact 2 $calc($ifmatch + 2) }
alias -l _paed {
  set %.protect $gettok($did(protact,12),1,32)
  if ($1 == e) {
    set %.toedit $$did(protact,2,$did(protact,2).sel)
    _ssplay Dialog
    did -oc protact 2 $did(protact,2).sel $$dialog(paedit,paedit,-4)
  }
  else {
    set %.toedit * kick ""
    _ssplay Dialog
    if ($did(protact,2).sel isnum) did -ic protact 2 $calc($did(protact,2).sel + 1) $$dialog(paedit,paedit,-4)
    else did -ac protact 2 $$dialog(paedit,paedit,-4)
  }
}

dialog paedit {
  title "Action (Punishment)"
  icon script\pnp.ico
  option dbu
  size -1 -1 130 102
  text "&Action to perform on offender:", 1, 2 2 100 10
  combo 2, 2 12 125 75, drop
  text "&Message for action: (recommended)", 3, 2 27 100 10
  edit "", 4, 2 37 125 11, autohs
  text "&Second action to perform: (optional)", 5, 2 52 100 10
  combo 6, 2 62 125 75, drop
  button "OK", 7, 5 85 35 12, OK
  button "Cancel", 8, 47 85 35 12, cancel
  button "&Help", 9, 90 85 35 12, disable
  edit "", 10, 1 1 1 1, hide result autohs
  edit "", 12, 1 1 1 1, hide autohs
  edit "", 13, 1 1 1 1, hide autohs
}
on *:DIALOG:paedit:init:*:{
  did -o paedit 12 1 %.protect
  loadbuf -otpunish1 paedit 2 script\dlgtext.dat
  loadbuf -otpunish2 paedit 6 script\dlgtext.dat
  did -c paedit 2 $_convact2($gettok(%.toedit,2,32))
  did -c paedit 6 $_convact1($gettok(%.toedit,1,32))
  did -a paedit 4 $right($left($gettok(%.toedit,3-,32),-1),-1)
  if ($did(4) == $null) did -o paedit 4 1 $read(script\punish2.dat,ts,$did(12))
  did -o paedit 13 1 $mid(ckkkkdkkknwsw,$did(2).sel,1)
  if ($did(13) == d) { did -b paedit 3 | did -br paedit 4 }
  unset %.protect %.toedit
}
on *:DIALOG:paedit:sclick:2:{
  var %categ = $mid(ckkkkdkkknwswn,$did(2).sel,1)
  if (%categ != $did(13)) {
    did -a paedit 3 $iif(%categ == c,Command to perform:,Message for action: $chr(40) $+ recommended $+ $chr(41))
    did -o paedit 13 1 %categ
    if (%categ == d) { did -b paedit 3 | did -br paedit 4 | return }
    did -e paedit 3,4
    did -o paedit 4 1 $_protwarnmsg(%categ,$did(12))
  }
}
on *:DIALOG:paedit:sclick:7:{
  if (($did(4)) && ($did(2).sel != 6)) did -a paedit 10 $_dispact($did(6).sel,$did(2).sel,$did(4))
  else did -a paedit 10 $_dispact($did(6).sel,$did(2).sel)
}
