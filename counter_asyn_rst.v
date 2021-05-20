//4 bit counter using Asynchronous Reset

module counter_asyn_rst(clk, count, rst);
input clk, rst;
output reg [3:0] count;

always @ (posedge clk, posedge rst)

    if(rst) count <= 0;
    else count = count + 1;
    
endmodule