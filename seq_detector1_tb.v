module testbench;
reg clk, x, reset;
wire z;

seq_detector DUT(clk, x, reset, z);

initial begin
    clk = 1'b0;
    reset = 1'b1;
    #15 reset = 1'b0;
end
always #5 clk = ~ clk;

initial begin
    $dumpfile("seq_detector.vcd");
    $dumpvars(0, testbench);
    #12 x = 0; #10 x = 0; #10 x= 1; #10 x = 1;
    #10 x = 0; #10 x = 0; #10 x = 1; #10 x = 1;
    #10 x = 0; #10 x = 1; #10 x = 1; #10 x = 0;
    #200 $finish;
end
endmodule