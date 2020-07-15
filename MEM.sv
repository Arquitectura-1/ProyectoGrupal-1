
module MEM #(parameter NUM = 1)(input logic [6:0] RdOut,RdMem, branchResult, input logic [31:0] AluResult, MemResult,MemWB, input logic [4:0] OpCode,output logic [31:0] Result,output logic [6:0] RdWb,RdAluOut,output logic[4:0] opCode,output logic Wrenable,output logic [6:0] BranchResultOut);

logic [19:0] Addr;
logic enable;


reg [31:0] tmpResult=32'b0;



generate
  if (NUM == 1) begin
    Data_Mem dMem (Addr,Result);
	 OutMem oMem (MemWB, enable);
  end
  else if (NUM == 2) begin
    Data_Mem2 dMem (Addr,Result);
	 OutMem2 oMem (MemWB, enable);
  end
endgenerate


always @(OpCode) begin
	if(OpCode == 0) begin 
		BranchResultOut= 0000000;
		enable =0;
		Wrenable <=0;
		opCode <= OpCode;
	end
	//LV
	else if (OpCode == 1) begin
		BranchResultOut= 0000000;
		enable =0;
		Wrenable <=0;
		opCode <= OpCode;
	end
	//suma,resta, mul y div
	else if (OpCode >= 2 && OpCode <= 5) begin
		BranchResultOut= 0000000;
		enable =0;
		Wrenable <=0;
		opCode <= OpCode;
	end
	//CP
	else if(OpCode == 6) begin
		Addr <= MemResult;
		RdWb <= RdMem;
		RdAluOut <=0;
		BranchResultOut= 0000000;
		Wrenable <=1;
		enable =0;
		opCode <= OpCode;
	end 
	//slr
	else if (OpCode == 9) begin
		BranchResultOut= 0000000;
		enable =0;
		Wrenable <=0;
		opCode <= OpCode;
	end
	//GP
	else if (OpCode == 10) begin
		BranchResultOut= 0000000;
		enable =1;	
		Wrenable <=0;
		opCode <= OpCode;
	end
end




endmodule
		

	
 