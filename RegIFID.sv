module RegIFID(
input  logic clk,
input  logic [31:0] Instruction,
input  logic [6:0]  InstructionDir,
output logic [31:0] InstructionOut,
output logic [6:0]  InstructionDirOut
);

always @(negedge clk)
begin
	InstructionOut = Instruction;
	InstructionDirOut = InstructionDir;
end

endmodule 