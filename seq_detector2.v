//Detect the pattern 101010
//Number of states required is 6
module seq_detector_2 (clk,rst, x, z);
input x,clk, rst;
output reg z;
parameter s0 = 0, s1 = 1, s2 = 2, s3 = 3, s4 = 4, s5 = 5;
reg [2:0] PS,NS;
always @(posedge clk, posedge rst) begin
    if(rst) PS <= s0;
    else PS <= NS;
end

always @(PS, x) begin
    case (PS)
    s0 : begin
        NS = x ? s1 : s0;
        z = 0;
    end
    s1 : begin
        NS = x ? s1 : s2;
        z = 0;
    end
    s2 : begin
        NS = x ? s3 : s0;
        z = 0;
    end
    s3 : begin
        NS = x ? s1 : s4;
        z = 0;
    end
    s4 : begin
        NS = x ? s5 : s0;
        z = 0;
    end
    s5 : begin
        NS = x ? s1 : s4;
        z = x ? 0 : 1;
    end
    default : begin
        NS = s0;
    end 
    endcase
end
endmodule