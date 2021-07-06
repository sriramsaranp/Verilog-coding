module BCD_counter(rst,clk,count);
input rst,clk;
output reg [3:0] count;
initial begin
    count = 4'b0000;
end
always @(posedge clk)
begin
    if(rst) count <= 4'b0000;
    else if(count <= 8) count <= count +1;
    else count <= 0;
end
endmodule
