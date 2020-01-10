module gld(input clk,a,output x) ;
    reg [15:0] r=16'h0 ;
    always @(posedge clk) r <= {r[14:0],a} ;
    assign x = (r == 16'hdead)?1:0 ; 
//  dead = 1101 1110 1010 1101
endmodule // gld
module rvs(input clk,a,output x) ;
    reg [15:0] r=16'h0 ;
    always @(posedge clk) r <= {r[14:0],a} ;
    assign x = (r == 16'hdbeaf)?1:0 ;
//  beaf = 1011 1110 1010 1111
endmodule // rvs
