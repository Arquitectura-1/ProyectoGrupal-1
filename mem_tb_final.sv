module mem_tb_final();
	logic [6:0] RdOut;
	logic [31:0] AluResult;
	logic [31:0] branchResult; 
	logic [4:0] OpCode;
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
	MEM_FINAL DUT(.RdOut(RdOut),.AluResult(AluResult),.branchResult(branchResult),.OpCode(OpCode),
	.Result(Result),.RdWb(RdWb),.Wrenable(WrEnable),.BranchResultOut(BranchResultOut));
	
	initial
	begin
			OpCode= 6;
			AluResult = 32'd2;
			#10;
			OpCode= 10;
			AluResult = 32'd15;
			#10;
			OpCode= 6;
			AluResult = 32'd5;
			#10;
			OpCode= 10;
			AluResult = 32'd5;
			#20;
			
	end
endmodule 