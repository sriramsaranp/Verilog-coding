module testbench;
reg clk, clr;
wire [7:0] out;
binary_7_bit_counter DUT(clk,clr,out);

initial
    clk = 1'b0;

always #5 clk = ~clk;

initial begin
    clr = 1'b0;
    #10 clr = 1'b1;
    #20 clr = 1'b0;
    #200 $finish;
end

initial begin
    $dumpfile("Binary_counter.vcd");
    $dumpvars(0 , testbench);
    $monitor($time, " count = %d ",out);
end

endmodule