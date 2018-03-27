; #= P&P -a
; **********************
; Unsorted routines
; **********************

;;;###*** Not yet divided- interfaces to temporarily load ***###;;;

; Load and unload temp scripts
_load if ($script($1.mrc) == $null) .load -rs $+ $calc($script(0) - 2) "script\ $+ $1.mrc" | $2-
_unload if ($script($1.mrc)) .timer -mio 1 0 .unload -rs " $+ $ifmatch $+ "

bug _load register _bug $1-
feedback bug 2
donate _load register _donate $1-
about _load register _about $1-
wizard _load firstime _firsttime $1-
config _load config _config $1-
cfg _load config _config $1-
popups config 17
awaycfg config 2
msgs config 29
textopt config 11
protedit _load protedit _protedit $1-

;;;###*** Not yet divided ***###;;;

inv invite $1-
invite {
  if ($2) {
    if ($_ischan($1)) invite $_nc($2) $1
    else invite $_nc($1) $2
  }
  elseif ($active ischan) {
    if ($1) invite $_nc($1) $active
    else invite $_entry(-1,$null,User to invite to $active $+ ?) $active
  }
  elseif ($query($active) == $active) {
    if ($1) invite $active $1
    else invite $active $_rentry($chr(35),0,$chan(1),Invite $active to what channel?)
  }
  elseif (=* iswm $active) {
    if ($1) invite $right($active,-1) $1
    else invite $right($active,-1) $_rentry($chr(35),0,$chan(1),Invite $right($active,-1) to what channel?)
  }
  else _qhelp /invite
}

who if ($1 != $null) who $1- | else _qhelp /who

myver {
  if ($hget(pnp,addon.ids) == $null) me is using Peace and Protection $:ver by pai
  else me is using Peace and Protection $:ver by pai
  say Peace and Protection homepage- $:www
}
p&p myver
pnp myver

;
; Recent list trackers (not actively kept sync'd with other mircs)
;

; _recent type max# token value
; only first token using 'token' ascii as sep is compared in determining dupes. (0 works for 'all')
_recent {
  if ($4 == $null) return
  var %num = 2,%file = $_cfg($1.rct)
  window -hl @.recent
  aline @.recent $4-
  if ($exists(%file)) loadbuf @.recent %file
  %= [ $+ [ $1. ] $+ [ 1 ] ] = $4-
  :loop
  if ($gettok($line(@.recent,%num),1,$3) != $gettok($4-,1,$3)) { %= [ $+ [ $1. ] $+ [ %num ] ] = $line(@.recent,%num) | inc %num }
  else dline @.recent %num
  if ((%num <= $2) && (%num <= $line(@.recent,0))) goto loop
  savebuf 1- $+ $2 @.recent %file
  window -c @.recent
  %= [ $+ [ $1.clr ] ] = Clear this list
}
; _recclr type
_recclr unset %= $+ $1.* | _broadcastp unset % $+ = $+ $1.* | .remove $_cfg($1.rct)
; $_rec(type,#)
_rec if (%= [ $+ [ $1. ] $+ [ $2 ] ] ) return $2. $left($replace($ifmatch,&,&&),40) $+ $iif($len($ifmatch) > 40,...) | return
_rechash {
  window -hl @.recent
  unset %=*
  var %dir = $mircdirconfig\ $+ $hget(pnp,user) $+ \
  %dir = $findfile(%dir,*.rct,0,_rechash2 $1-)
  window -c @.recent
}
_rechash2 {
  clear @.recent
  loadbuf @.recent " $+ $1- $+ "
  :loopN
  %= [ $+ [ $replace($nopath($1-),.rct,.) ] $+ [ $line(@.recent,0) ] ] = $line(@.recent,$line(@.recent,0))
  dline @.recent $line(@.recent,0)
  if ($line(@.recent,1)) goto loopN
  %= [ $+ [ $gettok($nopath($1-),1,46) ] $+ [ .clr ] ] = Clear this list
}
; Finds all %=*.clr and sets to new theme
_rechash3 {
  var %num = $var(%=*.clr,0)
  while (%num) {
    set $var(%=*.clr,%num) Clear this list
    dec %num
  }
}


;
; Another 'recent lists' type that merely stores in a file, not in vars
;

; _recent2 type max# value
_recent2 {
  if ($3 == $null) return
  var %file = $_cfg($1.lis)
  window -hl @.recent
  aline @.recent $3-
  if ($exists(%file)) {
    loadbuf @.recent %file
    var %line = $read(%file,ns,$3-)
    if ($readn) dline @.recent $calc(1 + $readn)
  }
  savebuf 1- $+ $2 @.recent %file
  window -c @.recent
}

;
; Server list (status window) update
;

serverlist {
  var %num,%old,%tok,%bit,%curr,%sini,%groups,%group,%curr,%prog,%ln,%line,%desc,%serv,%port,%win

  if (($1 == off) || ($1 == off)) { _cfgxw serverlist on 0 | disps Serverlist disabled. }
  elseif (($1 == on) || ($1 == on)) {
    _cfgxw serverlist on 1
    if ($2) _cfgxw serverlist groups $_c2s($2-)
    if ($_cfgx(serverlist,groups) != $null) disps Serverlist enabled. $chr(40) $+ $ifmatch $+ $chr(41)
    else {
      var %groups = empty
      disps Serverlist enabled. $chr(40) $+ %groups $+ $chr(41)
    }
  }
  elseif ($1) {
    %bit = +
    %num = 1
    %old = $_cfgx(serverlist,groups)
    :loopM
    %tok = $gettok($1-,%num,32)
    if (+* iswm %tok) { %bit = + | %tok = $right(%tok,-1) }
    elseif (-* iswm %tok) { %bit = - | %tok = $right(%tok,-1) }
    if (%tok) {
      if (%bit == +) {
        if ($istok(%old,%tok,32)) disps $:s(%tok) is already in serverlist
        else disps Adding $:s(%tok) to serverlist
        %old = $addtok(%old,%tok,32)
      }
      else {
        if ($istok(%old,%tok,32)) disps Removing $:s(%tok) from serverlist
        else disps $:s(%tok) is not in serverlist
        %old = $remtok(%old,%tok,1,32)
      }
    }
    if (%num < $numtok($1-,32)) { inc %num | goto loopM }
    _cfgxw serverlist groups %old
  }
  elseif ($_cfgx(serverlist,on)) {
    if ($_cfgx(serverlist,groups) != $null) disps Serverlist enabled. $chr(40) $+ $ifmatch $+ $chr(41)
    else {
      var %groups = empty
      disps Serverlist enabled. $chr(40) $+ %groups $+ $chr(41)
    }
  }
  else disps Serverlist disabled.

  %sini = $readini($mircini,n,files,servers)
  if (%sini == $null) %sini = servers.ini
  if ($exists(%sini) == $false) { if ($show) _error Cannot find servers.iniCannot update serverlist without a servers file | return }
  %curr = $file(%sini).mtime $_cfgx(serverlist,on) $_cfgx(serverlist,groups)
  if (($exists($_cfg(servers.mrc))) && (%curr == $_cfgx(serverlist,last))) { disps Serverlist is up-to-date. | return }
  _cfgxw serverlist last %curr
  disps Refreshing serverlist popups...

  window -hl @.servlist

  aline @.servlist ; #= P&P -rs 0
  aline @.servlist ; @======================================:
  aline @.servlist ; $chr(124)  Peace and Protection                $chr(124)
  aline @.servlist ; $chr(124)  Servers popups (*auto-generated*)   $chr(124)
  aline @.servlist ; `======================================'
  if (1 != $_cfgx(serverlist,on)) goto sloff
  aline @.servlist menu status $chr(123)
  aline @.servlist -

  %groups = $_cfgx(serverlist,groups)

  if (%groups == $null) goto none

  if ($exists(%sini) == $false) goto none

  _progress.1 Refreshing serverlist popups...
  %prog = $numtok(%groups,32) + 1
  %curr = 0

  ; Open a window per group
  window -hl @.prescan
  %num = 1
  :loop0
  %group = $gettok(%groups,%num,32)
  if (%group) {
    _progress.2 $int($calc(%curr / %prog * 100)) Scanning %group
    inc %curr
    window -hsl @.sl@ $+ %group
    clear @.prescan
    filter -fw %sini @.prescan *GROUP: $+ %group
    filter -fw %sini @.prescan n*=Random & %group *
    %ln = $line(@.prescan,0)
    :loop9
    %line = $gettok($line(@.prescan,%ln),2-,61)
    %desc = $left(%line,$calc($pos(%line,SERVER:) - 1))
    %serv = $mid(%line,$calc($pos(%line,SERVER:) + 7),999)
    %serv = $left(%serv,$calc($pos(%serv,GROUP:) - 1))
    %port = $gettok(%serv,2,58)
    %serv = $gettok(%serv,1,58)
    if (($gettok(%desc,1,58) == %group) && ($numtok(%desc,58) > 1)) %desc = $gettok(%desc,2-,58)
    if ($gettok(%desc,1,32) == Random) aline @.sl@ $+ %group - $remtok(%desc,%group,1,32)  %serv  %port
    else aline @.sl@ $+ %group %desc  %serv  %port
    if (%ln > 1) { dec %ln | goto loop9 }
    inc %num | goto loop0
  }
  window -c @.prescan

  ; Copy servers to file
  _progress.2 $int($calc(%curr / %prog * 100)) Saving to popups
  %num = 1
  :loop3
  %group = $gettok(%groups,%num,32)
  if (%group) {
    var %groupcheck = $!iif(($hget(pnp. $!+ $!cid,net) != Offline) && ($hget(pnp. $!+ $!cid,net) != %group $+ ) && ($server($server).group != %group $+ ),-m)
    %win = @.sl@ $+ %group
    if ($line(%win,0) == 0) goto next3
    aline @.servlist %group
    var %old,%bit
    %curr = 0
    %ln = 1
    :loop4
    %line = $line(%win,%ln)
    if (%line) {
      %serv = $gettok(%line,1,127)
      if ($gettok(%serv,1,44) != %old) {
        %old = $ifmatch
        if ($numtok(%serv,44) > 1) {
          if (%curr < 2) {
            %tok = %old $+ , *
            if ($fline(%win,%tok,0,0) == $calc($line(%win,0) - %ln + 1)) %bit = 1
          }
          if (%curr == 1) aline @.servlist .-
          %curr = 2
          if (%bit != 1) {
            if ($findtok(US EU CA NZ AU,%old,1,32)) aline @.servlist . $+ $gettok(USA.Europe.Canada.New Zealand.Australia,$ifmatch,46)
            else aline @.servlist . $+ %old
          }
        }
        else {
          aline @.servlist . $+ $remtok(%old,-,1,32) $+ :server %groupcheck $gettok(%line,2,127) $ $+ gettok( $+ $_c2s($gettok(%line,3,127)) $+ ,$_pprand( $+ $numtok($gettok(%line,3,127),44) $+ ),32)
          if (%curr == 0) %curr = 1
        }
      }
      if ($numtok(%serv,44) > 1) aline @.servlist $iif(%bit,.,..) $+ $iif(%bit,%serv,$gettok(%serv,2-,44)) $+ :server %groupcheck $gettok(%line,2,127) $ $+ gettok( $+ $_c2s($gettok(%line,3,127)) $+ ,$_pprand( $+ $numtok($gettok(%line,3,127),44) $+ ),32)
      inc %ln | goto loop4
    }
    :next3
    window -c %win
    inc %num | goto loop3
  }

  _progress.2 100 Done!

  ; Load script file
  :none
  aline @.servlist -
  aline @.servlist $chr(125)
  :sloff
  savebuf @.servlist $_cfg(servers.mrc)
  window -c @.servlist

  _broadcastp if ($!script(servers.mrc)) .unload -rs " $!+ $!script(servers.mrc) $!+ " $chr(124) .load -rs2 $_cfg(servers.mrc)
  if ($script(servers.mrc)) .unload -rs " $+ $script(servers.mrc) $+ "
  .load -rs2 $_cfg(servers.mrc)
}

;
; drag/drop support
; $1 = normal/shift (n/s) $2 = target $3- = file
;
_dragdrop _juryrig2 _dragdrop2 $1-
_dragdrop2 {
  if ($active == = $+ $2) tokenize 32 $1 = $+ $2 $3-
  ; REMOVES quotes
  .signal PNP.DRAGDROP $1 $2 $iif("*" iswm $3-,$mid($3-,2,-1),$3-)
}
