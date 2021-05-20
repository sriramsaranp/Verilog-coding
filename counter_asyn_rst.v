//4 bit counter using Asynchronous Reset

module counter_asyn_rst (clk, count, rst);
input clk, rst;
output reg [3:0] count;

always @ (posedge clk, posedge rst)
initial begin
    if(rst) count <= 4'b0;
    else count = count + 1;
end
endmodule