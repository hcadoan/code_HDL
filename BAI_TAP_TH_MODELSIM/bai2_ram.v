module bai2_ram(a,b,Cs,We,CLk,dataOUT);
input [3:0]a,b;
output [4:0]dataOUT;
input Cs,We,CLk;
wire [5:0]u;
wire [8:0]add;
Cong4bit H1(a,b,u,add);
ram      H2(u,add,Cs,We,CLk,dataOUT);
endmodule


module ram(DATA_IN,ADDRESS,CS,WE,CLK,DATA_OUT);
input [4:0]DATA_IN;
output reg [4:0]DATA_OUT;
input [7:0]ADDRESS;
input CS,WE,CLK;
reg [7:0]SRAM[255:0]; //SRAM c� 256 ??a ch?, m?i ??a ch? l?u data 8bit
always @ (posedge CLK)
begin
if (CS==1'b1)
begin
if (WE==1'b1)
SRAM[ADDRESS] <= DATA_IN;
else
DATA_OUT <= SRAM[ADDRESS] ;
end
else
DATA_OUT <= 8'bxxxxxxxx;
end
endmodule
//////////////
module Cong4bit(A,B,datain,addr);
input [3:0]A,B;
output reg [4:0]datain;
output reg [7:0] addr;
always @ (*)
begin
datain<=A+B;
addr={A,B};
end
endmodule
///
module TB_bai2_ram();
reg [3:0]a,b;
wire [4:0]dataOUT;
reg Cs,We,CLk;
initial
begin
CLk=0;
a=4'b0010;
b=4'b0011;
Cs=0;
We=0;
#100
// nh?p d? li?u
a=4'b0010;
b=4'b0011;
Cs=1;
We=1;
#100
a=4'b0011;
b=4'b0011;
Cs=1;
We=1;
#100
a=4'b0010;
b=4'b0111;
Cs=1;
We=1;
#100
//doc du lieu
a=4'b0010;
b=4'b0011;
Cs=1;
We=0;
#100
a=4'b0011;
b=4'b0011;
Cs=1;
We=0;
#100
a=4'b0010;
b=4'b0111;
Cs=1;
We=0;
#100
a=4'b0011;
b=4'b0011;
Cs=0;
We=0;
#100
a=4'b0010;
b=4'b0111;
Cs=0;
We=0;
#1000 $finish;
end
always @ (CLk)
#50 CLk<=~CLk;
bai2_ram D(.a(a),.b(b),.Cs(Cs),.We(We),.CLk(CLk),.dataOUT(dataOUT));
endmodule
