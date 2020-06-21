module RegEXMEM_tb();

logic clk = 1;
logic [4:0] OpCode, OpCodeOut;
logic [8:0] RdOut, RdOutOut;
logic [6:0]  BranchResult, BranchResultOut;
logic [31:0] AluResult, AluResultOut;



RegEXMEM RegEXMEM(.clk(clk), .OpCode(OpCode), .RdOut(RdOut), .BranchResult(BranchResult), 
.AluResult(AluResult), .OpCodeOut(OpCodeOut), .RdOutOut(RdOutOut), .BranchResultOut(BranchResultOut), 
.AluResultOut(AluResultOut));


always 
#5 clk =  ~clk;


initial begin
OpCode = 5'd3;
RdOut = 9'd8;
BranchResult = 7'd1;
AluResult = 32'd2;

#10
OpCode = 5'd11;
RdOut = 9'd7;
BranchResult = 7'd6;
AluResult = 32'd9;


#10
OpCode = 5'd7;
RdOut = 9'd11;
BranchResult = 7'd9;
AluResult = 32'd7;

end


endmodule 