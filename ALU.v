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
input [3:0] a,b;
input cin;
output [3:0] sum; 
output cout;
assign {cout,sum} = a + b + cin;
endmodule
