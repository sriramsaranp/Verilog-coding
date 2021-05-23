module RGY (clk, light);
input clk; 
output reg [2:0] light;
reg [2:0] state;
parameter s0 = 0, s1 = 1, s2 = 2;
parameter RED = 3'b100, GREEN = 3'b010, YELLOW = 3'b001;

always @(posedge clk) 
    case (state)
    s0 :  state <= s1; 
    s1 :  state <= s2; 
    s2 :  state <= s0; 
    default :  state <= s0; 
    endcase

always @(state)
case (state)
s0 : light = RED;
s1 : light = GREEN;
s2 : light = YELLOW;
default : light = RED;
endcase
    
endmodule