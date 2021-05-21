module AdderRCA (carry_out, a, b ,sum, carry_in
);
parameter N = 8;
input [N-1:0] a,b; input carry_in;
output carry_out;  output [N-1:0] sum;
wire [N:0] carry;
assign carry[0] = carry_in;
assign carry_out = carry[N];

genvar i;
generate for(i = 0; i<N; i = i+1)
begin 
    genvar fa_loop;
wire t1 , t2, t3;
xor g1(t1, a[i], b[i]), g2(sum[i], t1, carry[i]);
and g3(t2, a[i],b[i]), g4(t3 , t1, carry[i]);
or g5(carry[i+1], t2, t3);
end
endgenerate
endmodule