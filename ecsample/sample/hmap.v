module gld(input clk,rst,[7:0] a,b,output [7:0] x) ;
    reg [7:0] r = 8'b0 ;
    always @(posedge clk or posedge rst) r <= (rst)?8'b0:((a+b)&8'hff);
    assign x = r ;
endmodule // gld
module rvs(input clk,rst,[1:0] opt, [7:0] a,b,output [7:0] x,y) ;
    reg [7:0] r0 = 8'b0, r1= 8'b0 ;
    
//    always @(posedge clk or posedge rst) r0 <= (rst)?8'b0:((a+b)&8'hff);
    always @(posedge clk or posedge rst)
	if(rst) r0 <= 8'b0 ;
	else if(opt[0]) r0 <= ((a+b)&8'hff);
	else r0 <= a ;
    
    always @(posedge clk or posedge rst) r1 <= (rst)?8'b0:r0 ;
    assign x = r0 ;
    assign y = r1 ;
endmodule // gld
