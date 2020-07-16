module RegEXMEM(
input  logic clk,
input  logic [4:0] OpCode,
input  logic [6:0] RdOut,RdMem,
input  logic [31:0]  BranchResult,
input  logic [31:0]  AluResult, MemResult,MemOut,
output logic [4:0] OpCodeOut,
output  logic [6:0] RdOutOut, RdMemOut,
output logic [31:0]  BranchResultOut,
output logic [31:0]  AluResultOut, MemResultOut, MemOutOut
);


logic [4:0] VOpCode;
logic [6:0] VRdOut, VRdMem;
logic [6:0]  VBranchResult;
logic [31:0]  VAluResult, VMemResult, VMemOut;

	always @(posedge clk)
	begin
			OpCodeOut <= VOpCode;
			RdOutOut <= VRdOut;
			BranchResultOut <= VBranchResult;
			AluResultOut <= VAluResult;
			MemResultOut <= VMemResult;
			RdMemOut <= VRdMem;
			MemOutOut <= VMemOut;
			
	end 
	always @(negedge clk)
	begin
		   VOpCode <= OpCode;
			VRdOut <= RdOut;
			VRdMem <= RdMem;
			VAluResult <= AluResult;
			VMemResult <= MemResult;
			VBranchResult <= BranchResult;
			VMemOut <= MemOut;
	end

endmodule 