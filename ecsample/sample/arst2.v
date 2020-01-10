module gld(input clk,rst0,rst1,rst2,a,b,c,output reg [4:0] x) ;
    reg [4:0] cnt = 5'b0 ;
    always @(posedge clk or rst0 or rst1 or rst2) begin
	if(rst0 || rst1) cnt <= (cnt+5'h1)&5'h1f;
	else if(rst2) cnt <= 5'h0 ;
	if(a || b) cnt <= (cnt+5'h1)&5'h1f;
    end
    always @(posedge clk) x <= cnt ;
endmodule // arst2
module rvs(input clk,rst0,rst1,rst2,a,b,c,output reg [4:0] x) ;
    reg [4:0] cnt = 5'b0 ;
    always @(posedge clk or rst0 or rst1 or rst2) begin
	if(rst0) cnt <= (cnt+5'h1)&5'h1f;
	else if(rst2) cnt <= 5'h0 ;
	else if(rst1) cnt <= (cnt+5'h1)&5'h1f;
	if(a || b) cnt <= (cnt+5'h1)&5'h1f;
	if( c == 1'b0 && c != 1'b0 ) 
	    cnt <= 5'h0 ;
    end
    always @(posedge clk) x <= cnt ;
endmodule // arst2

			 
