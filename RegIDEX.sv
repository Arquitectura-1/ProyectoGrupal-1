module RegIDEX(
input  logic clk,
input  logic [4:0] OpCode,
input  logic [8:0]  Rd,
input logic [8:0]  Rs,
input logic [8:0]  Rt,
input logic [26:0]  Dir,
output  logic [4:0] OpCodeOut,
output  logic [8:0]  RdOut,
output logic [8:0]  RsOut,
output logic [8:0]  RtOut,
output logic [26:0]  DirOut
);


logic [4:0] VOpCode;
logic [8:0]  VRd;
logic [8:0]  VRs;
logic [8:0]  VRt;
logic [26:0]  VDir;

	always @(posedge clk)
	begin
			OpCodeOut <= VOpCode;
			RdOut <= VRd;
			RsOut <= VRs;
			RtOut <= VRt;
			DirOut <= VDir;
			
	end 
	always @(negedge clk)
	begin
		   VOpCode <= OpCode;
			VRd <= Rd;
			VRs <= Rs;
			VRt <= Rt;
			VDir <= Dir;
	end

endmodule 