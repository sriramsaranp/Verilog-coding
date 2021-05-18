module testbench;
reg a,b,c;
wire s,cy;
full_adder DUT(a,b,c,s,cy);
initial begin
    $dumpfile("full_adder.vcd");
    $dumpvars(0,testbench);
    $monitor($time , " a = %b, b = %b, c = %b, s = %b, cy = %b", a,b,c,s,cy);
    #5 a = 1; b = 1; c = 0;
    #5 a = 0; b = 0; c = 1;
    #5 a = 1; b = 1; c = 1;
    #5 $finish;
end
endmodule