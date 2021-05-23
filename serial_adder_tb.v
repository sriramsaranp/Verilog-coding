module testbench;
reg clk, rst, x, y;
wire z;

serial_adder DUT(clk, rst, x, y, z);

initial begin
    clk = 1'b0;
    rst = 1'b1;
    #15 rst = 1'b0;
end

always #5 clk = ~ clk;

initial begin
    $dumpfile("serial_adder.vcd");
    $dumpvars(0, testbench);
    $monitor($time , " x = %b y = %b z = %b ", x,y,z);
    #12 x = 0; y = 0; #10 x = 1; y = 1; #10 x = 1; y = 0; #10 x = 0; y = 1;
    #10 x = 1; y = 1; #10 x = 0; y = 0; #10 x = 1; y = 0; #10 x = 1; y = 1;
    #200 $finish;
end
endmodule