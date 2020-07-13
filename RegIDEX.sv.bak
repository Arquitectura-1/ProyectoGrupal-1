module RegIDEX(
input  logic clk,
input  logic [4:0] OpCode,
input  logic [8:0]  Rd,
input logic [8:0]  Rs,
input logic [8:0]  Rt,
input logic [19:0]  Rsi,
output  logic [4:0] OpCodeOut,
output  logic [8:0]  RdOut,
output logic [8:0]  RsOut,
output logic [8:0]  RtOut,
output logic [19:0]  RsiOut
);


logic [4:0] VOpCode;
logic [8:0]  VRd;
logic [8:0]  VRs;
logic [8:0]  VRt;
logic [19:0]  VRsi;

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