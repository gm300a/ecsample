module bxbram(input clk,we0,ce0,we1,ce1,[7:0] adr,[7:0] di0,di1,output reg [7:0] dq0,dq1);
    reg [7:0] mem0[255:0] ;
    reg [7:0] mem1[255:0] ;
    always @(posedge clk) if(ce0) dq0 <= mem0[adr] ;
    always @(posedge clk) if(ce0&we0) mem0[adr] <= di0 ;
    always @(posedge clk) if(ce1) dq1 <= mem1[adr] ;
    always @(posedge clk) if(ce1&we1) mem1[adr] <= di1 ;
endmodule // bxbram
