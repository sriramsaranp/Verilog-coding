//D Flip Flop with Asynchronous Set and Reset
module dff (d, q, qbar, set, reset, clk);
input clk, set, reset, d;
output reg q;
output qbar;

assign qbar = ~q;

always @ (posedge clk or negedge set, negedge reset)

    if(set == 0) q <= 1;
    else if(reset == 0) q <= 0;
    else q <= d;
endmodule