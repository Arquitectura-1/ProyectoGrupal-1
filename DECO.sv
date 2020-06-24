module DECO (input logic [31:0] Result, Instruccion,input logic[8:0] RdWb,input logic Wrenable, input logic clock,output logic clockOut, output logic [4:0]OpCode, output logic [6:0]Rd, output logic [31:0] Rs,Rt, Rsi);
	int Registers[32];
	int reg1,reg2,reg3;
	
	always @(Wrenable) begin
		if (Wrenable == 1) begin
			Registers[RdWb] = Result;
		end
	end
	
	always@(Instruccion) begin
		OpCode = Instruccion[31:27];
		clockOut = clock;
		//Aritmeticas
		if((OpCode == 2) || (OpCode == 3) || (OpCode == 4) || (OpCode == 5)) begin
			reg2 = Instruccion[17:9];
			Rsi = 0;
			reg3 = Instruccion[8:0];
			Rd = Instruccion[26:18];
			Rs = Registers[reg2];
			Rt = Registers[reg3];
		end
		//Lv r1,r2
		else if (OpCode == 1) begin
			Rd = Instruccion[26:18];
			reg2 = Instruccion[17:0];
			Rsi = reg2;
			Rt = 0;
			
		end
		//Cp r1,r2
		else if (OpCode == 6) begin
			Rd = Instruccion[26:18];
			reg2 = Instruccion[17:0];
			Rsi = reg2;
			Rt = 0;
			Rs=0;
		end
		//b test
		else if (OpCode == 7) begin
			Rd = Instruccion[6:0];
			Rs =0;
			Rt = 0;
			Rsi=0;
			
		end
		//beg r1,r2,test
		else if (OpCode == 8) begin
			reg2 = Instruccion[17:9];
			Rsi = 0;
			reg3 = Instruccion[8:0];
			Rd = Instruccion[26:18];
			Rs = Registers[reg2];
			Rt = reg3;
		end
		//slr r1,r2
		else if (OpCode == 9) begin
			reg1 = Instruccion[26:18];
			reg2 = Instruccion[17:9];
			Rsi = 0;
			reg3 = Instruccion[8:0];
			Rd = Instruccion[26:18];
			Rs = Registers[reg1];
			Rt = Registers[reg3];
		end 
		//gp r1,r2
		else if (OpCode == 10) begin
			Rd = 0;
			Rs=Instruccion[9:0];
			Rsi=0;
			Rt=0;
		end
	end
endmodule 