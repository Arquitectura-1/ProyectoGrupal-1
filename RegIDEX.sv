module RegIDEX(
input  logic clk,
input  logic [4:0] OpCode,
input  logic [31:0]  Rd,
input logic [31:0]  Rs,
input logic [31:0]  Rt,
input logic [31:0]  Rsi,
output  logic [4:0] OpCodeOut,
output  logic [31:0]  RdOut,
output logic [31:0]  RsOut,
output logic [31:0]  RtOut,
output logic [31:0]  RsiOut
);


logic [4:0] VOpCode;
logic [31:0]  VRd;
logic [31:0]  VRs;
logic [31:0]  VRt;
logic [31:0]  VRsi;

	always @(posedge clk)
	begin
			OpCodeOut <= VOpCode;
			RdOut <= VRd;
			RsOut <= VRs;
			RtOut <= VRt;
			RsiOut <= VRsi;
			
	end 
	always @(negedge clk)
	begin
		   VOpCode <= OpCode;
			VRd <= Rd;
			VRs <= Rs;
			VRt <= Rt;
			VRsi <= Rsi;
	end

endmodule 