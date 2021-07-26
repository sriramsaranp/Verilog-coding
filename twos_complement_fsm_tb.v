module testbench;
reg x,Clk,reset;
wire z;

twos_complement DUT(x,Clk,reset,z);
initial begin
    Clk = 1'b0;
    reset = 1'b1;
    #12 reset = 1'b0;
    #200 $finish;
end

always #5 Clk = ~Clk;

initial begin
    $dumpfile("2scomplement.vcd");
    $dumpvars(0,testbench);
    x = 1'b0; #5 x = 1'b1; #5 x = 1'b1; #5 x = 1'b0; #5
    x = 1'b1; #5 x = 1'b0; #5 x = 1'b1; #5 x = 1'b1; #5
    x = 1'b0; #5 x = 1'b0; #5 x = 1'b1; #5 x = 1'b1; #5
    x = 1'b1; #5 x = 1'b0; #5 x = 1'b0; #5 x = 1'b1; 
end
endmodule