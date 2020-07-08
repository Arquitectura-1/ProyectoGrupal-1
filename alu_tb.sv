module alu_tb();
	logic [4:0] OPCODE;
   logic [6:0] Rd;
	logic [31:0] Rs, Rsi, Rt;
   logic [6:0]RdOut,	branchResult;
   logic [4:0] OpCode;
   logic [31:0] AluResult;
	
	integer i;
	
	ALU UUT (.OPCODE(OPCODE),.Rd(Rd),.Rs(Rs), .Rsi(Rsi), .Rt(Rt),.RdOut(RdOut), .branchResult(branchResult),.OpCode(OpCode),.AluResult(AluResult));
	initial begin 
		for (i=0; i<=3; i=i+1)
		begin
			OPCODE=i;
			Rd=i;
			Rs=i;
			Rsi=i;
			RdOut=i;
			branchResult=i;
			#10;
		end
	end
endmodule 