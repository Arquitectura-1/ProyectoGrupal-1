module DECO (input logic [31:0] Result, Instruccion,input logic[6:0] RdWb,input logic Wrenable, input logic clock,output logic clockOut, output logic [4:0]OpCode, output logic [9:0]Rd, output logic [31:0] Rs,Rt, Rsi);
	reg [31:0] Registers [0:31];
	int reg1,reg2,reg3;
	
	always_ff @(Wrenable, Result, RdWb) begin
		if(Wrenable) Registers[RdWb] = Result;
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
			Rd = Instruccion[26:20];
			reg2 = Instruccion[19:0];
			Rsi = reg2;
			Rt = 0;
			
		end
		//Cp r1,r2
		else if (OpCode == 6) begin
			Rd = Instruccion[26:20];
			reg2 = Instruccion[19:0];
			Rsi = Registers[reg2];
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
			reg1 = Instruccion[26:18];
			reg2 = Instruccion[17:9];
			Rsi = 0;
			reg3 = Instruccion[8:0];
			Rd = Registers[reg1];
			Rs = Registers[reg2];
			Rt = reg3;
		end
		//slr r1,r2
		else if (OpCode == 9) begin
			reg1 = Instruccion[25:20];
			reg2 = Instruccion[19:0];
			Rsi = 0;
			reg3 = Instruccion[8:0];
			Rd = reg1;
			Rs = Registers[reg1];
			Rt = Registers[reg2];
		end 
		//gp r1,r2
		else if (OpCode == 10) begin
			reg3 = Instruccion[17:0];
			Rd = 0;
			Rs=Registers[reg3];
			Rsi=0;
			Rt=0;
		end
	end
endmodule 