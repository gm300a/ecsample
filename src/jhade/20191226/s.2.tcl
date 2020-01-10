source $env(HOME)/src/tools/tools.tcl
set mod osp_cmd_wrap
proc run_setup {mod typ} {
    set_mode setup
    set_read_hdl_option  -both -pragma_ignore {} -verilog_version sv2012
    foreach m [list golden revised] {
	set_current_design -$m
	vlog -f ./rtl_$m/$m.f
	read_verilog -$m ./osp_cmd_wrap.v
	elaborate -top Verilog!work.$mod
	set_compile_option -default
	compile
	set_reset_sequence -$m -low [list reset_n rst]
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
    dump_cc_fail log/ccfail.$mod.$typ.rpt
}
proc run_ec {mod typ} {
    set_mode setup
    set_mode ec
    map
    compare -output
    report_compare_result -output
}

proc run_log {mod typ} {
    my_start_log $mod.$typ
    my_init ec_fpga_rtl
}
proc run_bb { } {
    foreach m [list osp_cmd_gen sov_hs_cont sov_ls_cont] {
	run_log   $m auto
	run_setup $m auto
	run_cc    $m auto
	run_ec    $m auto
    }
}
