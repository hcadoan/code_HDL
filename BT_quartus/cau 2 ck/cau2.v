module cau2(LT,RBI,BI_RBO,A0,A1,A2,A3,a,b,c,d,e,f,g);
input LT,RBI,BI_RBO,A0,A1,A2,A3;
output a,b,c,d,e,f,g;
reg a,b,c,d,e,f,g;
always @ (*)
begin
if (BI_RBO == 0)
{a,b,c,d,e,f,g} = 7'b1111111;
else 
begin
if (LT == 0)
{a,b,c,d,e,f,g} = 7'b0000000;
else
begin
if ({RBI,A3,A2,A1,A0} == 5'b10000) {a,b,c,d,e,f,g} = 7'b0000001;
case({A3,A2,A1,A0})
4'b0001 : {a,b,c,d,e,f,g} = 7'b1001111;
4'b0010 : {a,b,c,d,e,f,g} = 7'b0010010;
4'b0011 : {a,b,c,d,e,f,g} = 7'b0000110;
4'b0100 : {a,b,c,d,e,f,g} = 7'b1001100;
4'b0101 : {a,b,c,d,e,f,g} = 7'b0100100;
4'b0110 : {a,b,c,d,e,f,g} = 7'b1100000;
4'b0111 : {a,b,c,d,e,f,g} = 7'b0001111;
4'b1000 : {a,b,c,d,e,f,g} = 7'b0000000;
4'b1001 : {a,b,c,d,e,f,g} = 7'b0001100;
4'b1010 : {a,b,c,d,e,f,g} = 7'b1110010;
4'b1011 : {a,b,c,d,e,f,g} = 7'b1100110;
4'b1100 : {a,b,c,d,e,f,g} = 7'b1011100;
4'b1101 : {a,b,c,d,e,f,g} = 7'b0110100;
4'b1110 : {a,b,c,d,e,f,g} = 7'b1110000;
4'b1111 : {a,b,c,d,e,f,g} = 7'b1111111;
endcase
end
end
end
endmodule




