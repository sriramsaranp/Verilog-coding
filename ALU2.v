module ALU (X, Y, Z, carry, sign, overflow, parity, zero);
input [15:0] X, Y;
output [15:0] Z;
output carry, sign, overflow, parity, zero;
wire c1,c2,c3;
adder4 A0 (X[3:0] , Y[3:0] , c1, Z[3:0], 1'b0);
adder4 A1 (X[7:4] , Y[7:4] , c2, Z[7:4], c1);
adder4 A2 (X[11:8] , Y[11:8] , c3, Z[11:8], c2);
adder4 A3 (X[15:12] , Y[15:12] , carry, Z[15:12], c3);
assign sign = Z[15];
assign zero = ~|Z;
assign parity = ~^Z;
assign overflow = (X[15] & Y[15] & ~Z[15]) | (~X[15] & ~Y[15] & Z[15]);
endmodule

module adder4(a,b,cout,sum,cin);
//Implementing using Concept of Carry Look Ahead Adder
input [3:0] a,b;
input cin;
output [3:0] sum; 
output cout;

//Calculate all generators and propagators
wire g0,g1,g2,g3,p0,p1,p2,p3 , c1,c2,c3;
assign g0 = a[0] & b[0], g1 = a[1] & b[1], g2 = a[2] & b[2], g3 = a[3] & b[3];
assign p0 = a[0] ^ b[0], p1 = a[1] ^ b[1], p2 = a[2] ^ b[2], p3 = a[3] ^ b[3];

assign c1 = g0 | (p0 & cin), c2 = g1 | (p1 & g0) | (p1 & p0 & cin);
assign c3 = g2 | (p2 & g1) | (p2 & p1 & g0) | (p2 & p1 & p0 & cin);
assign cout = g3 | (p3 & p2 & g1) | (p3 & p2 & p1 & g0) | (p3 & p2 & p1 & p0 & cin); 

assign sum[0] = p0 ^ cin;
assign sum[1] = p1 ^ c1;
assign sum[2] = p2 ^ c2;
assign sum[3] = p3 ^ c3;
endmodule
