module tb();
// "-1-" + "01-" => 011
//    reg clka ;
    initial begin
       #10000 ;
        #1000 clka = 1'b0;
        #1000 clka = 1'b1;
        #1000 clka = 1'b1;
    end
// "--" + "-01" => 001
//    reg clkb ;
    initial begin
       #10000 ;
        #1000 clkb = 1'b0;
        #1000 clkb = 1'b0;
        #1000 clkb = 1'b1;
    end
// "--" + "1-" => 11
//    reg cnt ;
    initial begin
       #10000 ;
        #1000 cnt = 1'b1;
        #1000 cnt = 1'b1;
    end
// "0-" + "01" => 01
//    reg r0[0] ;
    initial begin
       #10000 ;
        #1000 r0[0] = 1'b0;
        #1000 r0[0] = 1'b1;
    end
    initial #23000 $finish();
    dut U1 (..) ;
endmodule
