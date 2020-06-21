module RegEXMEM(
input  logic clk,
input  logic [4:0] OpCode,
input  logic [8:0] Rd,
input  logic [6:0]  BranchResult,
input  logic [31:0]  ResultAlu,
output logic [4:0] OpCodeOut,
output  logic [8:0] RdOut,
output logic [6:0]  BranchResultOut,
output logic [31:0]  ResultAluOut
);


logic [4:0] VOpCode;
logic [8:0] VRd;
logic [6:0]  VBranchResult;
logic [31:0]  VResultAlu;

	always @(posedge clk)
	begin
			OpCodeOut <= VOpCode;
			RdOut <= VRd;
			BranchResultOut <= VBranchResult;
			ResultAluOut <= VResultAlu;
			
	end 
	always @(negedge clk)
	begin
		   VOpCode <= OpCode;
			VRd <= Rd;
			VResultAlu <= ResultAlu;
			VBranchResult <= BranchResult;
	end

endmodule 