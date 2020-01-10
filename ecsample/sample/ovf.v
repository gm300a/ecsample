`timescale 10ps / 10ps
module gld(input clk,[7:0] a,output [7:0] x) ;
    reg [7:0] r8;
    reg [3:0] r4;
    reg [11:0] rc ;
    always @(posedge clk)
	case (a[2:0])
	    3'h0 : begin
		r8 <= a ;
		r4 <= a[3:0] ;
		rc <= {a,4'b0} ;
	    end
	    3'h1 : begin
		r8 <= a ;
		r4 <= a ;
		rc <= a ;
	    end
	    3'h2 : begin
		r8 <= 16'hf0f1f2f3 ;
		r4 <= 16'hf0f1f2f3 ;
		rc <= 16'hf0f1f2f3 ;
	    end
	    3'h3 : begin
		r8 <= 16'h0f0e0d0c ;
		r4 <= 16'h0f0e0d0c ;
		rc <= 16'h0f0e0d0c ;
	    end
	    3'h3 : begin
		r8 <= 16'h0f0e0d0c ;
		r4 <= 16'h0f0e0d0c ;
		rc <= 16'h0f0e0d0c ;
	    end
	    3'hf : begin
		r8 <= 16'h0f0e0d0c ;
		r4 <= 16'h0f0e0d0c ;
		rc <= 16'h0f0e0d0c ;
	    end
	endcase // case a[2
    assign x = {r8[3:0],rc[3:0]} ;
endmodule // gld
module tb ;
    reg clk =1'b0 ;
    reg [7:0] a = 8'b0;
    wire [7:0] x ;
    gld U0(.clk(clk),.a(a),.x(x));
    always clk = #50 !clk;
    initial begin
	#1000 ;
	#100 a = 8'h01 ;
	#100 a = 8'h11 ;
	#100 a = 8'h21 ;
	#100 a = 8'hf1 ;
	#100 a = 8'hf2 ;
	#100 a = 8'hf3 ;
	#100 a = 8'hf2 ;
	#100 a = 8'hf3 ;
	#100 a = 8'hf0 ;
	#500 $finish() ;
    end // initial begin
endmodule // tb

    
