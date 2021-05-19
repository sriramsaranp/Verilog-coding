module testbench;
reg [15:0] A;
reg [3:0] S;
wire Y;
mux16to1 DUT (.in(A), .sel(S), .out(Y));

initial begin
    $dumpfile("mux16to1.vcd");
    $dumpvars(0,testbench);
    $monitor($time , " A = %h , S = %h , Y = %b", A,S,Y);
    #5 A = 16'h3F0A ; S = 4'h0;
    #5 S = 4'h1;
    #5 S = 4'h6;
    #5 S = 4'hC;
    #5 $finish;
end
endmodule


