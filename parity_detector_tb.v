module testbench;
reg clk, x;
wire z;

parity_detector DUT(clk, x, z);

initial
    clk = 1'b0;

always #5 clk = ~ clk;

initial begin
    $dumpfile("Parity.vcd");
    $dumpvars(0, testbench);
    #2 x = 0; #10 x = 1; #10 x = 1; #10 x = 0;
    #10 x = 1; #10 x = 1; #10 x = 0; #10 x = 1;
    #200 $finish;
end
endmodule