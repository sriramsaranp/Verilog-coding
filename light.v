module RGY (clk, light);
input clk; 
output reg [2:0] light;
reg [2:0] state;
parameter s0 = 0, s1 = 1, s2 = 2;
parameter RED = 3'b100, GREEN = 3'b010, YELLOW = 3'b001;

always @(posedge clk) begin
    case (state)
    s0 : begin light <= GREEN; state <= s1; end
    s1 : begin light <= YELLOW; state <= s2; end
    s2 : begin light <= RED; state <= s0; end
    default : begin light <= RED; state <= s0; end
    endcase
end
    
endmodule