`timescale 100ps / 100ps 
module fdpe_gld(input C,D,CE,PRE,output Q) ;
    FDPE U0(.C(C),.D(D),.CE(CE),.PRE(PRE),.Q(Q));
endmodule
module fdpe_rvce(input C,D,CE,PRE,output Q) ;
    reg Q = 1'b1 ;
    always @(posedge C or posedge PRE) if(CE) Q <= (PRE)?1'b1:D ;
endmodule
module fdpe_rvpre(input C,D,CE,PRE,output Q) ;
    reg Q = 1'b1 ;
    always @(posedge C or posedge PRE) 
	if(PRE) Q <= 1'b1 ;
	else if(CE) Q <= D ;
endmodule
module tb ;
    reg clk=1'b0, d=1'b0,pre = 1'b0,ce=1'b0 ;
    fdpe_gld   ig0(.C(clk),.D(d),.PRE(pre),.CE(ce),.Q(g0));
    fdpe_rvce  irc(.C(clk),.D(d),.PRE(pre),.CE(ce),.Q(rc));
    fdpe_rvpre irp(.C(clk),.D(d),.PRE(pre),.CE(ce),.Q(rp));
    
    initial #5000 $finish() ;
    initial begin
	#500 ;
	#100 {clk,ce,d,pre} = 4'b0001 ;
	#100 {clk,ce,d,pre} = 4'b0000 ;
	#100 {clk,ce,d,pre} = 4'b0001 ;
	#100 {clk,ce,d,pre} = 4'b0000 ;

	#50  {clk,ce,d,pre} = 4'b0000 ;
	#50  {clk,ce,d,pre} = 4'b1100 ;
	#50  {clk,ce,d,pre} = 4'b0100 ;
	#50  {clk,ce,d,pre} = 4'b0000 ;
	#100 {clk,ce,d,pre} = 4'b0001 ;
	#100 {clk,ce,d,pre} = 4'b0000 ;

	#50  {clk,ce,d,pre} = 4'b0000 ;
	#50  {clk,ce,d,pre} = 4'b1100 ;
	#50  {clk,ce,d,pre} = 4'b0100 ;
	#50  {clk,ce,d,pre} = 4'b0000 ;
	#100 {clk,ce,d,pre} = 4'b0101 ;
	#100 {clk,ce,d,pre} = 4'b0100 ;

	#50  {clk,ce,d,pre} = 4'b0000 ;
	#50  {clk,ce,d,pre} = 4'b1100 ;
	#50  {clk,ce,d,pre} = 4'b0100 ;
	#50  {clk,ce,d,pre} = 4'b0000 ;

	#100 {clk,ce,d,pre} = 4'b0100 ;
	#100 {clk,ce,d,pre} = 4'b1100 ;
	#100 {clk,ce,d,pre} = 4'b0100 ;
	#100 {clk,ce,d,pre} = 4'b1100 ;
	#100 {clk,ce,d,pre} = 4'b0100 ;
	#100 {clk,ce,d,pre} = 4'b1110 ;
	#100 {clk,ce,d,pre} = 4'b0110 ;
	#100 {clk,ce,d,pre} = 4'b1110 ;
	#100 {clk,ce,d,pre} = 4'b0110 ;

	#50  {clk,ce,d,pre} = 4'b0000 ;
	#50  {clk,ce,d,pre} = 4'b1100 ;
	#50  {clk,ce,d,pre} = 4'b0100 ;
	#50  {clk,ce,d,pre} = 4'b0000 ;

	#100 {clk,ce,d,pre} = 4'b0101 ;
	#100 {clk,ce,d,pre} = 4'b1101 ;
	#100 {clk,ce,d,pre} = 4'b0101 ;
	#100 {clk,ce,d,pre} = 4'b1101 ;
	#100 {clk,ce,d,pre} = 4'b0101 ;

	#100 ;
    end // initial begin
endmodule // tb

