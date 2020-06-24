module ALU (input logic [4:0] OPCODE, input logic [6:0] Rd, input logic [31:0] Rs, Rsi, Rt, output logic [6:0]RdOut, branchResult, output logic [4:0] OpCode, output logic [31:0] AluResult);

	logic [31:0] tmpResult;
			
	always_comb begin
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
					end
				1: //LV
					begin
						AluResult = Rsi;
						RdOut = Rd;
						branchResult = 0;
						OpCode = OPCODE;
					end
				2: //mlt
					begin
						AluResult = Rs*Rt;
						RdOut = Rd;
						branchResult = 0;
						OpCode = OPCODE;
					end
				3: //div
					begin
						AluResult = Rs/Rt;
						RdOut = Rd;
						branchResult = 0;
						OpCode = OPCODE;
					end
				4: // rest
					begin
						AluResult = Rs - Rt;
						RdOut = Rd;
						branchResult = 0;
						OpCode = OPCODE;
					end
				5: //sum
					begin
						AluResult = Rs + Rt;
						RdOut = Rd;
						branchResult = 0;
						OpCode = OPCODE;				
					end
				6: //CP
					begin
						AluResult = Rsi;
						RdOut = Rd;
						branchResult = 0;
						OpCode = OPCODE;
					end
				7://B
					begin
						AluResult = 0;
						RdOut = 0;
						branchResult = Rd;
						OpCode = OPCODE;
					end
				8: //BEG
					begin
						AluResult = Rd>Rs;
						RdOut = 0;
						branchResult = Rt;
						OpCode = OPCODE;
					end
				9: //slr
					begin
						AluResult = Rs<<Rt;
						RdOut = Rd;
						branchResult = 0;
						OpCode = OPCODE;
					end
				10: //GP
					begin
						AluResult = Rs;
						RdOut = Rd;
						branchResult = 0;
						OpCode = OPCODE;
					end
				default: AluResult = 32'bz;
			endcase
		end
endmodule 