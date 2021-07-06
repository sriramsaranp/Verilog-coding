module testbench;
reg rst,clk;
wire [3:0] count;

BCD_counter DUT(rst,clk,count);

initial begin
    clk = 1'b0;
end
always #5 clk = ~clk;

initial begin
    rst = 1'b1;
    #12 rst = 1'b0;
    #200 $finish;
end

initial begin
    $dumpfile("BCD_counter.vcd");
    $dumpvars(0,testbench);
    $monitor($time , " count = %d ", count);
end
endmodule