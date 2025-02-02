//bai 8: 8 led s�ng ?u?i v� s�ng d?n 
//c : current_state
//n : next_state
//y[7:0]: 8 led ??n

module FSM8(ck,rs,s,y,c);
parameter tat = 4'b0000;
parameter S0 = 4'b0001; 
parameter S1 = 4'b0010;
parameter S2 = 4'b0011; 
parameter S3 = 4'b0100;
parameter S4 = 4'b0101; 
parameter S5 = 4'b0110;
parameter S6 = 4'b0111; 
parameter S7 = 4'b1000;
parameter S8 = 4'b1001; 
parameter S9 = 4'b1010;
parameter S10 = 4'b1011; 
parameter S11 = 4'b1100;
parameter S12 = 4'b1101; 
parameter S13 = 4'b1110;
parameter S14 = 4'b1111;
input ck,rs,s;
output [7:0]y;
output [3:0] c;
reg [7:0]y;
reg [3:0] c,n;
always @ (*)
begin
case(c)
tat : n = S0;
S0 : if(s) n = S8;
     else n = S1;
S1 : if(!s) n= S2;
     else n = tat;
S2 :  if(!s) n= S3;
     else n = tat;
S3 : if(!s) n= S4;
     else n = tat;
S4 :  if(!s) n= S5;
     else n = tat;
S5 : if(!s) n= S6;
     else n = tat;
S6 :  if(!s) n= S7;
     else n = tat;
S7 : n = tat;
S8 : if(s) n= S9;
     else n = tat;
S9 : if(s) n= S10;
     else n = tat;
S10 : if(s) n= S11;
     else n = tat;
S11 : if(s) n= S12;
     else n = tat;
S12 : if(s) n= S13;
     else n = tat;
S13 :if(s) n= S14;
     else n = tat;
S14 :n = tat;
default n = tat;
endcase
end
always @ (posedge ck)
begin
if(rs == 1)
c <= tat;
else c <= n;
end
always @ (*)
begin
case(c)
tat : y = 8'b00000000;
S0 : y = 8'b10000000;
S1 : y = 8'b01000000;
S2 : y = 8'b00100000;
S3 : y = 8'b00010000;
S4 : y = 8'b00001000;
S5 : y = 8'b00000100;
S6 : y = 8'b00000010;
S7 : y = 8'b00000001;
S8 : y = 8'b11000000;
S9 : y = 8'b11100000;
S10 : y = 8'b11110000;
S11 : y = 8'b11111000;
S12 : y = 8'b11111100;
S13 : y = 8'b11111110;
S14 : y = 8'b11111111;
endcase
end
endmodule

module TB_FSM8();
reg ck,rs,s;
wire [3:0]c;
wire [7:0]y;
initial
begin
ck = 0;
rs = 1;
s = 1;
#100
rs = 0;
s = 0;
#500
rs = 0;
s = 1;
#400
rs = 0;
s = 0;
#500
rs = 0;
s = 1;
#400
rs = 1;
s = 1;
#325
rs = 0;
s = 0;
#2500 $finish;
end
always @(ck)
#50 ck<=~ck;
FSM8 U(.ck(ck),.rs(rs),.c(c),.s(s),.y(y));
endmodule

