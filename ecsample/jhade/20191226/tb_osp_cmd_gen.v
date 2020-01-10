`timescale 100ps / 100ps 
module tb_osp_cmd_gen ( ) ;
    reg clk =1'b0, reset_n=1'b1, mcu_cmd_write=1;
    reg [15:0] mcu_cmd ;
    wire [3:0] putest_status ;

    always clk = #50 !clk ;
    initial begin
	{reset_n,mcu_cmd_write,mcu_cmd} = {1'b1,1'b0,16'h0} ;
	#1000 ;
	{reset_n,mcu_cmd_write,mcu_cmd} = {1'b0,1'b0,16'h0} ;
	#100 {reset_n,mcu_cmd_write,mcu_cmd} = {1'b1,1'b1,16'h2471}; // CMD_PM
	#100 {reset_n,mcu_cmd_write,mcu_cmd} = {1'b1,1'b1,16'h2475}; // CMD_SD
	#100 {reset_n,mcu_cmd_write,mcu_cmd} = {1'b1,1'b1,16'h2476}; // CMD_RST
	#1000 $finish() ;
    end
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
endmodule    
