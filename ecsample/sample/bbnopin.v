module gld(input clk,a,output x0,x1) ;
    g0 U0(.clk(clk),.a(a),         .x(x0));
    g0 U1(.clk(clk),.a(a),         .x(x1));
endmodule // gld
module g0(input clk,a,  output reg x) ;
    always @(posedge clk) x <= a ;
endmodule // g0

module rvs(input clk,a,output x0,x1) ;
    r0 U0(.clk(clk),.a(a),.b(1'b0),.x(x0));
    r0 U1(.clk(clk),.a(a),.b(    ),.x(x1));
endmodule // rvs
module r0(input clk,a,b,output reg x) ;
    always @(posedge clk) x <= a ;
endmodule // r0


	
