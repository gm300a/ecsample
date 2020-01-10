module tb();
// "-1" + "--" => 01
//    reg A ;
    initial begin
       #10000 ;
        #1000 A = 1'b0;
        #1000 A = 1'b1;
    end
// "---" + "--0" => 000
//    reg CLK ;
    initial begin
       #10000 ;
        #1000 CLK = 1'b0;
        #1000 CLK = 1'b0;
        #1000 CLK = 1'b0;
    end
// "-10" + "--" => 010
//    reg RST_N ;
    initial begin
       #10000 ;
        #1000 RST_N = 1'b0;
        #1000 RST_N = 1'b1;
        #1000 RST_N = 1'b0;
    end
    initial #22000 $finish();
    dut U1 (..) ;
endmodule
