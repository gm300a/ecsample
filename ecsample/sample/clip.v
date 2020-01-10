module gld(input clk,a,b,output reg x) ;
    wire w0,w1,w2 ;
    g1 U0(.clk(clk),.a(1'b0),.b(  b ),.x(w0)); // w0 = 0 & b = 0 ;
    g1 U1(.clk(clk),.a(  a ),.b(1'b0),.x(w1)); // w1 = a & 0 = 0 ;
    g1 U2(.clk(clk),.a(  a ),.b(  b ),.x(w2)); // w2 is not used. ;
    always @(posedge clk) x <= (((w0 ^ w1) | a) | b) ; // x = a | b ;
endmodule
module g1(input clk,a,b,output reg x);
    always @(posedge clk) x <= a & b ;
endmodule // g1
// so r1 can be empty.
module rvs(input clk,a,b,output reg x) ;
    wire w0,w1,w2 ;
    r1 U0(.clk(clk),.a(1'b0),.b(  b ),.x(w0)); // w0 = 0 & b = 0 ;
    r1 U1(.clk(clk),.a(  a ),.b(1'b0),.x(w1)); // w1 = a & 0 = 0 ;
    r1 U2(.clk(clk),.a(  a ),.b(  b ),.x(w2)); // w2 is not used. ;
    always @(posedge clk) x <= (((w0 ^ w1) | a) | b) ; // x = a | b ;
endmodule
module r1(input clk,a,b,output reg x);
    always @(posedge clk) x <= 1'b0 ;
endmodule // rvs


