module testbench;
reg clk ;
wire [2:0] light;

RGY DUT(clk, light);

initial clk = 1'b0;

always #5 clk = ~clk;

initial begin
    $dumpfile("Lights.vcd");
    $dumpvars(0, testbench);
    $monitor($time , " RGY = %b", light);
    #100 $finish;
end
endmodule