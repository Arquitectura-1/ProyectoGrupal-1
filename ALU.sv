module ALU (input logic [4:0] OPCODE, input logic [31:0] Rd, input logic [31:0] Rs, Rsi, Rt, output logic [31:0]RdOut,RdMem, 
branchResult, output logic [4:0] OpCode, output logic [31:0] AluResult, MemResult,MemOut, output logic Wrenable);

			
		
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
						branchResult = 0;
						OpCode = 0;
						//Wrenable = 0;
					end
				1: //LV
					begin
						AluResult = Rsi;
						RdOut = Rd;
						branchResult = 0;
						OpCode = OPCODE;
						Wrenable = 1;
					end
				2: //mlt
					begin
						AluResult = Rs*Rt;
						RdOut = Rd;
						branchResult = 0;
						OpCode = OPCODE;
						Wrenable = 1;
					end
				3: //div
					begin
						AluResult = Rs/Rt;
						RdOut = Rd;
						branchResult = 0;
						OpCode = OPCODE;
						Wrenable = 1;
					end
				4: // rest
					begin
						AluResult = Rs - Rt;
						RdOut = Rd;
						branchResult = 0;
						OpCode = OPCODE;
						Wrenable = 1;
					end
				5: //sum
					begin
						AluResult = Rt + Rs;
						RdOut = Rd;
						branchResult = 0;
						OpCode = OPCODE;
						Wrenable = 1;			
					end
				6: //CP
					begin
						//AluResult = Rsi;
						MemResult = Rsi;
						//RdOut = Rd;
						RdMem = Rd;
						branchResult = 0;
						OpCode = OPCODE;
						//Wrenable = 1;
					end
				7://B
					begin
						AluResult = 0;
						RdOut = 0;
						branchResult = Rd;
						OpCode = OPCODE;
						Wrenable = 0;
						
					end
				8: //BEG
					begin
						RdOut = 0;
						//branchResult = Rt;
						OpCode = OPCODE;
						Wrenable = 0;
						if(Rd>=Rs) begin
							//AluResult = 1;
							branchResult = Rt;
						end
						else begin
							//AluResult = 0;
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
						//AluResult = Rs;
						MemOut = Rs;
						//RdOut = Rd;
						RdMem= Rd;
						branchResult = 0;
						OpCode = OPCODE;
						//Wrenable = 0;
					end
				default: AluResult = 32'bz;
			endcase
		end
endmodule 