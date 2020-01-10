module gld(input clka,clkb,cnt,output reg y, [7:0] x);
    reg [7:0] r0=8'b0, r1=8'b0,ry0=8'hff,ry1=8'h0 ;
    always @(posedge clka) if(cnt) r0 <= (r0+8'b1)&8'hff;
    always @(posedge clka) r1 <= r0 ;
    always @(posedge clka) x  <= r1 ;
    always @(posedge clka) ry0 <= (ry0==8'h0)?8'hff:8'h00 ;
    always @(posedge clka) begin
	if( ry0 != 8'h00 && ry0 != 8'hff )
	    y <= 1'b1 ;
	else
	    y <= 1'b0 ;
    end
endmodule // gld

module rvs(input clka,clkb,cnt,output reg y, [7:0] x);
    reg [7:0] r0=8'b0, r1=8'b0,ry0=8'hff,ry1=8'h0 ;
    always @(posedge clka) if(cnt) r0 <= r0+8'b1;
    always @(posedge clkb) r1 <= r0 ;
    always @(posedge clka) x  <= r1 ;
    always @(posedge clka) ry0 <= (ry0==8'h0)?8'hff:8'h00 ;
    always @(posedge clkb) begin
	if( ry0 != 8'h00 && ry0 != 8'hff )
	    y <= 1'b1 ;
	else
	    y <= 1'b0 ;
    end
endmodule // rvs
