//D Flip Flop with Synchronous Set and Reset
module DFF (D, Set, Reset, Q, Qbar, Clk);
input D,Set,Reset,Clk;
output reg Q;
output Qbar;
assign Qbar = ~Q;

always @ (posedge Clk) 

    if(Reset == 0) Q <= 0;
    else if(Set == 0) Q <= 1;
    else Q <= D;

endmodule
