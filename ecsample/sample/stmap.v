module golden(input clk,rst,a,output [2:0] x) ;
    reg [2:0] state ;
    always @(posedge clk or negedge rst)
	if(!rst) state = 3'h0 ;
	else case (state)
	       3'h0 : if(a) {x,state} <= {3'h5,3'h1} ;
	       3'h1 : if(a) {x,state} <= {3'h4,3'h2} ;
	       3'h2 : if(a) {x,state} <= {3'h3,3'h3} ;
	       3'h3 : if(a) {x,state} <= {3'h2,3'h4} ;
	       3'h4 : if(a) {x,state} <= {3'h1,3'h5} ;
	       3'h5 : if(a) {x,state} <= {3'h0,3'h0} ;
	     endcase // case (state)
endmodule // golden
module revised(input clk,rst,a,output [2:0] x) ;
    reg [5:0] state ;
    always @(posedge clk or negedge rst)
	if(!rst) state = 6'h1 ;
	else case (state)
	       6'h01 : if(a) {x,state} <= {3'h5,6'h02} ;
	       6'h02 : if(a) {x,state} <= {3'h4,6'h04} ;
	       6'h04 : if(a) {x,state} <= {3'h3,6'h08} ;
	       6'h08 : if(a) {x,state} <= {3'h2,6'h10} ;
	       6'h10 : if(a) {x,state} <= {3'h1,6'h20} ;
	       6'h20 : if(a) {x,state} <= {3'h0,6'h01} ;
	     endcase // case (state)
endmodule // revised


