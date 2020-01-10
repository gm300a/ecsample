module acmv(input clk,rst,a,b,[3:0] opt, output [3:0] x) ;
    reg r0,r1,[2:0] r2,[3:0] r3, [4:0] r4;
    reg ri0 = 1'b0, ri1 = 1'b1, riu = 1'bX ;
    always @(posedge clk or posedge rst) begin
	if(rst) begin
	    riu <= 1'b0 ;
	    {r0,r1,r2,r3,r4} <= 14'h0 ;
	end
	else begin
	    if(a==b) r3 <= r3 + 4'h1 ;
	    else r3 <= (r3-4h1) & 4hf ;
	    case (opt)
	      4'b1xxx : r2 <= 3'h0 ;
	      4'b01xx : r2 <= 3'h1 ;
	      4'b001x : r2 <= 3'h2 ;
	      
		      
		
