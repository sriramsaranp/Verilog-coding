module clock_generator;
output reg clk;

inital 
clk = 0;
 begin
    
always 
#5 clk = ~clk;

initial 
#500 $finish;

endmodule
