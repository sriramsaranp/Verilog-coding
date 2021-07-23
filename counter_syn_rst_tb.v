module testbench;
reg Clk,Rst;
wire [0:8] out;

counter DUT(Clk,Rst,out);

initial begin
    Clk = 1'b0;
    Rst = 1'b1;
    #12 Rst = 1'b0;
    #200 $finish;
end

always #5 Clk = ~Clk;

initial begin
    $dumpfile("counter_syn_rst.vcd");
    $dumpvars(0,testbench);
    $monitor($time, " out = %d", out);
end
endmodule


