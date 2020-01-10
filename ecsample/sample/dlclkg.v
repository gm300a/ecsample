`timescale 100ps / 100ps
module dlclkg(input clk,sw0,sw1,output clkd,clks,clkz,clki) ;
    reg rsw0=1'b0,rsw1=1'b0 ;
    assign clk0 = clk ;
    always @(posedge clk0){rsw0,rsw1} <= {sw0,sw1} ;
    BUFGCEwp g0_0(.I(clk0),.CE(rsw0&rsw1),.O(clks)) ; // better clock gate control 

    BUFGCEwp g1_0(.I(clk0),.CE(rsw0),.O(clk1_1)) ; // simple initial stage.
    assign    clk2_1 = clk1_1 ;
    BUFGCEwp g1_1(.I(clk2_1),.CE(rsw1),.O(clkd)) ; // this is equivalent to single
    
    assign #1 clk2_2 = clk1_1  ;// but in many case, 1st stage has some delay.
    BUFGCEwp g2_1(.I(clk2_2),.CE(rsw1),.O(clkz)) ; // more trouble.

    assign #1 clk0_3 = clk0 ; // intentional delay to capture rsw0
    BUFGCEwp g3_0(.I(clk0_3),.CE(rsw0),.O(clk1_3)) ; //rsw0 is always capture
    assign #1 clk2_3 = clk1_3  ;// even 1st stage delay is included,
    BUFGCEwp g3_1(.I(clk2_3),.CE(rsw1),.O(clki)) ; // it works fine.
    
endmodule // dlclkg
module tb ;
    reg clk=1'b0,sw0,sw1 ;
    dlclkg U0(.clk(clk),.sw0(sw0),.sw1(sw1),.clks(clks),.clkd(clkd),.clkz(clkz),.clki(clki));
    always clk = #100 !clk ;
    initial begin
	{sw0,sw1} <= 2'b00 ;	
	#999 ;
	#100 {sw0,sw1} <= 2'b01 ;
	#200 {sw0,sw1} <= 2'b11 ;
	#200 {sw0,sw1} <= 2'b11 ;
	#200 {sw0,sw1} <= 2'b01 ;
	#200 {sw0,sw1} <= 2'b00 ;
	#200 {sw0,sw1} <= 2'b00 ;
	#200 {sw0,sw1} <= 2'b10 ;
	#200 {sw0,sw1} <= 2'b11 ;
	#200 {sw0,sw1} <= 2'b11 ;
	#200 {sw0,sw1} <= 2'b10 ;
	#200 {sw0,sw1} <= 2'b00 ;
	#200 {sw0,sw1} <= 2'b00 ;
	#200 {sw0,sw1} <= 2'b11 ;
	#200 {sw0,sw1} <= 2'b11 ;
	#200 {sw0,sw1} <= 2'b00 ;
	#200 {sw0,sw1} <= 2'b00 ;
	#500 $finish() ;
    end
endmodule // tb
module BUFGCEwp(input I,CE,output O);
    BUFGCE U0(.I(I),.CE(CE),.O(O));
endmodule // BUFGCE
