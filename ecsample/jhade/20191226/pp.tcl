set m golden
#if {[llength [set t [lrange [get_signals -$m -filter fsm!=true] 0 9]]] != 0} {
#    puts "## error, black box was found in $m."
#    puts -nonewline "  "
#    puts [join [lsort $t] "\n  "]
#}
check_consistency -category [list init dead_code div_zero stick signal_domain] -category_exclude [list fsm]
