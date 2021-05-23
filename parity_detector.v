module parity_detector (clk, x, z);
input clk, x;
output reg z;
reg state;
parameter EVEN = 1'b0, ODD = 1'b1;

always @(posedge clk)
    case (state)
    EVEN : state <= x ? ODD : EVEN;
    ODD : state <= x ? EVEN : ODD;
    default : state <= EVEN;
    endcase

always @(state)
case (state)
EVEN : z = 0;
ODD : z = 1;
default : z = 0;
endcase

endmodule