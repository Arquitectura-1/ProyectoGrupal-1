module RegMEMWB(
input  logic clk,
input logic [31:0]  ResultAlu,
input  logic [6:0] WBAddress,
output logic [31:0]  ResultAluOut,
output  logic [6:0] WBAddressOut

);


logic [31:0]  VResultAlu;
logic [6:0] VWBAddress;

	always @(posedge clk)
	begin
			WBAddressOut <= VWBAddress;
			ResultAluOut <= VResultAlu;
			
	end 
	always @(negedge clk)
	begin
			VResultAlu <= ResultAlu;
			VWBAddress <= WBAddress;
	end

endmodule