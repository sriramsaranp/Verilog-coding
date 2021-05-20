module counter(clk,rst,count);
input clk,rst;
output count;

always @(posedge clk) 
initial begin
    if(rst) count = 0;
    else count = count+1;
end
endmodule