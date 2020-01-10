module deadc(input clk,a,b,output x) ;
    reg [1:0] r = 2'b0 ;
    assign x = ^r ;
    always @(posedge clk) begin
	if( a == 2'b1 && a[0] == 1'b0) r <= 1'b1 ;
    end
endmodule // deadc

