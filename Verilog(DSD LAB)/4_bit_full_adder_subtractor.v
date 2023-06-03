module full_adder(s,cout,a,b,cin);
input a,b,cin;
output s,cout;
wire xor_ab;
wire and_ab;
wire and_c_xor_ab;
and(and_ab,a,b);
xor(xor_ab,a,b);
and(and_c_xor_ab,cin,xor_ab);
xor(s,a,b,cin);
or(cout,and_c_xor_ab,and_ab);

endmodule

module four_bit_adder_subtractor(s,cout,a,b,cin);
input [3:0]a,b;
input cin;
output [3:0]s;
output cout;

wire [3:0]complement;
xor(complement[0],b[0],cin);
xor(complement[1],b[1],cin);
xor(complement[2],b[2],cin);
xor(complement[3],b[3],cin);

wire [3:1]c;

full_adder fa0(s[0],c[1],a[0],complement[0],cin);
full_adder fa1(s[1],c[2],a[1],complement[1],c[1]);
full_adder fa2(s[2],c[3],a[2],complement[2],c[2]);
full_adder fa3(s[3],cout,a[3],complement[3],c[3]);

endmodule

module four_bit_adder_subtructor_tester;

reg [3:0]a,b;
reg cin;
wire [3:0]s;
wire cout;

four_bit_adder_subtractor four_a_s(s,cout,a,b,cin);
initial
begin

         #0  a = 4'b11;   b = 4'b1;    cin = 0; // 4
        #50 a = 4'b100;  b = 4'b10;   cin = 0; // 6
        #50 a = 4'b101;  b = 4'b110;  cin = 0; // 11
        #50 a = 4'b110;  b = 4'b111;  cin = 0; // 13
        #50 a = 4'b111;  b = 4'b1000; cin = 0; // 15
        #50 a = 4'b1001; b = 4'b1000; cin = 1; // 1
        #50 a = 4'b1001; b = 4'b11;   cin = 1; // 6
        #50 a = 4'b1100; b = 4'b1000; cin = 1; // 4
        #50 a = 4'b1100; b = 4'b11;   cin = 1; // 9
end




endmodule