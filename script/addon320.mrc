; #= P&P.opt -rs
; ########################################
; Peace and Protection
; PnP 3.20 addon compatibility / support
; ########################################

; $identifiers used by 3.20 addons or listed in 3.20 help
alias _tf2yn return $iif($1,Yes,No)
alias _ccdef return $1- $+ 
alias _i return $calc($1 + 1)
alias _j return $calc($1 - 1)
alias _vi inc % $+ $1 | return % [ $+ [ $1 ] ]
alias _vd dec % $+ $1 | return % [ $+ [ $1 ] ]
alias _lchop return $left($2-,$calc(- $1))
alias _rchop return $right($2-,$calc(- $1))
alias _lpad var %lpad = $str($2,$1) $+ $3- | return $right(%lpad,$calc($1 + $len($3-) - $len($strip($3-))))
alias _rpad var %rpad = $3- $+ $str($2,$1) | return $left(%rpad,$calc($1 + $len($3-) - $len($strip($3-))))
alias _col2text {
  var %text,%fore,%color = $remove($1,,,,)
  if (%color != $null) %fore = $calc($gettok(%color,1,44) % 16 + 1)
  if (, isin %color) var %back = $calc($gettok(%color,2,44) % 16 + 1)
  else var %back = $color(back)
  if ( isin $1) %text = bold
  if ( isin $1) %text = %text underline
  if ( isin $1) %text = %text reverse
  elseif (%fore != $null) {
    %text = %text $_colorword(%fore)
    if (%back != $color(back)) %text = %text on $_colorword(%fore)
  }
  if (%text == $null) return none
  return %text
}
alias _getnicks {
  if ($2 == $null) var %mask = *
  else var %mask = $2
  var %find,%nick,%num = $ialchan(%mask,$1,0)
  if (%num == 0) return
  :loop1
  %nick = $ialchan(%mask,$1,%num).nick
  if (((+o !isin $3) && (-o !isin $3)) || (((%nick isop $1) || (%nick ishop $1)) && (+o isin $3)) || ((%nick !isop $1) && (%nick !ishop $1) && (-o isin $3))) %find = %find %nick
  if (%num > 1) { dec %num | goto loop1 }
  if (not isin $3) %find = $remtok(%find,$me,1,32)
  if (xw isin $3) {
    %num = 1
    :loop2
    if ($gettok(%!servnick,%num,32)) { %find = $remtok(%find,$ifmatch,1,32) | inc %num | goto loop2 }
  }
  return %find
}
alias _getchans {
  var %find,%num = $chan(0)
  :loop
  if (%num) {
    %find = %find $chan(%num)
    dec %num | goto loop
  }
  return %find
}
alias _keys return $_s2c($_cfgx(key,$1))
alias _getmsg return $_msg($2)
alias _nickcomp return $_ncc($1,$2)
alias _nickglob return $_nc($1)
alias _nickcseries return $_nccs($1,$2,$3)
alias _nickseries return $_ncs($1,$2)
alias _stripc return $strip($1-,c)
alias _ppcfg return $_cfgx($1,$2)
alias _numtok return $numtok($2-,$1)
alias _if return $iif( [ $1- ] , $true , $false)
alias _if2 return $iif( [ $1- ] , $true , $false)
alias _ifn if ($1 == $null) return null | return $1
alias _iniprep if ($1 == $null) return | return $replace($1-,[,$chr(40),],$chr(41),=,-,$chr(32),_)
alias _ppdir if ($chr(32) isin $mircdir) return config\ $+ $hget(pnp,user) $+ \ | else return $mircdirconfig\ $+ $hget(pnp,user) $+ \
alias _mircdir if ($chr(32) isin $mircdir) return | else return $mircdir
alias _a2x if ($1 == $null) return | return $replace($1-,&,&&)
alias _pwenc return $_pw.enc($1-)
alias _ltok if ($1 == 0) return | return $gettok($3-,1- $+ $1,$2)
alias _rtok if ($1 == 0) return | if ($calc($gettok($3-,0,$2) - $1 + 1) < 1) return $3- | if ($calc($gettok($3-,0,$2) - $1 + 1) == $null) return $3- | return $gettok($3-,$calc($gettok($3-,0,$2) - $1 + 1) $+ -,$2)
alias _tf2any if ($1) return $_p2s($2) | return $_p2s($3-)
alias _plural if ($2 == 1) return $1 | return $1 $+ s
alias _plural2 if ($3 == 1) return $1 | return $2
alias _color return  $+ $color($1).dd

; /aliases used by 3.20 addons or listed in 3.20 help
alias _timersinc inc -u $+ $1 % $+ $2 $3
alias _massmode {
  _init.mass $1 | var %num = 3
  :loop
  if ($ [ $+ [ %num ] ] != $null) {
    _add.mass $1 $iif(- isin $2,-,+) $remove($2,+,-) $ifmatch
    inc %num | goto loop
  }
}
alias _pentry _juryrig2 _pentry2 $1- | halt
alias _pentry2 {
  var %opt1 = (Enter for default, ESC to cancel),%opt2 = (Enter for none, ESC to cancel)
  $gettok($1,1,127) $_entry($iif($right($1,1) == ,0,1),$gettok($1,2-,127),$replace($2-,1,%opt1,2,%opt2))
}
alias _askr _pentry $1 $+  $2- $+ (ESC or Enter to cancel)
alias _askyn _juryrig2 _askyn2 $1-
alias _askyn2 if ($_okcancel(1,$2-)) $1
alias _arhelp %_arhelp $1- | unset %_arhelp
alias _lookup {
  _Q.userhost _lookup2&n!&a $+ $_s2p($2-) _lookup3 $+ $1 $1
  dispa Looking up address of $:t($1) $+ ...
  halt
}
alias _lookup2 {
  if ($2 isnum) var %mask = $_ppmask($1,$2)
  elseif ($2 == *) var %mask = $mask($1,3)
  else var %mask = $1
  $reptok($3-,$chr(44),%mask,1,32)
}
alias _lookup3 dispa User $:t($1) not found
alias _writecfg _cfgxw $1-
alias _exec $1- | return
alias _dynpop if ($1) return $style(1) | return $style(0)
alias _dynpopn if ($1) return $style(0) | return $style(1)
alias _dynpopf return $style(0)
alias _dynpop.rot {
  window -hl @.recent
  var %rec2f = $_cfg($1.rct),%num = 2
  aline @.recent $3-
  if ($exists(%rec2f)) loadbuf @.recent %rec2f
  %^ [ $+ [ $1. ] $+ [ 1 ] ] = $3-
  :loop
  if ($line(@.recent,%num) != $3-) { %^ [ $+ [ $1. ] $+ [ %num ] ] = $ifmatch | inc %num }
  else dline @.recent %num
  if ((%num <= $2) && (%num <= $line(@.recent,0))) goto loop
  savebuf 1- $+ $2 @.recent %rec2f
  window -c @.recent
  %^ [ $+ [ $1.clear ] ] = Clear this list
}
alias _timer924on _tut.on
alias _timer924off return

; Event halting interfaces (from 3.20 help)
ctcp &*:*:if ((%.+disphalt) || (%.+ctcpprochalt)) { unset %.+ctcpprochalt %.+disphalt | halt }
on &*:CTCPREPLY:*:if (%.+disphalt) { unset %.+disphalt | halt }
#_rawhalts off
raw &*:*:.timer -mio 1 0 .disable #_rawhalts | halt
#_rawhalts end
#_inputhalt off
on &*:INPUT:*:unset %.input.type | .timer -mio 1 0 .disable #_inputhalt
#_inputhalt end
on *:START:.disable #_rawhalts #_inputhalt

; Color variables and other variables
on *:CONNECT:%pp.net = $hget(pnp. $+ $cid,net)
on *:DISCONNECT:.timer -mio 1 0 % $+ pp.net = Offline
alias _pnp320compat {
  %col.base = $:c1
  %col.dark =  $+ $:c2
  %col.target =  $+ $:c2
  %col.att =  $+ $:cerr
  %col.info1 =  $+ $:c3
  %col.info2 =  $+ $:c3
  %col.info3 =  $+ $:c3
  %col.whois =  $+ $:c3
  %col.option =  $+ $:c2
  %col.misc =  $+ $:c2
  %col.addr =  $+ $:c2
  %col.serv =  $+ $color(norm).dd
  %col.cust = -c $+ $:c1
  %col.cdark = -c $+ $:c2
  %pp.ver = $:ver
  %= = $:::
  %font.fixtab = 20
  ; %font.basic and %font.quick left null on purpose, to open windows w/status font
}

