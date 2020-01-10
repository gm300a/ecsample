module gld(input clk,[7:0] a,output reg [7:0] x) ;
    reg [7:0]r = 8'b0  ;
    always @(posedge clk) r <= a ;
    always @(posedge clk) x <= r ;
endmodule // gld
module rvs(input clk,[7:0] a,output reg [7:0] x) ;
    reg [7:0] r = 8'hff ;
    always @(posedge clk) r <= ~a ;
    always @(posedge clk) x <= ~r ;
endmodule // gld
