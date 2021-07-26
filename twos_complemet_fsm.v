module twos_complement(x,clk,rst,z);
input x, clk,rst;
output reg z;
parameter s0 = 1'b0, s1 = 1'b1;
reg NS , PS;

always @(posedge clk , negedge rst) begin
    if(rst) PS <= s0;
    else PS <= NS;
end

always @(x,PS) begin
    case (PS)
    s0 : begin NS = x ? s1 : s0; z = x ? 1 : 0; end
    s1 : begin NS = s1; z = x ? 0 : 1; end
    endcase
end

endmodule