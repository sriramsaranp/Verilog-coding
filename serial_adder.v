module serial_adder (clk, rst, x, y, z);
input clk, rst, x, y;
output reg z;
parameter s0 = 0, s1 = 1;
reg PS,NS;
always @(posedge clk, posedge rst) begin
    if(rst) PS <= s0;
    else PS <= NS;
end

always @(PS, x, y) begin
    case (PS)
    s0 : begin
        if({x,y} == 0) begin NS = s0; z = 0; end
        else if({x,y} == 1) begin NS = s0; z =1; end 
        else if({x,y} == 2) begin NS = s0; z = 1; end 
        else if({x,y} == 3) begin NS = s1; z = 0; end 
    end
    s1 : begin
        if({x,y} == 0) begin NS = s0; z = 1; end
        else if({x,y} == 1) begin NS = s1; z =0; end 
        else if({x,y} == 2) begin NS = s1; z = 0; end 
        else if({x,y} == 3)begin NS = s1; z = 1; end  
    end
    default : begin NS = s0; z = 0; end
    endcase
end
    
endmodule