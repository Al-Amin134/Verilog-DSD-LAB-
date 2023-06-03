module excess3_to_bcd(b,e);
input [3:0]e;

output [3:0]b;

not (b[0],e[0]);

xor(b[1],e[0],e[1]);

wire ande1e2;

and (ande1e2,e[1],e[0]);

xnor(b[2],e[2],ande1e2);

wire ande3e1e0;
wire ande3e2;
and(ande3e2,e[3],e[2]);
and(ande3e1e0,e[3],e[1],e[0]);

or(b[3],ande3e1e0,ande3e2);

endmodule

module excess3_to_bcd_test;
reg [3:0]excess3;
wire [3:0] bcd;
excess3_to_bcd extobc(.b(bcd),
	.e(excess3)
	);

initial 
begin

 #0 excess3 = 4'b0011;
#100 excess3 = 4'b0100;
#100 excess3 = 4'b0101;
#100 excess3 = 4'b0110;
#100 excess3 = 4'b0111;
#100 excess3 = 4'b1000;
#100 excess3 = 4'b1001;
#100 excess3 = 4'b1010;
#100 excess3 = 4'b1011;
#100 excess3 = 4'b1100;
#100 excess3 = 4'b1101;
#100 excess3 = 4'b1110;
#100 excess3 = 4'b1111;

end


 endmodule