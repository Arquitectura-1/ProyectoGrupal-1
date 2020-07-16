module RegMEMWB(
input  logic clk,
input logic [31:0]  Result,
input  logic [31:0] RdWb, BranchResult,
input logic Wrenable,
output logic [31:0]  ResultOut,
output  logic [31:0] RdWbOut,BranchResultOut,
output logic WrenableOut
);


logic [31:0]  VResult;
logic [6:0] VRdWb, VBranchResult;
logic VWrenable;

	always @(posedge clk)
	begin
			ResultOut <=VResult;
			RdWbOut <= VRdWb;
			BranchResultOut <=VBranchResult;
			WrenableOut <= VWrenable;

			
	end 
	always @(negedge clk)
	begin
			VResult <=Result;
			VRdWb <= RdWb;
			VWrenable <= Wrenable;
			VBranchResult <= BranchResult;
			
	end

endmodule 