module gld(input clk,as,cs,output xr, xw);
    wire wl0, wl1, wl2 ;
    assign wl0 = wl1 ^ cs ;
    assign wl1 = wl0 ^ cs ;
    assign wl2 = as ^ ra ;

    reg ra = 1'b0 ;
    always @(posedge clk or posedge wl2) if(wl2) ra <= ~ra ;

    assign xw = wl0 | wl1 ;
    assign xr = ra ;
endmodule // loop

    
