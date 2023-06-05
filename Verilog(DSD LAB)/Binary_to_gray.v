module binary_to_gray(b,g);
input [3:0]b;
output [3:0]g;


xor(g[0],b[0],b[1]);
xor(g[1],b[1],b[2]);
xor(g[2],b[2],b[3]);
or(g[3],b[3],b[3]);

endmodule

module binary_to_gray_test;

reg [3:0]binary;
wire [3:0]gray;

binary_to_gray gray1(.b(binary),.g(gray));
initial
begin

#0   binary = 4'b0001;
#100 binary = 4'b0010;
#100 binary = 4'b0011;
#100 binary = 4'b0100;

end



endmodule
