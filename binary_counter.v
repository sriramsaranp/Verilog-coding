module binary_7_bit_counter (clk, clr, count);
parameter N = 7;
input clk, clr;
output reg [0:N] count;

always @(negedge clk) begin
    if(clr) count <= 0;
    else count <= count + 1;
end
    
endmodule