module tb();
// 0 + - => 0
    initial begin
       #10000 ;
        #1000 U1.U0.x[7] = 1'b0;
    end
    initial #21000 $finish();
dut U1 (..) ;
endmodule
