// Module for a 8 bit Ring Counter.
//Two methods has been discussed below
module Ring_Counter (init, clk, count);
input [7:0] init;
input clk;
output reg [7:0] count;

always @(posedge clk) begin
    if(init) count = 8'b10000000;
    else begin
        count <= count << 1;
        count[0] <= count[7];

        //Instead of the above two statements you can also write
        //count = {count[6:0], count[7]};
    end
end

endmodule