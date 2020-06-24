module RegEXMEM(
input  logic clk,
input  logic [4:0] OpCode,
input  logic [31:0] RdOut,
input  logic [31:0]  BranchResult,
input  logic [31:0]  AluResult,
output logic [4:0] OpCodeOut,
output  logic [31:0] RdOutOut,
output logic [31:0]  BranchResultOut,
output logic [31:0]  AluResultOut
);


logic [4:0] VOpCode;
logic [31:0] VRdOut;
logic [31:0]  VBranchResult;
logic [31:0]  VAluResult;

	always @(posedge clk)
	begin
			OpCodeOut <= VOpCode;
			RdOutOut <= VRdOut;
			BranchResultOut <= VBranchResult;
			AluResultOut <= VAluResult;
			
	end 
	always @(negedge clk)
	begin
		   VOpCode <= OpCode;
			VRdOut <= RdOut;
			VAluResult <= AluResult;
			VBranchResult <= BranchResult;
	end

endmodule 