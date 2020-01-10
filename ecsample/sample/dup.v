module gld(input clk,a,b, output [7:0] x) ;
    wire w ;
    gld0 U0(.clk(clk),.a(a),.x(w));
    assign x = {w,w,w,w, !w,!w,!w,!w };
endmodule // gld
module gld0(input clk,a,output reg x) ;
    always @(posedge clk) x <= a ;
endmodule // gld0

module rvs(input clk,a,b, output [7:0] x) ;
    rvs0 U0(.clk(clk),.a(a),.x(x));
endmodule // rvs
module rvs0(input clk,a,output reg [7:0] x) ;
    always @(posedge clk) x <= {a,a,a,a, a,a,a,a} ;
endmodule // rvs0
