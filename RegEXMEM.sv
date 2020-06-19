module RegEXMEM(
input  logic clk,
input  logic [4:0] OpCode,
input  logic [6:0]  CurrentAddress,
input logic [31:0]  ResultAlu,
output  logic [4:0] OpCodeOut,
output  logic [6:0]  CurrentAddressOut,
output logic [31:0]  ResultAluOut
);


logic [4:0] VOpCode;
logic [6:0]  VCurrentAddress;
logic [31:0]  VResultAlu;

	always @(posedge clk)
	begin
			OpCodeOut <= VOpCode;
			CurrentAddressOut <= VCurrentAddress;
			ResultAluOut <= VResultAlu;
			
	end 
	always @(negedge clk)
	begin
		   VOpCode <= OpCode;
			VResultAlu <= ResultAlu;
			VCurrentAddress <= CurrentAddress;
	end

endmodule 