module Conmutador(
input logic [4:0] opcode1,opcode2,
input logic [6:0] Rdout1,
input logic [31:0] AluResult1,
input logic Wrenable1,
input logic [6:0] Rdout2,
input logic [31:0] AluResult2,
input logic Wrenable2,
output logic [6:0] Rdout,
output logic [31:0] AluResult,
output logic Wrenable
);


	always @(opcode1,opcode2) begin
		if(opcode2 == 6) begin
			Rdout = Rdout2;
			AluResult = AluResult2;
			Wrenable = 1;
		end
		
		else begin
			Rdout = Rdout1;
			AluResult = AluResult1;
			Wrenable = 1;
		end
	end


/*
	assign Rdout = (Rdout1 == 7'b0) ? Rdout2 : Rdout1;
	assign AluResult = (AluResult1 == 32'b0) ? AluResult2 : AluResult1;
	assign Wrenable = (Wrenable1 == 0) ? Wrenable2 : Wrenable1;
*/

endmodule 