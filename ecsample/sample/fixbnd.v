module fixbnd(input clk, a,b,c,d, output x) ;
    wire d ;
    l00 U0(.clk(clkx),.a(a),.b(b),.c(c),.x(x));
    clk_wiz_0 U1(.clk_in1(clk),.reset(1'b1),.clk_out1(clkx));
    
endmodule 
module l00(input clk, a,b,c,output x) ;
    //(* keep = "yes" *)
    wire c ;
    l01 U0(.clk(clk),.a(a),.b(b),.x(x));
endmodule 
module l01(input clk, a,b,output x) ;
    l02 U0(.clk(clk),.a(a),.b(b),.x(x));
endmodule 
//(* keep_hierarchy = "yes" *)
module l02(input clk, a,b,output x) ;
    reg x ;
    always @(posedge clk) x <= a ;
endmodule 
