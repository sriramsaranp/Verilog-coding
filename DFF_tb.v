module testbench;
reg D,Set,Reset,Clk;
wire out, out_bar;
DFF DUT(D,Set,Reset,out,out_bar,Clk);

initial begin
    Clk = 1'b0;
end
always #5 Clk = ~Clk;

initial begin
    Reset = 1'b1;
    Set = 1'b0;
    #12 Reset = 1'b1;
    #12 Set = 1'b1;
    D = 1'b0; #5 D = 1'b1; #15 D = 1'b0; #10 D = 1'b1;
    #15 D = 1'b1; #5 D = 1'b0;
    #300 $finish;
end

initial begin
    $dumpfile("DFF.vcd");
    $dumpvars(0,testbench);
end

endmodule