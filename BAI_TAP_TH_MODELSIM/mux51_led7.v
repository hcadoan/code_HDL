// SW: ng� v�o select bo mux51
// SW1,SW2,SW3,SW4,SW5: ng� v�o data bo mux51
// M[2:0] : ng� ra bo mux51
// HEX0 : ng� ra noi v�o led 7 doan

module mux51_led7(SW,SW1,SW2,SW3,SW4,SW5,HEX0);
input [2:0]SW,SW1,SW2,SW3,SW4,SW5;
output [7:0]HEX0;
wire [2:0]M;
mux51_3bit u1(SW,SW1,SW2,SW3,SW4,SW5,M);
giaima_led7 u2(M,HEX0);
endmodule

module mux51_3bit(S,A,B,C,D,E,M);
input [2:0]S,A,B,C,D,E;
output reg[2:0]M;
always @(*)
begin
case(S)
3'b000: M=A;
3'b001: M=B;
3'b010: M=C;
3'b011: M=D;
3'b100: M=E;
endcase
end
endmodule

module giaima_led7(M,HEX0);
input [2:0]M;
output reg[7:0]HEX0;
always @(M)
begin
case(M)
3'b000: HEX0 = 8'h89; //H
3'b001: HEX0 = 8'h86; //E
3'b010: HEX0 = 8'hC7; //L
3'b011: HEX0 = 8'hC7; //L
3'b100: HEX0 = 8'hC0; //O
3'b101: HEX0 = 8'hFF; //t?t
3'b110: HEX0 = 8'hFF; //t?t
3'b111: HEX0 = 8'hFF; //t?t
endcase
end
endmodule

module TB_mux51_led7();
reg [2:0]SW,SW1,SW2,SW3,SW4,SW5;
wire [7:0]HEX0;
initial
begin
SW = 3'b000;
SW1 = 3'b000;
SW2 = 3'b001;
SW3 = 3'b010;
SW4 = 3'b011;
SW5 = 3'b100;
#100
SW = 3'b001;
SW1 = 3'b000;
SW2 = 3'b001;
SW3 = 3'b010;
SW4 = 3'b011;
SW5 = 3'b100;
#100
SW = 3'b010;
SW1 = 3'b000;
SW2 = 3'b001;
SW3 = 3'b010;
SW4 = 3'b011;
SW5 = 3'b100;
#100
SW = 3'b011;
SW1 = 3'b000;
SW2 = 3'b001;
SW3 = 3'b010;
SW4 = 3'b011;
SW5 = 3'b100;
#100
SW = 3'b100;
SW1 = 3'b000;
SW2 = 3'b001;
SW3 = 3'b010;
SW4 = 3'b011;
SW5 = 3'b100;
#600 $finish;
end
mux51_led7 D(.SW(SW),.SW1(SW1),.SW2(SW2),.SW3(SW3),.SW4(SW4),.SW5(SW5),.HEX0(HEX0));
endmodule
