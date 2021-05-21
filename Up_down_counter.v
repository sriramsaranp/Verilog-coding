// Synchronous Up - Down 8 bit counter
//Mode is 1 up counter
//Mode is 0 down counter
module Up_Down_counter (din, clr, ld, clk, mode, count);
input clr, ld, mode, clk;
input [7:0] din;
output reg [7:0] count;

always @(posedge clk)
begin 
    if(ld) count <= din;
    else if(clr) count <= 0;
    else if(mode) count <= count +1;
    else count <= count - 1;
end
endmodule