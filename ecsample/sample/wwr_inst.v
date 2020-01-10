module writewriteB(input clk, rst, i1, i2, s1, s2, output o);
    reg o0,o1,o2;
    assign o = o0 ^ o1 ^ o2 ;
    always @(posedge clk) if(rst) o0 = 0;
    always @(posedge clk) if(!rst && s1) o1 = i1;
    always @(posedge clk) if(!rst && s2) o2 = i2;
endmodule
module writewriteA(input clk, rst, i1, i2, s1, s2, output o);
    reg o;
    always @(posedge clk) if(rst) o = 0;
    always @(posedge clk) if(!rst && s1) o = i1;
    always @(posedge clk) if(!rst && s2) o = i2;
endmodule

module top(input clk, rst, i1, s1, output oa,ob);
    writewriteA iA(clk, rst, i1, !i1, s1, !s1, oa);
    writewriteB iB(clk, rst, i1, !i1, s1, !s1, ob);
endmodule
