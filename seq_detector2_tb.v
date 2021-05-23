module testbench;
reg clk, x, rst;
wire z;

seq_detector_2 DUT(clk, rst, x, z);

initial begin
    clk = 1'b0;
    rst = 1'b1;
    #15 rst = 1'b0;    
end

always #5 clk = ~ clk;

initial begin
    $dumpfile("seq_detector2.vcd");
    $dumpvars(0, testbench);
    #12 x = 1; #10 x = 1; #10 x = 0;#10 x = 1; #10 x = 0;#10 x = 1; #10 x = 0; 
    #10 x = 1; #10 x = 0;#10 x = 1; #10 x = 0;#10 x = 1; #10 x = 1;#10 x = 1; #10 x = 1;
    #200 $finish;
end
endmodule