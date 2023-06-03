module gray_to_binary(b,g);
input [3:0]g;
output [3:0]b;

xor(b[0],g[3],g[2],g[1],g[0]);
xor(b[1],g[3],g[2],g[1]);
xor(b[2],g[3],g[2]);
or(b[3],g[3],g[3]);

endmodule

module gray_to_binary_test;

reg [3:0]gray;
wire [3:0]binary;

gray_to_binary binary1(.b(binary),.g(gray));
initial
begin

#0   gray = 4'b0001;
#100 gray = 4'b0010;
#100 gray = 4'b0011;
#100 gray = 4'b0100;

end



endmodule