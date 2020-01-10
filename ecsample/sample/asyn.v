`timescale 10ps / 10ps 

module gld(input clka,clkb, rst, sa,sb,output [1:0] x0,x1) ;
    reg ra0=1'b0,rb0=1'b0,ra1=1'b0,rb1=1'b0;
    always @(posedge clka) ra0 <= (rst)?1'b0:(!rb0)?1'b1:ra0 ;
    always @(posedge clkb) rb0 <= (rst)?1'b0:(!ra0)?1'b1:rb0 ;
    assign x0 = {ra0,rb0} ;
    always @(posedge clka or posedge sa) ra1 <= (rst)?1'b0:(!rb1&sa)?1'b1:ra1 ;
    always @(posedge clkb or posedge sb) rb1 <= (rst)?1'b0:(!ra1&sb)?1'b1:rb1 ;
    assign x1 = {ra1,rb1} ;
endmodule // async

module rvs(input clka,clkb, rst, sa,sb,output [1:0] x0,x1) ;
    reg ra0=1'b0,rb0=1'b0,ra1=1'b0,rb1=1'b0;
    always @(posedge clkb) ra0 <= (rst)?1'b0:(!rb0)?1'b1:ra0 ;
    always @(posedge clka) rb0 <= (rst)?1'b0:(!ra0)?1'b1:rb0 ;
    assign x0 = {ra0,rb0} ;
    always @(posedge clkb or posedge sb) ra1 <= (rst)?1'b0:(!rb1&sb)?1'b1:ra1 ;
    always @(posedge clka or posedge sa) rb1 <= (rst)?1'b0:(!ra1&sa)?1'b1:rb1 ;
    assign x1 = {ra1,rb1} ;
endmodule // async
module tb();
    reg clka=1'b0,clkb=1'b0,rst=1'b0,sa=1'b0,sb=1'b0 ;
    initial begin
	#1000 ;
	#100 {clka,clkb,rst,sa,sb} = 5'b00000 ; // reset 
	#100 {clka,clkb,rst,sa,sb} = 5'b11100 ; // clka -> clkb
	#100 {clka,clkb,rst,sa,sb} = 5'b00000 ;
	#100 {clka,clkb,rst,sa,sb} = 5'b10000 ;
	#100 {clka,clkb,rst,sa,sb} = 5'b00000 ;
	#100 {clka,clkb,rst,sa,sb} = 5'b01000 ;
	#100 {clka,clkb,rst,sa,sb} = 5'b00000 ;
	
	#100 {clka,clkb,rst,sa,sb} = 5'b11100 ; // 
	#100 {clka,clkb,rst,sa,sb} = 5'b00000 ;
	#100 {clka,clkb,rst,sa,sb} = 5'b01000 ;
	#100 {clka,clkb,rst,sa,sb} = 5'b00000 ;
	#100 {clka,clkb,rst,sa,sb} = 5'b10000 ;
	#100 {clka,clkb,rst,sa,sb} = 5'b00000 ;

	#100 {clka,clkb,rst,sa,sb} = 5'b11100 ;
	#100 {clka,clkb,rst,sa,sb} = 5'b00000 ;
	#100 {clka,clkb,rst,sa,sb} = 5'b11000 ;
	#100 {clka,clkb,rst,sa,sb} = 5'b00000 ;

	#100 {clka,clkb,rst,sa,sb} = 5'b11100 ; // 
	#100 {clka,clkb,rst,sa,sb} = 5'b00000 ;
	#100 {clka,clkb,rst,sa,sb} = 5'b01000 ;
	#100 {clka,clkb,rst,sa,sb} = 5'b11000 ;
	#100 {clka,clkb,rst,sa,sb} = 5'b10000 ;
	#100 {clka,clkb,rst,sa,sb} = 5'b00000 ;

	#100 {clka,clkb,rst,sa,sb} = 5'b11100 ;
	#100 {clka,clkb,rst,sa,sb} = 5'b00000 ;
	#100 {clka,clkb,rst,sa,sb} = 5'b00010 ;
	#100 {clka,clkb,rst,sa,sb} = 5'b00001 ;
	#100 {clka,clkb,rst,sa,sb} = 5'b11100 ;
	#100 {clka,clkb,rst,sa,sb} = 5'b00001 ;
	#100 {clka,clkb,rst,sa,sb} = 5'b00010 ;
	#100 {clka,clkb,rst,sa,sb} = 5'b00000 ;
	#100 {clka,clkb,rst,sa,sb} = 5'b11100 ;
	#100 {clka,clkb,rst,sa,sb} = 5'b00011 ;
	#100 {clka,clkb,rst,sa,sb} = 5'b00010 ;
	#100 {clka,clkb,rst,sa,sb} = 5'b00000 ;
	#100 {clka,clkb,rst,sa,sb} = 5'b00100 ;
	#1000 $finish();
    end // initial begin
    wire [1:0] x0,x1 ;
    gld U0(.clka(clka),.clkb(clkb),.rst(rst),.sa(sa),.sb(sb),.x0(x0),.x1(x1));
endmodule
    

