module fulladder(A,B,CIN,S,COUT);
input A,B,CIN;
output COUT,S;
wire andAB;
wire xorAB;
wire andCxorAB;
and(andAB,A,B);
xor(xorAB,A,B);
and(andCxorAB,xorAB,CIN);
or(COUT,andCxorAB,andAB);
xor(S,A,B,CIN);
 endmodule

 module fulladderTest();
 reg a,b,cin;
 wire s,cout;

 fulladder f1(.A(a),.B(b),.CIN(cin),.S(s),.COUT(cout));
 initial begin
    #0 a=1'b0;b=1'b1;cin=1'b0;
    #100 a=1'b1;b=1'b0;cin=1'b0;
    #100 a=1'b0;b=1'b1;cin=1'b0;
    #100 a=1'b1;b=1'b0;cin=1'b0;
    #100 a=1'b0;b=1'b1;cin=1'b0;
    #100 a=1'b1;b=1'b0;cin=1'b0;

 end

    endmodule