`timescale 100ps / 100ps
module gld(input clki,sw0,sw1,output clko) ;
    reg rsw0=1'b0,rsw1=1'b0 ;
    always @(posedge clki){rsw0,rsw1} <= {sw0,sw1} ;
    BUFGCEwp gd0(.I(clki),.CE(rsw0&rsw1),.O(clko)) ;
endmodule
module rvs(input clki,sw0,sw1,output clko) ;
    reg rsw0=1'b0,rsw1=1'b0 ;
    always @(posedge clki){rsw0,rsw1} <= {sw0,sw1} ;
    BUFGCEwp rv0(.I(clki),.CE(rsw0),.O(clkt)) ;
    BUFGCEwp rv1(.I(clkt),.CE(rsw1),.O(clko)) ;
endmodule
module tb ;
    reg clk=1'b0,sw0,sw1 ;
    gld U0(.clki(clk),.sw0(sw0),.sw1(sw1),.clko(clkg));
    rvs U1(.clki(clk),.sw0(sw0),.sw1(sw1),.clks(clks));
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
