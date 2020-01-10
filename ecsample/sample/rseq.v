module golden (input clk,rstn,a,output x) ;
   reg [1:0] r ;
localparam [1:0] ST0 = 2'b10;
localparam [1:0] ST1 = 2'b00;
localparam [1:0] ST2 = 2'b01;
localparam [1:0] ST3 = 2'b11;
   always @(posedge clk or negedge rstn)
     if(!rstn) r <= ST0 ;
     else case (r)
	    ST0 : if(a) r <= ST1 ;
	    ST1 : if(a) r <= ST2 ;
	    ST2 : if(a) r <= ST3 ;
	    ST3 : if(a) r <= ST0 ;
	    default : r <= 2'bXX ;
	  endcase // case (r)
   assign x = ^r ;
endmodule // golden
   
module revised (input clk,rstn,a,output x) ;
   reg [1:0] r ;
localparam [1:0] ST0 = 2'b01;
localparam [1:0] ST1 = 2'b00;
localparam [1:0] ST2 = 2'b10;
localparam [1:0] ST3 = 2'b11;
   always @(posedge clk or negedge rstn)
     if(!rstn) r <= ST0 ;
     else case (r)
	    ST0 : if(a) r <= ST1 ;
	    ST1 : if(a) r <= ST2 ;
	    ST2 : if(a) r <= ST3 ;
	    ST3 : if(a) r <= ST0 ;
	    default : r <= 2'bXX ;
	  endcase // case (r)
   assign x = ^r ;
endmodule // revised


	    
   
   
