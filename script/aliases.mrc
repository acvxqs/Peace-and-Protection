; #= P&P -a
; **********************
; Unsorted routines
; **********************

;;;###*** Not yet divided ***###;;;

; Pass one or more file extensions, returns wildcard mask matching all (or *)
_glurp {
  tokenize 32 $1-
  if ($2 == $null) return $1
  var %n = 2,%min = $len($1),%max = $len($1),%tot = $numtok($1-,32)
  :len
  if ($len($ [ $+ [ %n ] ] ) > %max) %max = $ifmatch
  if ($len($ [ $+ [ %n ] ] ) < %min) %min = $ifmatch
  if (%n < %tot) { inc %n | goto len }
  var %ch = 1,%done
  :out
  var %n = 2,%bit = $mid($1,%ch,1)
  :in
  if ($mid($ [ $+ [ %n ] ] ,%ch,1) == %bit) {
    if (%n < %tot) { inc %n | goto in }
    %done = %done $+ %bit
  }
  else %done = %done $+ ?
  if (%ch < %min) { inc %ch | goto out }
  if (%ch < %max) %done = %done $+ *
  if ($remove(%done,?,*) == $null) return *
  return %done
}

; Escapes all non-alpha characters
_escape var %text = $1- | var %junk = $regsub(%text,/(*UTF)([^a-zA-Z0-9 ])/g,\\\1,%text) | return %text

; Replaces all non-alpha characters
_escape2 var %text = $1- | var %junk = $regsub(%text,/(*UTF)([^a-zA-Z0-9])/g,_,%text) | return %text

; Randomer than $r()? returns 1 to n given
_pprand return $calc(($r(1,$1) + $ticks) % $1 + 1)

; Used before writing and after reading an INI to allow control codes (same as 3.x formats)
_writeprep if ($1 == $null) return | return $replace($1-,,$chr(141),,$chr(142),,$chr(143),,$chr(144),,$chr(157))
_readprep if ($1 == $null) return | return $replace($1-,$chr(141),,$chr(142),,$chr(143),,$chr(144),,$chr(157),)

; $_colorword(n)
_colorword return $gettok(White*Black*Blue*Green*Red*Brown*Purple*Orange*Yellow*Lt Green*Cyan*Lt Cyan*Lt Blue*Pink*Grey*Lt Grey,$calc($1 % 16 + 1),42)

; $_isbot(nick)
_isbot return $istok($hget(pnp. $+ $cid,-servnick),$1,32)
; $_botacc(nick)
; returns /msg blah, /blah, or /msg blah@blah
_botacc {
  if ($findtok($hget(pnp. $+ $cid,-servnick),$1,1,32)) {
    var %do = $gettok($hget(pnp. $+ $cid,-servaddr),$ifmatch,32)
    if (*@/* iswm %do) return $right($gettok(%do,2-,64),-1)
    return msg %do
  }
  return msg $1
}
; $_chanbot(#chan) returns nothing if none found
_chanbot {
  var %nicks = $hget(pnp. $+ $cid,-servnick)
  var %num = $numtok(%nicks,32)
  :loop
  if ($gettok(%nicks,%num,32) ison $1) return $ifmatch
  if (%num > 1) {
    dec %num
    goto loop
  }
}
; $_isserv(type)
_isserv return $istok($hget(pnp. $+ $cid,-serv),$1,44)
; _rembot code nick (removes bot from access lists)
_rembot {
  hadd pnp. $+ $cid -serv $remtok($hget(pnp. $+ $cid,-serv),$1,44)
  if ($findtok($hget(pnp. $+ $cid,-servnick),$2,1,32)) {
    var %pos = $ifmatch
    hadd pnp. $+ $cid -servnick $deltok($hget(pnp. $+ $cid,-servnick),%pos,32)
    hadd pnp. $+ $cid -servaddr $deltok($hget(pnp. $+ $cid,-servaddr),%pos,32)
  }
}
; _addbot code nick nick@blah (removes any dupes first from current access lists)
_addbot {
  _rembot $1 $2
  hadd pnp. $+ $cid -serv $addtok($hget(pnp. $+ $cid,-serv),$1,44)
  hadd pnp. $+ $cid -servnick $hget(pnp. $+ $cid,-servnick) $2
  hadd pnp. $+ $cid -servaddr $hget(pnp. $+ $cid,-servaddr) $3
}

;
; Internal timers
;

_tut.on .timer.internal -io 0 10 _internal.timer | .timer.titleupd -io 0 1 _upd.title
_internal.timer {
  _aa.chk
  if (*last.mrc !iswm $script($script(0))) _screload
}
_screload {
  ; Skip reload if files don't exist
  if ($exists(script\rawdisp.mrc) == $false) halt
  if ($exists(script\last.mrc) == $false) halt
  disps Script load detected $+ $chr(44) reordering PnP scripts
  .reload -rs $+ $calc($script(0) + 1) "script\rawdisp.mrc"
  .reload -rs $+ $calc($script(0) + 1) "script\last.mrc"
}

;
; generic flood prot-
; $_genflood(var,on,max,secs)
; adds in $cid automatically
; stores as hash item $1, returns value hit (>1) if flood, else 0
; flood is defined as $3 within $4 secs; $2 = flood prot on/off
; intended for annoyance protections (query, notice, dcc floods) only
;
_genflood {
  tokenize 32 $1-
  if (($2) && ($3)) {
    hinc -u $+ $4 pnp.flood. $+ $cid $1
    if ($hget(pnp.flood. $+ $cid,$1) >= $3) return $ifmatch
  }
  return 0
}

;
; Basic identifiers
;

; performs (mainly for recursion)
_recurse $1- | return $result

; perform without abort (errors will not halt script) although without return value
_blackbox .timer.blackbox 1 1 _unkludge  $+ $replace($1-,$chr(32),) | .timer.blackbox -e

; perform using timer, to allow $?/$dialog/$dir; remember to $! identifiers, etc, and that it doesn't halt the script
_juryrig .timer -mo 1 0 $1-

; Same as _juryrig but w/o reevaluation
_juryrig2 .timer -mo 1 0 _unkludge  $+ $replace($1-,$chr(32),)
_unkludge $replace($right($1-,-1),,$chr(32))

; Lines up commands, doing max one per second.
; First few commands executed much faster
_linedance {
  if ($timer(.line.dance. $+ $cid) == $null) {
    hadd -m pnp.qcommand count. $+ $cid 1
    hadd -m pnp.qcommand 1. $+ $cid $1-
    _dolinedance 1
  }
  else {
    hinc -m pnp.qcommand count. $+ $cid
    hadd -m pnp.qcommand $hget(pnp.qcommand,count. $+ $cid) $+ . $+ $cid $1-
  }
}
_dolinedance {
  if ($hget(pnp.qcommand,$1 $+ . $+ $cid) != $null) {
    var %data = $ifmatch
    .timer.line.dance. $+ $cid -m 1 $calc(1500 - $gettok(1250 1000 750 500 250,$1,32)) _dolinedance $calc($1 + 1)
    %data
  }
  else hdel -w pnp.qcommand *. $+ $cid
}

; returns same (converts 0/1/blah/$null/$true/$false to 1/0)
_tf return $iif($1,1,0)
; returns opposite
_not return $iif($1,0,1)
; If $1 isin $2, removes it, otherwise adds it. If $1 == $2, returns 0 (zero)
; Adds $3- to it no matter what
_toggle tokenize 32 $1- | if ($1 == $2) return 0 $3- | if ($1 isin $2) return $remove($2,$1) $3- | else return $2 $+ $1 $3-

;
; is... identifiers
;

_isaddr if (*!*@* iswm $1) return 1 | return 0
; (ALWAYS considers +&#! as chantypes)
_ischan if ($left($1,1) isin +&! $+ $chantypes) return 1 | return 0
_ismask if ((* isin $1) || (? isin $1)) return 1 | return 0

;
; Channel identifiers
;

; adds # to channel name(s) if not present
; only prefixes alphanumerics to allow for better forward compatibility
_patch {
  var %ret = $1,%num = $numtok($1,44)
  :loop
  if ($left($gettok($1,%num,44),1) isalnum) if ($gettok($1,%num,44) != 0) %ret = $puttok(%ret,$chr(35) $+ $ifmatch,%num,44)
  if (%num > 1) { dec %num | goto loop }
  return %ret
}

;
; Text identifiers
;

; replaces spaces with ctrl+bksp
_s2p return $replace($1-,$chr(32),)
; replaces ctrl+bksp with spaces
_p2s return $replace($1-,,$chr(32))
; replaces spaces with chr 160
_s2f return $replace($1-,$chr(32), )
; replaces chr 160 with spaces
_f2s return $replace($1-, ,$chr(32))
; Capitalizes first letter, leaves rest alone
_cap1st return $upper($left($1,1)) $+ $right($1,-1)
; Makes a number exactly two digits
_cprep if ($1 < 10) return 0 $+ $calc($1 + 0) | return $right($1,2)
; Commas to spaces
_c2s return $replace($1-,$chr(44),$chr(32))
; Spaces to commas
_s2c return $replace($1-,$chr(32),$chr(44))
; Spaces to comma+space
_s2cs if ($1 == $null) return | var %s2cs | %s2cs = , $+ $chr(160) | return $_f2s($replace($1-,$chr(32),%s2cs))

;
; Userhost queueing
;

; _Q.userhost command errorcmd nick1 nick2 ...
; command is _s2p; any number of nicks can be given (will break up into sets of 5)
; command is run for each nick replacing &n with nick &a with address &h with +/- for here/away
; errorcmd is _s2p and run if a nick fails to resolve (can be 'halt')
_Q.userhost {
  var %num = 0
  :loop
  if (5 // %num) {
    .raw userhost $3-7
    if (%num) {
      hinc pnp.quserhost $cid $+ .tail
      hadd pnp.quserhost $cid $+ . $+ $hget(pnp.quserhost,$cid $+ .tail) *
    }
  }
  hinc pnp.quserhost $cid $+ .tail
  hadd pnp.quserhost $cid $+ . $+ $hget(pnp.quserhost,$cid $+ .tail) $3 $1-2
  if ($4) {
    tokenize 32 $1-2 $4-
    inc %num
    goto loop
  }
  hinc pnp.quserhost $cid $+ .tail
  hadd pnp.quserhost $cid $+ . $+ $hget(pnp.quserhost,$cid $+ .tail) *
}
; User-requested userhost
userhost {
  if ($1) {
    if ($show) {
      disps Looking up address of $:l($1-) $+ ...
      _notconnected
      _Q.userhost _showUH&n&a&h&i disps $+ User $+ &n $+ notfound $_c2s($1-)
    }
    else _Q.userhost return return $_c2s($1-)
  }
  else _qhelp /userhost
}
_showUH {
  var %away = $iif($3 == +,here,away)
  disps Userhost of $:t($1) - $:s($2) $chr(40) $+ user is %away $+ $chr(41) $iif($4,(IRCop))
}

; Hostmask lookup
host {
  if (@ isin $1) {
    if ($2 isnum) disp Hostmask of $:t($gettok($1,1,33)) $chr(40) $+ type $:s($2) $+ $chr(41) is- $:s($_ppmask($1,$_stmask($2)))
    else disp Hostmask of $:t($gettok($1,1,33)) is- $:s($_ppmask($1,$_stmask(3)))
  }
  elseif ($1) {
    tokenize 32 $_nc($1) $2-
    if ($address($1,5)) _recurse host $address($1,5) $2
    elseif ($2 isnum) {
      disp Looking up address of $:t($1) $+ ...
      _notconnected
      _Q.userhost host&n!&a $+ $2 disp $+ User $+ $:t($1) $+ notfound $1
    }
    else {
      disp Looking up address of $:t($1) $+ ...
      _notconnected
      _Q.userhost host&n!&a disp $+ User $+ $:t($1) $+ notfound $1
    }
  }
  else _qhelp /host
}

;
; File commands
;

edit {
  if ($1 isin -n) run notepad $2-
  elseif ($1 isin -w) run wordpad $2-
  elseif ($1 isin -l) viewlog $2-
  elseif ($1 isin -p) viewpic $2-
  ;;; make this an option
  ;;; else run "C:\Program Files\UltraEdit\UEDIT32.EXE" " $+ $1- $+ "
  else run notepad $1-
}
viewlog {
  var %log = $1
  if ($1 == $null) %log = $gettok($active,1,32)
  if (=* iswm %log) %log = $right(%log,-1)
  %log = $_renlogfile(%log)
  if ($exists(%log)) run notepad " $+ %log $+ "
  else dispa File ' $+ $:s(%log) $+ ' does not exist!
}
dellog {
  var %log = $1
  if (%log == $null) %log = $gettok($active,1,32)
  if (=* iswm %log) %log = $right(%log,-1)
  _remove $_renlogfile(%log)
}
; /viewpic [-flags] [zoom] [file/dir]
; flags -f to force full size; -w:@win to reuse window (must be last flag)
picview viewpic $1-
viewpic {
  var %ratio = 1,%file,%flags,%newfile
  if (-* iswm $1) { %flags = $1 | tokenize 32 $2- }
  if ($1 isnum) { %ratio = $calc($1 / 100) | %flags = f $+ %flags | tokenize 32 $2- }
  %file = $1-

  if (!$isfile(%file)) {
    ; Determine where to look
    var %dir = $mircdir
    if ($_dlgi(imagedir)) %dir = $ifmatch
    if ($isdir(%file)) %dir = %file

    ; Add filemask
    if (*\ !iswm %dir) %dir = %dir $+ \
    %dir = %dir $+ *.bmp;*.png;*.jpg

    ; Select file, enable style combo if any
    _ssplay Question
    %file = $$sfile(%dir,Select image)
    if ($isfile(%file)) _dlgw imagedir $nofile(%file)

    %newfile = 1
  }

  ; Error checking
  if (!$isfile(%file)) _error File ' $+ %file $+ ' does not exist!
  if (!$pic(%file).width) _error That is not a valid image file.mIRC only supports valid PNG $+ $chr(44) BMP $+ $chr(44) or JPG files.

  ; max size? top corner?
  window -ndh +L @.targetsize 0 0 $window(-1).w $window(-1).h
  var %targetwidth = $window(@.targetsize).dw
  var %targetheight = $window(@.targetsize).dh
  var %top = $window(@.targetsize).dy
  var %left = $window(@.targetsize).dx
  window -c @.targetsize

  ; Resize as needed (nearest percent)
  if (f !isin %flags) {
    if (%targetwidth < $pic(%file).width) %ratio = $round($calc(%targetwidth / $pic(%file).width),2)
    if (%targetheight < $int($calc($pic(%file).height * %ratio))) %ratio = $round($calc(%targetheight / $pic(%file).height),2)
  }
  var %target = $int($calc($pic(%file).width * %ratio)) $int($calc($pic(%file).height * %ratio))

  var %win = @ $+ $replace($nopath(%file),$chr(32),$chr(160))
  hdel pnp calibrate. $+ %win
  if (*w:@* iswm %flags) {
    var %old = $gettok(%flags,2-,58)
    if (($window(%old)) && (%old != %win)) {
      window -c %win
      renwin %old %win
      if (!%newfile) hadd pnp calibrate. $+ %win $hget(pnp,calibrate. $+ %old)
      hdel pnp calibrate. $+ %old
      hdel pnp picture. $+ %old
    }
  }
  if (($window(%win)) && ($window(%win).font != Picture Window)) window -c %win
  if ($window(%win)) {
    var %x = $int($calc($window(%win).dx + (($window(%win).dw - $gettok(%target,1,32)) / 2)))
    var %y = $int($calc($window(%win).dy + (($window(%win).dh - $gettok(%target,2,32)) / 2)))
    var %w = $gettok(%target,1,32)
    var %h = $gettok(%target,2,32)
    ; Reposition to within desktop if possible based on size
    if (%w <= %targetwidth) {
      if (%x < %left) %x = %left
      if ($calc(%x + %w) > $calc(%left + %targetwidth)) %x = $calc(%left + %targetwidth - %w)
    }
    if (%h <= %targetheight) {
      if (%y < %top) %y = %top
      if ($calc(%y + %h) > $calc(%top + %targetheight)) %y = $calc(%top + %targetheight - %h)
    }
    window -afk %win %x %y %w %h
    font %win 1 "Picture Window"
  }
  else window -dfhkpz +lt %win $_center($gettok(%target,1,32),$gettok(%target,2,32)) @PictureWin "Picture Window" 1 script\pnp.ico
  if ($window(%win).dw $window(%win).dh == $pic(%file).width $pic(%file).height) drawpic %win 0 0 " $+ %file $+ "
  else drawpic -s %win 0 0 $window(%win).dw $window(%win).dh " $+ %file $+ "
  titlebar %win $+($chr(91),$calc(%ratio * 100),%,$chr(93)) $pic(%file).width x $pic(%file).height
  hadd pnp picture. $+ %win %file
}

; _remove filename
; Deletes file and displays note on success or failure
_remove {
  if ($exists($1-)) {
    .remove -b " $+ $1- $+ "
    if ($exists($1-)) dispa Unable to delete ' $+ $1- $+ '
    else dispa File ' $+ $1- $+ ' has been deleted
  }
  else dispa File ' $+ $1- $+ ' does not exist!
}

;
; Window identifiers
;

; _targ(types) where types is one or more of =?#
; returns active window name (minus = for dcc chat) if it is of the proper type else nothing
_targ {
  if (($active ischan) && ($chr(35) isin $1)) return $active
  if ((=* iswm $active) && (= isin $1)) return $remove($active,=)
  if (($query($active)) && (? isin $1)) return $active
  return
}
_isopen {
  if (-* iswm $1) return 1
  if (($window($1) == $1) && ($1)) return 1
  return 0
}
; $_center(width,height[,desk[,xadd,yadd]])
; xadd/yadd are added to final offsets (mainly for use with -f)
; if desk is present and true, calculated as desktop window
_center return $int($calc(($window($iif($3,-1,-3)).w - $1) / 2 + $4)) $int($calc(($window($iif($3,-1,-3)).h - $2) / 2 + $5)) $1 $2
; $_winpos(top,bottom,left,right)
; Returns position and size for a window with padding in percents, nondesktop
_winpos return $int($calc($window(-3).dw * $3 / 100)) $int($calc($window(-3).dh * $1 / 100)) $int($calc($window(-3).dw * (100 - $3 - $4) / 100)) $int($calc($window(-3).dh * (100 - $1 - $2) / 100))
; loadbuf using base color and verifying file exists
_loadbuf if ($exists($2-)) loadbuf -c [ $+ [ $:c1 ] ] $1 " $+ $2- $+ "

;
; F-Key queueing
;
;  0/1 expiretime cmd
; returns name of fkey used
; 0 = prefer F7; 1 = prefer F10
_Q.fkey {
  if ($_cfgi(reserve.fkey) isnum 0-1) var %set = $iif($ifmatch,135,246)
  else var %set = $iif($1,214365,123456)
  var %index = 1
  :loop
  if (($isalias($gettok(f7-f10-sf7-sf10-cf7-cf10,$mid(%set,%index,1),45)).alias == $3-) || ($hget(pnp,key.exp. $+ $mid(%set,%index,1)) == $null) || ($hget(pnp,key.exp. $+ $mid(%set,%index,1)) < $ctime)) {
    hadd pnp key.exp. $+ $mid(%set,%index,1) $2
    alias $gettok(f7-f10-sf7-sf10-cf7-cf10,$mid(%set,%index,1),45) $3-
    return $gettok(F7-F10-ShiftF7-ShiftF10-CtrlF7-CtrlF10,$mid(%set,%index,1),45)
  }
  if (%index < $len(%set)) {
    inc %index
    goto loop
  }
  hdel -w pnp key.exp.*
  hadd pnp key.exp. $+ $left(%set,1) $2
  alias $gettok(f7-f10,$left(%set,1),45) $3-
  return $gettok(F7-F10,$left(%set,1),45)
}
; Clears fkey queue
_Q.fkey.clr alias f7 halt | alias sf7 halt | alias cf7 halt | alias f10 halt | alias sf10 halt | alias cf10 halt

;
; Userlevel/address identifiers
;

; $_level(#channel,levels)
_level var %level = $chr(44) $+ = $+ $1¬ | if (%level isin $2) return $gettok($mid($2,$calc($pos($2,%level,1) + $len(%level)),$len($2)),1,44) | else return $gettok($2,1,44)

; $_chanlevel(#channel,levels)
; same as $_level except returns null if a channel doesn't have a spec level.
_chanlevel var %level = $chr(44) $+ = $+ $1¬ | if (%level isin $2) return $gettok($mid($2,$calc($pos($2,%level,1) + $len(%level)),$len($2)),1,44)

; $_leveledit(#channel,levels[,new]) (leave off new to remove; #channel can be *)
_leveledit {
  if ($1 == *) return $puttok($2,$iif($3 == $null,$dlevel,$3),1,44)
  var %replace = = $+ $1¬ $+ $3,%match = = $+ $1¬*
  if ($3 == $null) {
    if ($wildtok($2,%match,1,44)) return $remtok($2,$ifmatch,1,44)
    return $2
  }
  if ($wildtok($2,%match,1,44)) return $reptok($2,$ifmatch,%replace,1,44)
  return $addtok($2,%replace,44)
}

; $_stmask(n[,#chan|*])
; standard masks 0-9 converted to A B C format for $_ppmask (or returns A B C if passed ABC)
; (uses ban mask settings for channel/global)
_stmask if ($len($1) > 1) return $left($1,1) $mid($1,2,1) $right($1,1) | else return $iif($1 < 5,0,1) $iif($1 isin 2468,0,$iif($1 isin 05,1,$_getchopt($2,3))) $iif($1 isin 012567,1,$_getchopt($2,4))

; $_banmask(user[,#chan*])
; default ban mask
_banmask return $_ppmask($1,0,$_getchopt($2,3),$_getchopt($2,4))

; $_fixmask(addr)
; Standardizes to *!*@* format
_fixmask {
  if ($1 == $null) return
  if (*!*@* iswm $1) return $1
  if (@ isin $1) return *! $+ $1
  if (! isin $1) return $1@*
  if ((. isin $1) || (: isin $1)) return *!*@ $+ $1
  return $1!*@*
}

; $_ppmask(nick/address,A,B,C[,x])
; returns formatted user address mask
; if nick is given, uses ial. (RETURNS NULL if ial doesn't have user)
; if asterisks are already present in nick or domain, mask is left UNTOUCHED. (except fixed to a!b@c form)
; if partial address given, returned in a!b@c form UNTOUCHED. (missing parts as *) Only works if nickname has wildcards or parts are missing
; type is in ABC - A is nick, B is identd, C is domain - 0 is *, 1 is full, 2 is *identd or *.domain.com; 3 is *identd if ~+-^=, identd otherwise
; example "pool044-max3.mpop2-ca-us.dialup.earthlink.net" (2 is "*.earthlink.net" and the minimum)
; domain 3 wildcards the first section only "*.mpop2-ca-us.dialup.earthlink.net"
; domain 4 wildcards everything until the last number "*-ca-us.dialup.earthlink.net"
; domain 5 wildcards everything until a section that contains a number "*.dialup.earthlink.net"
; domain 6 wildcards all numbers "pool*-max*.mpop*-ca-us.dialup.earthlink.net"
; numeric ips always produce #.#.#.* or #:#:#:#:#:*
; if x is present will return matching entry from userlist if fulladdress/nick given and match found
_ppmask {
  tokenize 32 $1-
  if ($3 == $null) tokenize 32 $1 $_stmask($2)
  if (* isin $1) {
    if ((*!*@* !iswm $1) || (* isin $gettok($1,1,33))) return $_fixmask($1)
    if ((* isin $gettok($gettok($1,2-,64),1-,42)) || ($remove($gettok($1,2-,64),*,?,.) == $null)) return $_fixmask($1)
    return $1
  }
  if (((! isin $1) || (. isin $1) || (@ isin $1) || (: isin $1)) && (*!*@* !iswm $1)) return $_fixmask($1)
  if (! isin $1) return $_ppmask²($1,$2,$3,$4,$5)
  if (($1 == $me) && ($hget(pnp. $+ $cid,-myself))) return $_ppmask²($hget(pnp. $+ $cid,-myself),$2,$3,$4,$5)
  if ($address($1,5) == $null) return
  return $_ppmask²($address($1,5),$2,$3,$4,$5)
}
_ppmask² {
  if ($5) { if ($_fuser($1)) return $ifmatch }
  var %nick = $gettok($1,1,33),%dom = $gettok($1,$numtok($1,64),64),%ident = $mid($1,$calc($len(%nick) + 2),$calc($len($1) - $len(%dom) - $len(%nick) - 2))
  if ($2 == 0) %nick = *
  if ($4 == 0) %dom = *
  elseif (($4 > 1) && (($longip(%dom) != $null) || (($longip($gettok(%dom,1-3,46)) != $null) && ($gettok(%dom,4-,46) isin ***)))) %dom = $gettok(%dom,1-3,46) $+ .*
  ; IPv6
  elseif (($4 > 1) && (*:*:*:*:*:* iswm %dom) && ($numtok(%dom,58) == 6)) %dom = $puttok(%dom,*,6,58)
  elseif (($4 == 2) || ($4 == 3)) {
    var %dots = $count(%dom,.)
    if (*.us iswm %dom) dec %dots 2
    elseif (((. isin $right(%dom,3)) && (. isin $left($right(%dom,7),4))) || (*.mil iswm %dom) || (*.gov iswm %dom)) dec %dots
    if (%dots >= 2) %dom = *. $+ $iif($4 == 2,$gettok(%dom,%dots $+ -,46),$gettok(%dom,2-,46))
  }
  elseif (($4 > 3) && ($count(%dom,.) > 1)) {
    var %dots = 1- $+ $calc($count(%dom,.) - 1),%dots2 = $count(%dom,.) $+ -
    %dom = $replace($gettok(%dom,%dots,46),0,*,1,*,2,*,3,*,4,*,5,*,6,*,7,*,8,*,9,*) $+ . $+ $gettok(%dom,%dots2,46)
    if (* isin %dom) {
      if ($4 == 4) %dom = * $+ $gettok(%dom,$numtok(%dom,42),42)
      elseif ($4 == 5) %dom = *. $+ $gettok(~ $+ $gettok(%dom,$numtok(%dom,42),42),2-,46)
      else %dom = $iif($left(%dom,1) == *,*) $+ $gettok(%dom,1-,42)
    }
  }
  if ($3 == 0) %ident = *
  else {
    %ident = $replace(%ident,*,?)
    var %ident2 = %ident,%num = $len(%ident2)
    :loop
    if ($asc($mid(%ident2,%num,1)) !isnum 33-126) %ident2 = $replace(%ident2,$mid(%ident2,%num,1),?)
    if (%num > 1) { dec %num | goto loop }
    if (($3 > 1) && ($left(%ident2,1) isin -=+^~)) %ident2 = * $+ $mid(%ident2,2,$len(%ident2))
    elseif ($3 == 2) %ident2 = * $+ %ident2
    if ($len(%ident2) > 10) %ident2 = $left(%ident2,9) $+ *
    if ($4 == 0) %num = 4
    elseif ($calc($len(%dom) * 2) <= $gettok($1,$numtok($1,64),64)) %num = 3
    elseif (* isin %dom) %num = 2
    else %num = 1
    if ($len($remove(%ident2,*,?)) >= %num) %ident = %ident2
  }
  return %nick $+ ! $+ %ident $+ @ $+ %dom
}

;
; Filename identifiers
;

; $_add.ext(ext,filename)
; Adds . and extension to filename if it doesn't already have it
_add.ext if (. !isin $2-) return $2- $+ . $+ $1 | return $2-

; $_rel.fn(filename)
; If filename is relative to $mircdir, removes $mircdir
_rel.fn if ($mircdir isin $1-) return $remove($1-,$mircdir) | return $1-

; $_truename.fn(filename without quotes)
; Adds drive and/or mIRC directory to filename if missing
; Assumes c:blah is c:\blah
; Works with \\ names
_truename.fn {
  if (\\* iswm $1) return $1-
  if (?:* iswm $1) {
    if ($mid($1,3,1) != \) return $left($1,2) $+ \ $+ $right($1-,-2)
    return $1-
  }
  if (\* iswm $1) return $left($mircdir,2) $+ $1-
  return $mircdir $+ $1-
}

; $_cfg(filename)
; Returns filename in the config directory of the current user
_cfg return config\ $+ $hget(pnp,user) $+ \ $+ $1-

; $_temp(ext)
; Returns filename in temp dir, in xxx.ext format
_temp return script\temp\ $+ $hget(pnp,ext) $+ . $+ $1

; $_cfgi(item) $_dlgi(item) $_cfgx(sec,item)
; Returns item from config.ini of current user
_cfgi return $readini(config\ $+ $hget(pnp,user) $+ \config.ini,n,cfg,$1)
_dlgi return $readini(config\ $+ $hget(pnp,user) $+ \config.ini,n,dlg,$1)
_cfgx return $readini(config\ $+ $hget(pnp,user) $+ \config.ini,n,$1,$2)

; _cfgw|_dlgw item value _cfgxw sec item value
; Writes item to config.ini of current user
_cfgw if ($2 != $null) writeini config\ $+ $hget(pnp,user) $+ \config.ini cfg $1 $2- | else remini config\ $+ $hget(pnp,user) $+ \config.ini cfg $$1
_dlgw if ($2 != $null) writeini config\ $+ $hget(pnp,user) $+ \config.ini dlg $1 $2- | else remini config\ $+ $hget(pnp,user) $+ \config.ini dlg $$1
_cfgxw if ($3 != $null) writeini config\ $+ $hget(pnp,user) $+ \config.ini $1 $2 $3- | else remini config\ $+ $hget(pnp,user) $+ \config.ini $1 $$2

; $_renlogfile(window)
; Returns log file for window (WITH directory)
_renlogfile {
  if ($window($1).logfile) return $window($1).logfile
  return $logdir $+ $mklogfn($1)
}

; $_gen.id(string)
; Generates an id containing up to eight uppercase alphas; you need to ensure uniqueness for purpose
_gen.id {
  ; Generate profile id
  var %id = $remove($1-,$chr(32)),%num = $len(%id)
  :loop
  if ($mid(%id,%num,1) !isletter) %id = $replace(%id,$mid(%id,%num,1),_)
  if (%num > 1) { dec %num | goto loop }
  %id = $upper($left($remove(%id,_),8))
  if (%id == $null) return PNP
  return %id
}

;
; Sync'd variable settings (reloading and sync'ing)
;

_rehash {
  window -hl @.rehash
  loadbuf @.rehash $_cfg(cfgvar.dat)
  :loop | if ($line(@.rehash,1) != $null) { hadd pnp.config $ifmatch | dline @.rehash 1 | goto loop }
  window -c @.rehash
}
; `set varname [value]
; varname should not include the %`
; If we ever change this, search for cfgvar.dat as certain routines use it
`set {
  if ($hget(pnp.config,$1) == $2-) return
  if ($2- == $null) {
    hdel pnp.config $1
    write -ds [ $+ [ $1 ] ] config\ $+ $hget(pnp,user) $+ \cfgvar.dat
    _broadcastp hdel pnp.config $1
  }
  else {
    hadd pnp.config $1 $2-
    write -s [ $+ [ $1 ] ] config\ $+ $hget(pnp,user) $+ \cfgvar.dat $1-
    _broadcastp _`set $1
  }
}
;;; workaround needed until such time that dde can be set to not reevaluate
_`set hadd pnp.config $1 $read(config\ $+ $hget(pnp,user) $+ \cfgvar.dat,nts,$1)

; `lset works like `set but doesn't propogate using DDE
`lset {
  if ($hget(pnp.config,$1) == $2-) return
  if ($2- == $null) {
    hdel pnp.config $1
    write -ds [ $+ [ $1 ] ] config\ $+ $hget(pnp,user) $+ \cfgvar.dat
  }
  else {
    hadd pnp.config $1 $2-
    write -s [ $+ [ $1 ] ] config\ $+ $hget(pnp,user) $+ \cfgvar.dat $1-
  }
}

;
; Dynamic aliases/identifiers- used for colors, markup, display, fkey queue, version number+patches
; ($:ver is version with patches/etc, $:bver is base version number)
;

; Returns (network) for cid; if multiple networks have same name returns (network : me); else returns nothing
:anp {
  var %scon = $scon(0)
  while (%scon) {
    if (($scon(%scon) != $cid) && ($hget(pnp. $+ $scon(%scon),net) == $hget(pnp. $+ $cid,net))) return $:nnp
    dec %scon
  }
  return $:np
}

; Display cmds/idents which don't (currently) change dynamitcally
_alert {
  _title.note $_p2s($upper($1))
  if ($1 == Self-lag) _ssplay SelfLag Alert
  elseif ($1 == Flood) _ssplay ProtectSelf Alert
  else _ssplay Alert
  set -u %:echo echo $:cerr $iif(@* iswm $active,-mtsi2,-mtai2 $iif($cid != $activecid,$:anp))
  set -u %::text $2-
  theme.text Error
}
:i if ($1) return  $+ $color(norm).dd $+ $1- $+  | return  $+ $color(norm).dd
:ihn {
  var %tok,%str = $1-,%num = $numtok($1-,32)
  while (%num > 1) {
    if ($gettok(%str,%num,32) isnum) %str = $puttok(%str,$:s($gettok(%str,%num,32)),%num,32)
    dec %num
  }
  return %str
}
:mc return  $+ $color($1).dd $+ $2- $+ 
:bver return 4.22
:ver return 4.22.10

; Dynamic 'aliases' will appear in $_cfg(themeals.mrc).
