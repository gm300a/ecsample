module gld(input clk,rst_n,a,output x) ;
    reg r0=1'b0,r1=1'b0 ;
    assign rst = !rst_n ;
    always @(posedge clk or negedge rst_n) r0 <= rst?1'b1:a;
    always @(posedge clk or negedge rst_n) r1 <= rst?1'b1:r0;
    assign x = r1 ;
endmodule // gld
module rvs(input clk,rst_n,a,output x) ;
    reg r0=1'b0,r1=1'b0 ;
    assign rst = !rst_n ;
    always @(posedge clk) r0 <= rst?1'b1:a;
    always @(posedge clk) r1 <= rst?1'b1:r0;
    assign x = r1 ;
endmodule // gld

module top(input clk,rst_n,a,output x) ;
    gld g0(.clk(clk),.rst(rst),.a(a),.x(w));
    rvs r0(.clk(clk),.rst(rst),.a(w),.x(x));
endmodule // gld
