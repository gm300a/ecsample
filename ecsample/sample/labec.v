module gld(input clk,rst,a,b,c,d,output reg x) ;
    reg r0=1'b0,r1=1'b0,r2,r3,x0,x1,x2,x3 ;
    reg [7:0] cnt ;
    always @(posedge clk or posedge rst) r0 <= (rst)?1'b0:a ;
    always @(posedge clk or posedge rst) x0 <= (rst)?1'b0:r0 ;

    always @(posedge clk or posedge rst) cnt <= (rst)?8'h0:(cnt+8'h1);
    always @(posedge clk or posedge rst) x1 <= (rst)?1'b0:cnt[7] ;

    reg [3:0] fsm ;
    always @(posedge clk or posedge rst) begin
	if (rst) fsm <= 4'h0 ;
	else
	    case (fsm)
	      4'h0 : fsm <= 4'h1 ;
	      4'h1 : fsm <= 4'h2 ;
	      4'h2 : fsm <= 4'h3 ;
	      4'h3 : fsm <= 4'h0 ;
	      4'h4 : fsm <= 4'h5 ;
	      4'h5 : fsm <= 4'h4 ;
	      default : fsm <= 4'bXXXX ;
	    endcase // case (fsm)
    end // always @ (posedge clk or posedge rst)
    always @(posedge clk or posedge rst) x2 <= (rst)?1'b0:fsm[3] ;
    always @(posedge clk or posedge rst) x <= x0 ^ x1 ^ x2 ;

    reg rcz ;
    reg [3:0] rd ;
    always @(posedge clk or posedge rst) rcz <= (rst)?1'b0:b ;
    always @(posedge clk or posedge rst) rd <= {rd[2]^rcx,rd[1]^rcx,rd[0]^rcx,rcx} ;
    
endmodule // gld

module rvs(input clk,rst,a,b,c,d,output reg x) ;
    reg r0=1'b1,r1=1'b1,r2,r3,x0,x1,x2 ;
    reg [7:0] cnt ;
    always @(posedge clk or posedge rst) r0 <= (rst)?1'b1:~a ;
    always @(posedge clk or posedge rst) x0 <= (rst)?1'b1:~r0 ;

    always @(posedge clk or posedge rst)
	if(rst) cnt <= 8'h0 ;
	else if(cnt == 8'h12 ) cnt <= 8'h14 ;
	else cnt <= cnt+8'h1 ;
    always @(posedge clk or posedge rst) x1 <= (rst)?1'b0:cnt[7] ;

    reg [3:0] fsm ;
    always @(posedge clk or posedge rst) begin
	if (rst) fsm <= 4'h0 ;
	else
	    case (fsm)
	      4'h0 : fsm <= 4'h1 ;
	      4'h1 : fsm <= 4'h2 ;
	      4'h2 : fsm <= 4'h3 ;
	      4'h3 : fsm <= 4'h0 ;
	      4'h4 : fsm <= 4'h5 ;
	      4'h5 : fsm <= 4'h6 ;
	      4'h6 : fsm <= 4'h4 ;
	      default : fsm <= 4'bXXXX ;
	    endcase // case (fsm)
    end // always @ (posedge clk or posedge rst)
    always @(posedge clk or posedge rst) x2 <= (rst)?1'b0:fsm[3] ;
    always @(posedge clk or posedge rst) x <= x0 ^ x1 ^ x2 ;
endmodule // rvs
module mulgld(input clk,[3:0] a,b,output [7:0] x) ;
    reg [7:0] r ;
    always @(posedge clk) x <= a*b ;
endmodule // mula
module mulrvs(input clk,[3:0] a,b,output [7:0] x) ;
    reg [7:0] r ;
    always @(posedge clk) x <= (b[0])?{4'h0,a}:8'h0+
			       (b[1])?{3'h0,a,1'h0}:8'h0+
			       (b[2])?{2'h0,a,2'h0}:8'h0+
			       (b[3])?{1'h0,a,3'h0}:8'h0;
endmodule // mula

