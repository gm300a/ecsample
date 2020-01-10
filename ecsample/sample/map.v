module gld(input clk,a,b,c,output reg x,y,z) ;
    always @(posedge clk) {x,y,z} <= {a,b,c} ;
endmodule
module rvs(input clk,a,b,d,output reg x,y,w) ;
    always @(posedge clk) {x,y,w} <= {b,a,d} ;
endmodule
