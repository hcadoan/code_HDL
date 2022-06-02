module IC74LS151(A,B,C,D,STB,E,W);
input A,B,C,D;
input STB;
input [15:0]E;
output W;
reg W;
always@(*)
begin
if(STB == 1)
W = 1;
else
begin
case({D,C,B,A})
4'b0000 : W = ~E[0];
4'b0001 : W = ~E[1];
4'b0010 : W = ~E[2];
4'b0011 : W = ~E[3];
4'b0100 : W = ~E[4];
4'b0101 : W = ~E[5];
4'b0110 : W = ~E[6];
4'b0111 : W = ~E[7];
4'b1000 : W = ~E[8];
4'b1001 : W = ~E[9];
4'b1010 : W = ~E[10];
4'b1011 : W = ~E[11];
4'b1100 : W = ~E[12];
4'b1101 : W = ~E[13];
4'b1110 : W = ~E[14];
4'b1111 : W = ~E[15];
endcase
end
end
endmodule
module TB_IC74LS151();
reg A,B,C,D;
reg STB;
reg [15:0]E;
wire W;
initial
begin
STB = 1;
{D,C,B,A} = 4'b0000;
E = 16'b1111111111111110;
#100
STB = 1;
{D,C,B,A} = 4'b0000;
E = 16'b0000000000000001;
#100
STB = 0;
{D,C,B,A} = 4'b0000;
E = 16'b0000000000000001;
#100
STB = 0;
{D,C,B,A} = 4'b0001;
E = 16'b0000000000000010;
#100
STB = 0;
{D,C,B,A} = 4'b0010;
E = 16'b0000000000000100;
#100
STB = 0;
{D,C,B,A} = 4'b0011;
E = 16'b0000000000001000;
#100
STB = 0;
{D,C,B,A} = 4'b0100;
E = 16'b0000000000010000;
#100
STB = 0;
{D,C,B,A} = 4'b0101;
E = 16'b0000000000100000;
#100
STB = 0;
{D,C,B,A} = 4'b0110;
E = 16'b0000000001000000;
#100
STB = 0;
{D,C,B,A} = 4'b0111;
E = 16'b0000000010000000;
#100
STB = 0;
{D,C,B,A} = 4'b1000;
E = 16'b0000000100000000;
#100
STB = 0;
{D,C,B,A} = 4'b1001;
E = 16'b0000001000000000;
#100
STB = 0;
{D,C,B,A} = 4'b1010;
E = 16'b0000010000000000;
#100
STB = 0;
{D,C,B,A} = 4'b1011;
E = 16'b0000100000000000;
#100
STB = 0;
{D,C,B,A} = 4'b1100;
E = 16'b0001000000000000;
#100
STB = 0;
{D,C,B,A} = 4'b1101;
E = 16'b0010000000000000;
#100
STB = 0;
{D,C,B,A} = 4'b1110;
E = 16'b0100000000000000;
#100
STB = 0;
{D,C,B,A} = 4'b1111;
E = 16'b1000000000000000;
#100
STB = 0;
{D,C,B,A} = 4'b0000;
E = 16'b1111111111111110;
#100
STB = 0;
{D,C,B,A} = 4'b0001;
E = 16'b1111111111111101;
#100
STB = 0;
{D,C,B,A} = 4'b0010;
E = 16'b1111111111111011;
#100
STB = 0;
{D,C,B,A} = 4'b0011;
E = 16'b1111111111110111;
#100
STB = 0;
{D,C,B,A} = 4'b0100;
E = 16'b1111111111101111;
#100
STB = 0;
{D,C,B,A} = 4'b0101;
E = 16'b1111111111011111;
#100
STB = 0;
{D,C,B,A} = 4'b0110;
E = 16'b1111111110111111;
#100
STB = 0;
{D,C,B,A} = 4'b0111;
E = 16'b1111111101111111;
#100
STB = 0;
{D,C,B,A} = 4'b1000;
E = 16'b1111111011111111;
#100
STB = 0;
{D,C,B,A} = 4'b1001;
E = 16'b1111110111111111;
#100
STB = 0;
{D,C,B,A} = 4'b1010;
E = 16'b1111101111111111;
#100
STB = 0;
{D,C,B,A} = 4'b1011;
E = 16'b1111011111111111;
#100
STB = 0;
{D,C,B,A} = 4'b1100;
E = 16'b1110111111111111;
#100
STB = 0;
{D,C,B,A} = 4'b1101;
E = 16'b1101111111111111;
#100
STB = 0;
{D,C,B,A} = 4'b1110;
E = 16'b1011111111111111;
#100
STB = 0;
{D,C,B,A} = 4'b1111;
E = 16'b0111111111111111;
#3500 $finish;
end
IC74LS151 d(.STB(STB),.D(D),.C(C),.B(B),.A(A),.E(E),.W(W));
endmodule
