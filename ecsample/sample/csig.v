module gld(input clki,rsti,a,b,output reg x,y,z) ;
    typedef enum {st0,st1,st2,st3} stlist;
    reg clkdiv,rstsync ;
    always @(posedge clki) clkdiv = (rsti)?1'b0:!clkdiv ;
    assign clk = clkdiv ;
    always @(posedge clki or posedge rsti) rstsync <= rsti ;
    assign rst = rstsync ;

    reg r0=1'b0, r1=1'b1, r2=1'b0, r3=1'b0, r4=1'b0, r5 ;
    wire w0,w1 ;

    always @(posedge clk or posedge rst) r0 <= (rst)?1'b0:a ;
    always @(posedge clk or posedge rst) r1 <= (rst)?1'b1:a ;

    assign w0 = r0?!w0:w0 ;
    always @(posedge clk or posedge rst) r2 <= (rst)?1'b0:w0 ;
    always @(posedge clk or posedge r3 ) r3 <= (r3 )?1'b0:!r3;
    always @(posedge clk or posedge rst) r4 <= (rst)?1'b0:(r0^r1^r3) ;

    stlist st ;
    always @(posedge clk) begin
	case (st)
	  st0 : if ( a ) st <= st1 ;
	  st1 : if ( b ) st <= st2 ;
	  st2 : if (a&b) st <= st3 ;
	  st3 : if (a^b) st <= st0 ;
	endcase // case (st)
    end
    always @(posedge clk or posedge rst) x <= (rst)?1'b0:((st==st3)?1'b1:r4) ;
    always @(posedge clk or posedge rst) y <= w1 ;
endmodule // gld

		 
