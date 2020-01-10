source $env(HOME)/src/tools/tools.tcl
set mod opt
proc opt_mapping {{dbg @}} {
    if { $dbg == "debug" } {
	for {set i 0} {$i < 8} {incr i} {
	    add_mapping test_pin\[[expr $i+28]\] test_pin\[$i\]
	}
    } else {
	for {set i 0} {$i < 8} {incr i} {
	    add_mapping test_pin\[[expr 35-$i]\] test_pin\[$i\]
	}
    }
    add_mapping sov_pullin_current  sov_pullin_curr
    add_mapping wdt_reset_disable_n wdt_reset_disa_n
}
proc run_step0 { } {
    foreach m0 [list golden revised] {
	cd rtl_$m0
	set fh [open $m0.f w]
	foreach m1 [glob *.v] {
	    puts $fh $m1
	}
	cd ..
	close $fh
    }
}
proc run_setup {mod typ} {
    set_mode setup
    set_read_hdl_option  -both -pragma_ignore {} -verilog_version sv2012
    foreach m [list golden revised] {
	set_current_design -$m
	vlog -f ./rtl_$m/$m.f
	elaborate -top Verilog!work.osp_top
	set_compile_option -default
	if {$typ == 6} {
	    set_compile_option\
		-time_step macro -clock clk\
		-no_fsm [list\
			     osp_function/sov_ls_cont/state\
			     osp_function/sov_hs_cont/state]
	} else {
	    set_compile_option\
		-time_step macro -clock clk\
		-no_fsm [list\
			     osp_function/sov_ls_cont/state\
			     osp_function/sov_hs_cont/state\
			     osp_function/osp_cmd_gen/state]
	}
	compile
	set_reset_sequence -$m -low reset_n
	if {[llength [set t [get_instances -$m -filter black_box==true]]] != 0} {
	    puts "## error, black box was found in $m."
	    puts -nonewline "  "
	    puts [join [lsort $t] "\n  "]
	}
    }
    dump_lint_issues log/lint.$mod.$typ.rpt
}
proc run_cc {mod typ} {
    set sid golden
    set_mode setup
    set_current_design -$sid
    set_mode cc
    check_consistency \
	-category [list init dead_code div_zero stick signal_domain]\
	-category_exclude [list fsm]
    if {[llength [set t [get_signals -$sid -filter fsm==true]]] != 0} {
	puts "## error, FSM was found in $sid."
	puts -nonewline "  "
	puts [join [lsort $t] "\n  "]
    }
    dump_cc_fail log/ccfail.rpt
}
proc run_ec {mod typ} {
    set_mode setup
    set_mode ec
    opt_mapping
    map
    compare
}

proc run_log {mod typ} {
    my_start_log $mod.$typ
    #my_init ec_fpga_microsemi:igloo2_synplify_gate
    my_init ec_fpga_rtl
}
