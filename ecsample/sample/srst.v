module srst(input clk,rsti,output rsto) ;
    reg rst = 1'b0 ;
    always @(posedge clk) if(rsti) rst <= 1'b1 ;
    assign rsto = rst ;
endmodule // srst
/* 
 rst is 0 when the system is going to reset.
 rst is 1 in opration mode.
 
 after power on, rst = 0.
 //with rsti posedge, rst becomes 1.
 when rsti is 1 synced with clock, rst becomes 1.
 */
