bind dcc - gethost gethost
bind pub - !gethost gethost_pub

proc gethost {hand idx text} {
        set rnick [lindex [split $text] 0]
        set rchan [lindex [split $text] 1]
        set rchar [lindex [split $text] 2]
        set rtok [lindex [split $text] 3]
        if {$rnick == ""} { putserv "PRIVMSG $chan :Please specify a nickname"; return }
        if {$rchan == ""} { set rchan "$chan" }
        if {$rchar == ""} { set rchar "." }
        if {$rtok == ""} { set rtok "0" }
	putlog "[get_host $rnick $rchan $rchar $rtok]"
}
proc gethost_pub {nick uhost hand chan text} {
	set rnick [lindex [split $text] 0]
	set rchan [lindex [split $text] 1]
	set rchar [lindex [split $text] 2]
	set rtok [lindex [split $text] 3]
	if {$rnick == ""} { putserv "PRIVMSG $chan :Please specify a nickname"; return }
	if {$rchan == ""} { set rchan "$chan" }
	if {$rchar == ""} { set rchar "." }
	if {$rtok == ""} { set rtok "0" }
	putserv "PRIVMSG $chan :gethost for $rnick/$rchan - seperated by $rchar @ $rtok"
	putserv "PRIVMSG $chan :[get_host $rnick $rchan $rchar $rtok]"
}
proc get_host {nick chan char token} {
	set host [lindex [split [getchanhost $nick $chan] @] 1]
	set rt [lindex [split $host $char] $token]
}
