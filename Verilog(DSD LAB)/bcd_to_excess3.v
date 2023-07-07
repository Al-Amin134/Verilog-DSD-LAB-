module bcd_to_excess3 (e,b);
input [3:0]b;
output [3:0]e;
wire or_b0_b1;
wire andb2_orb0_b1;
or(or_b0_b1,b[0],b[1]);
and(andb2_orb0_b1,b[2],or_b0_b1);
or(e[3],b[3],andb2_orb0_b1);
xor(e[2],b[2],or_b0_b1);
xnor(e[1],b[1],b[0]);
not(e[0],b[0]);
    
endmodule

module bcd_to_excess3_tester;

reg [3:0]b;
wire [3:0]e;

bcd_to_excess3 bcd(e,b);
initial
begin
     #0 b =   4'b0001;
     #100 b = 4'b0010;
     #100 b = 4'b0011;
     #100 b = 4'b0100;
     #100 b = 4'b0101;
     #100 b = 4'b0110;
     #100 b = 4'b0111;
     #100 b=  4'b1000;
     #100 b = 4'b1001;
     #100 b = 4'b1010;
     #100 b = 4'b1011;
     #100 b = 4'b1100;
end

endmodule
