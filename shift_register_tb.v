module testbench;
reg in, clk, clr;
wire out;
shift_register DUT(clk, clr, in, out);

initial begin
    clk = 1'b0; #2 clr = 0; #5 clr = 1;
end

always #5 clk = ~clk;

initial begin
    #2;
    repeat(2)
    begin
        #10 in = 0; #10 in = 0; #10 in = 1; #10 in = 1;
    end
end

initial begin
    $dumpfile("Shifter.vcd");
    $dumpvars(0, testbench);
    #200 $finish;
end

endmodule