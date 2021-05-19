module testbench;
reg Set, Reset ;
wire Out,Outbar;
S_R_Latch DUT(.S(Set), .R(Reset), .Q(Out), .Qbar(Outbar));

initial begin
    $dumpfile("S_R_Latch.vcd");
    $dumpvars(0,testbench);
    $monitor($time , " Set = %b, Reset = %b , Out = %b, Outbar = %b", Set,Reset,Out,Outbar);
    #5 Set = 1'b0; Reset = 1'b1;
    #5 Set = 1'b1; Reset = 1'b1;
    #5 Set = 1'b1; Reset = 1'b0;
    #5 Set = 1'b0; Reset = 1'b0;
    #5 Set = 1'b1; Reset = 1'b1;
    #5 $finish;

end
endmodule