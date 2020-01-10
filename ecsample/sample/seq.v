module gld(input clk,[7:0] a, b, c,output [9:0] x) ;
    reg [9:0] m ;
    always @(posedge clk posedge rst) m <= (rst)?10'h0:(a+b+c) ;
    assign x = m ;
endmodule // gld
module rvs(input clk,rst,[7:0] a, [7:0] b,output [9:0] x) ;
    reg [9:0] m0,m1 ;
    always @(posedge clk posedge rst) m0 <= (rst)?10'h0:(a+b+c) ;
    always @(posedge clk posedge rst) m1 <= (rst)?10'h0:(m0+c) ;
    assign x = m1 ;
endmodule // rvs

