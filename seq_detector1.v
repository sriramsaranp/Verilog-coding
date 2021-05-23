//The output becomes 1 when it detects the sequence "0110" with overlapping intervals

module seq_detector (clk , x , reset, z);
input clk, x, reset;
output reg z;
parameter s0 = 0, s1 = 1, s2 = 2, s3 = 3;
reg [1:0] PS,NS;

always @(posedge clk, posedge reset) begin
    if(reset) PS <= s0;
    else PS <= NS;
end

always @(x, PS) begin
    case (PS)
    s0 : begin NS = x ? s0 : s1; z = 0; end 
    s1 : begin NS = x ? s2 : s1; z = 0; end 
    s2 : begin NS = x ? s3 : s1; z = 0; end 
    s3 : begin NS = x ? s0 : s1; z = x ? 0 : 1; end
    endcase
end

endmodule