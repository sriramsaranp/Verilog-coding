//The variables declared in this block will be inside the brackets() in DUT//
module testbench;
reg [15:0] x, y;
wire [15:0] f;
Xor_bitwise DUT (.out(f), .a(x), .b(y));

initial begin
    $monitor($time, " x = %b , y = %b , f = %b", x,y,f);
    x = 16'haaaa; y = 16'h00ff;
    #5 x = 16'h0f0f; y = 16'h3333;
    #10 $finish;
end
    
endmodule