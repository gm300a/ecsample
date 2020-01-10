// modify module name from hieds => hied. (no S)
// modify referencing net name from c33 to rst0
module hied(input clk,arst_n,srst,sset,d0,output rsto,reg dq) ;
    reg c31=1'b1, c33=1'b1,endf=1'b0 ;
    wire arst ;
    assign arst = !arst_n ;
    wire plllock,grst ;
    assign plllock = 1'b1 ;
    assign grst = arst & (!endf) ;
    assign rst = !plllock | grst ;
    always @(posedge clk or posedge grst) c31 <= (grst)?1'b1: rst ;
    always @(posedge clk or posedge grst) c33 <= (grst)?1'b1: c31 ;
    wire erst ;
    assign erst = (endf|sset) & (!srst) ;
    always @(posedge clk or posedge c33) endf <= (c33)?1'b0:erst ;

    always @(posedge clk or posedge rsto) dq <= (rsto)?1'b0: d0 ;
    assign rsto = c33 ;
endmodule // hied
