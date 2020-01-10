module osp_cmd_wrap (
		     input clk,reset_n,mcu_cmd_write,spm_done,sys_hard_fault,
		     [15:0] mcu_cmd,[31:0] s2_norm_period,[31:0] s4_norm_period,
		     output [3:0] putest_status,[2:0] sdtest_status,[3:0] osprst_status);
    reg rst = 1'b0 ;
    always @(posedge clk) if(reset_n) rst <= 1'b1 ;
    osp_cmd_gen U0(
		   .reset_n(rst),
		   .clk(clk),
		   .mcu_cmd(mcu_cmd),
		   .mcu_cmd_write(mcu_cmd_write),
		   .s2_norm_period(s2_norm_period),
		   .s4_norm_period(s4_norm_period),
		   .spm_done(spm_done),
		   .sys_hard_fault(sys_hard_fault),
		   .putest_status(putest_status),
		   .sdtest_status(sdtest_status),
		   .osprst_status(osprst_status)
		   );
endmodule // osp_cmd_wrap

