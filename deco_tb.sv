module deco_tb();
	logic [31:0] Result, Instruccion;
	logic[8:0] RdWb;
	logic Wrenable;
	logic [4:0]OpCode;
	logic [6:0]Rd;
	logic [31:0] Rs,Rt, Rsi;
	
	DECO UUT (.Result(Result), .Instruccion(Instruccion),.RdWb(Rdwb),.Wrenable(Wrenable),.OpCode(OpCode),.Rd(Rd),.Rs(Rs),.Rt(Rt), .Rsi(Rsi));
	
	initial begin
		//Lv
		Instruccion = 32'b00001000000001000000001011110011;
		#100
		//SUm
		Instruccion = 32'b00101000000101000000101000001010;
		#100
		//Beg
		Instruccion = 32'b01000000000011000000001000111101;
		#100
		//Cp
		Instruccion = 32'b00110000001000000000000000000101;
		#100
		//b
		Instruccion = 32'b00111000000000000000000000100010;
		#100
		//WriteRegister
		Result = 10;
		RdWb =61;
		Wrenable =1;
		
		
		
	end
endmodule 