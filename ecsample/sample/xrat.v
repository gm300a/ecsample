`timescale 10ps / 10ps 

module xbuf(input i,en,output o) ;
    assign o = (en)?i:1'bZ ;
endmodule
module xrat(input clk,a,output xmd,xxd) ;
    reg r0,r1,r2=1'bX,r3 =1'bX ;
    always @(posedge clk) {r1,r0} <= {r0,a} ;
    
    xbuf u0(.i(r0),.en(1'b1),.o(xmd));
    xbuf u1(.i(r1),.en(1'b1),.o(xmd));

    always @(posedge clk) if(r2) r3 <= r0 ;
    always @(posedge clk) if(r3) r2 <= r1 ;
    assign xxd = r2 & r3 ;
endmodule // xrat

module tb ;
    reg clk,a ;
    xrat U0(.clk(clk),.a(a),.xmd(md),.xxd(xd));
    initial begin
	#1000 ;
	#100 {clk,a} = 2'b00 ;
	#100 {clk,a} = 2'b10 ;
	#100 {clk,a} = 2'b00 ;
	#100 {clk,a} = 2'b10 ;
	#100 {clk,a} = 2'b00 ;
	#100 {clk,a} = 2'b11 ;
	#100 {clk,a} = 2'b00 ;
	#100 {clk,a} = 2'b10 ;
	#100 {clk,a} = 2'b00 ;
	#100 {clk,a} = 2'b11 ;
	#100 {clk,a} = 2'b00 ;
	#100 {clk,a} = 2'b11 ;
	#1000 ;
	$finish() ;
    end // initial begin
endmodule // tb

	
	    
