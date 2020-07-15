module ALU (input logic [4:0] OPCODE, input logic [31:0] Rd, input logic [31:0] Rs, Rsi, Rt, output logic [31:0]RdOut,RdMem, 
branchResult, output logic [4:0] OpCode, output logic [31:0] AluResult, MemResult,MemOut, output logic Wrenable);

logic [127:0] b0,b1,b2,b3,b4,b5,b6,b7,b8,b9,aux,result;		

	always@(*) begin
			RdOut=0;
			branchResult=0;
			OpCode=0;
			AluResult=0;
			case (OPCODE)
				0: //NOP
					begin
						AluResult = 0;
						RdOut = 0;
						RdMem = 0;
						branchResult = 0;
						OpCode = 0;
					end
				1: //LV
					begin
						AluResult = Rsi;
						RdOut = Rd;
						RdMem = 0;
						branchResult = 0;
						OpCode = OPCODE;
						Wrenable = 1;
					end
				2: //mlt
					begin
						AluResult = Rs*Rt;
						RdOut = Rd;
						RdMem = 0;
						branchResult = 0;
						OpCode = OPCODE;
						Wrenable = 1;
					end
				3: //div
					begin
						AluResult = Rs/Rt;
						RdOut = Rd;
						RdMem = 0;
						branchResult = 0;
						OpCode = OPCODE;
						Wrenable = 1;
					end
				4: // rest
					begin
						AluResult = Rs - Rt;
						RdOut = Rd;
						RdMem = 0;
						branchResult = 0;
						OpCode = OPCODE;
						Wrenable = 1;
					end
				5: //sum
					begin
						AluResult = Rt + Rs;
						RdOut = Rd;
						RdMem = 0;
						branchResult = 0;
						OpCode = OPCODE;
						Wrenable = 1;			
					end
				6: //CP
					begin
						MemResult = Rsi;
						RdOut = 0;
						RdMem = Rd;
						branchResult = 0;
						OpCode = OPCODE;
						Wrenable = 0;
					end
				7://B
					begin
						AluResult = 0;
						RdOut = 0;
						RdMem = 0;
						branchResult = Rd;
						OpCode = OPCODE;
						Wrenable = 0;
						
					end
				8: //BEG
					begin
						RdOut = 0;
						RdMem = 0;
						OpCode = OPCODE;
						Wrenable = 0;
						if(Rd>=Rs) begin
							branchResult = Rt;
						end
						else begin
							branchResult = 0000000;
						end
						
					end
				9: //slr
					begin
						AluResult = Rs<<Rt;
						RdOut = Rd;
						branchResult = 0;
						OpCode = OPCODE;
						Wrenable = 1;
					end
				10: //GP
					begin
						MemOut = Rs;
						RdMem= Rd;
						branchResult = 0;
						OpCode = OPCODE;
					end
				12: //decrypt
					begin
						AluResult = result;
						RdOut = Rd;
						Wrenable = 1;
						branchResult = 0;
					end
				default: AluResult = 32'bz;
			endcase
		end
		
	func_modulo fm0 (128'(Rs), Rt,b0);     
	func_modulo fm1 (b0*b0, Rt,b1); 
	     
	func_modulo fm2 (b1*b1, Rt,b2); 

	func_modulo fm3 (b2*b2, Rt,b3); 

	func_modulo fm4 (b3*b3, Rt,b4); 

	func_modulo fm5 (b4*b4, Rt,b5); 

	func_modulo fm6 (b5*b5, Rt,b6); 

	func_modulo fm7 (b6*b6, Rt,b7); 
	
	func_modulo fm8(b7*b7, Rt,b8); 
	
	func_modulo fm9(b8*b8, Rt,b9); 
	
	assign aux = (b0*b1*b4*b5*b6*b7*b9);
	
	func_modulo reslt (aux, Rt, result);
		
		
endmodule 