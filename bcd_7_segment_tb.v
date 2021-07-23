module testbench;
reg [3:0] in;
wire [6:0] out;

bcd_to_7seg DUT(in,out);
initial begin
    in = 1; #10 in = 2; #10 in = 3; #10 in = 4;
    #10 in = 0; #10 in = 5; #10 in = 6; #10 in = 7;
    #200 $finish;
end

initial begin
    $dumpfile("bcd_7_seg.vcd");
    $dumpvars(0,testbench);
    $monitor($time , " out = %b", out);
end
endmodule