module gld(input clk,a,b,output x) ;
    gld0 U0(.clk(clk),.a(a),.b(b),.c(1'b0),.x(x),.y());
endmodule // gld
module gld0(input clk,a,b,c,output reg x,y);
    always @(posedge clk) x <= a^c ;
    always @(posedge clk) y <= b ;
endmodule // gld0

module rvs(input clk,a,b,output x) ;
    rvs0 U0(.clk(clk),.a(a),.b(b),.c(1'b0),.x(x),.y());
endmodule // rvs
module rvs0(input clk,a,b,c,output reg x,y);
    always @(posedge clk) x <= a ;
endmodule // rvs0

