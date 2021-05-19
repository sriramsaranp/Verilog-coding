module testbench;
reg [15:0] A , B;
wire [15:0] C;
wire CY,S,Zr,OF,PR;

ALU DUT(.sign(S), .zero(Zr), .parity(PR), .carry(CY), .overflow(OF), .X(A), .Y(B), .Z(C));

initial begin
    $dumpfile("ALU.vcd");
    $dumpvars(0,testbench);
    $monitor($time, " A = %h, B = %h, C = %h, CY = %b, S = %b, Zr = %b, OF = %b, PR = %b", A,B,C,CY,S,Zr,OF,PR);
    #5 A = 16'h8fff; B = 16'h8000;
    #5 A = 16'hfffe; B = 16'h0002;
    #5 A = 16'haaaa; B = 16'h5555;
    #5 $finish;
end
endmodule