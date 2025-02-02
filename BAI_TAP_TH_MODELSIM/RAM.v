//thi?t k? RAM 8x8
//=> c� 8 dia chi (addr co 3bit), du lieu 8 bit

module RAM(dataIn,dataOut,addr,CS,WE,clk);
input [7:0]dataIn;
output reg [7:0]dataOut;
input [2:0]addr;
input CS,WE,clk;
reg [7:0] spam[7:0];// spam co 8 dia chi, moi dia chi luu dl 8bit
always @(posedge clk)
begin
  if(CS == 1'b1)
  begin
    if(WE == 1'b1)
	    spam[addr] <= dataIn; //ghi du lieu
    else
	    dataOut <= spam[addr]; //doc du lieu
  end
  else dataOut <= 8'bxxxxxxxx;
end
endmodule

module TB_RAM();
reg [7:0]dataIn;
reg [2:0]addr;
reg CS,WE,clk;
wire [7:0]dataOut;
initial
begin
clk = 1'b0;
dataIn = 0;
addr = 3'b000;
CS = 1'b0;
WE = 1'b0;
#100
dataIn = 30;
addr = 3'b000;
CS = 1'b1;
WE = 1'b1;
#100
dataIn = 31;
addr = 3'b001;
CS = 1'b1;
WE = 1'b1;
#100
dataIn = 32;
addr = 3'b010;
CS = 1'b1;
WE = 1'b1;
#100
dataIn = 33;
addr = 3'b011;
CS = 1'b1;
WE = 1'b1;
#100
dataIn = 34;
addr = 3'b100;
CS = 1'b1;
WE = 1'b1;
#100
dataIn = 35;
addr = 3'b101;
CS = 1'b1;
WE = 1'b1;
#100
dataIn = 36;
addr = 3'b110;
CS = 1'b1;
WE = 1'b1;
#100
dataIn = 37;
addr = 3'b111;
CS = 1'b1;
WE = 1'b1;
#200
dataIn = 37;
addr = 3'b000;
CS = 1'b1;
WE = 1'b0;
#100
dataIn = 37;
addr = 3'b001;
CS = 1'b1;
WE = 1'b0;
#100
dataIn = 37;
addr = 3'b010;
CS = 1'b1;
WE = 1'b0;
#100
dataIn = 37;
addr = 3'b011;
CS = 1'b1;
WE = 1'b0;
#100
dataIn = 37;
addr = 3'b100;
CS = 1'b1;
WE = 1'b0;
#200
dataIn = 40;
addr = 3'b000;
CS = 1'b1;
WE = 1'b1;
#100
dataIn = 41;
addr = 3'b001;
CS = 1'b1;
WE = 1'b1;
#200
dataIn = 41;
addr = 3'b000;
CS = 1'b1;
WE = 1'b0;
#100
dataIn = 41;
addr = 3'b001;
CS= 1'b1;
WE = 1'b0;
#100
dataIn = 41;
addr = 3'b001;
CS = 1'b0;
WE = 1'b0;
#2500 $finish;
end
always @(clk)
#50 clk<=~clk;
RAM U(.dataIn(dataIn),.addr(addr),.CS(CS),.WE(WE),.clk(clk),.dataOut(dataOut));
endmodule
