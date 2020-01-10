`timescale 100ps / 100ps 
module veccal(input clk,rst,a,output x) ;
    reg [2:0] v=3'b0 ;
    always @(posedge clk or negedge rst)
	if(a) v<= (!rst)?3'h0:(v+3'b1) ;
    assign x = v ;
endmodule // veccal
module tb ;
    reg clk=1'b0,rst=1'b0 ;
    always clk = #50 !clk ;
    veccal U0(.clk(clk),.rst(rst),.a(1'b1),.x(x));
    initial begin
	#1000 rst = 1 ;
	#1000 $finish() ;
    end
endmodule // tb

	
