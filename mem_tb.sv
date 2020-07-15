module mem_tb();
	logic [6:0] RdOut;
	logic [31:0] AluResult;
	logic [31:0] branchResult; 
	logic [4:0] OpCode;
	logic clk=0;
	logic [31:0] Result;
	logic [6:0] RdWb;
	logic Wrenable;
	logic [6:0] BranchResultOut; 
	
	/*
	always
	begin
		#5000;
		clk=~clk;
	end
	*/
	MEM DUT(.RdOut(RdOut),.AluResult(AluResult),.branchResult(branchResult),.OpCode(OpCode),
	.Result(Result),.RdWb(RdWb),.Wrenable(WrEnable),.BranchResultOut(BranchResultOut));
	
	initial
	begin
			OpCode= 6;
			AluResult = 32'd2;
			#10;
			
	end
endmodule 