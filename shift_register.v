module shift_register(clk, clr, A, E);
reg B, C, D;
input A, clk, clr;
output reg E;

always @(posedge clk, negedge clr)
begin
    if(!clr) 
    begin 
        B <= 0;
        C <= 0;
        D <= 0;
        E <= 0;
    end
    else
    begin 
        B <= A;
        C <= B;
        D <= C;
        E <= D;
    end
end
endmodule
