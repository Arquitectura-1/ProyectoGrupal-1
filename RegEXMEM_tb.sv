module RegEXMEM_tb();

logic clk = 1;
logic [4:0] OpCode, OpCodeOut;
logic [8:0] Rd, RdOut;
logic [6:0]  BranchResult, BranchResultOut;
logic [31:0] ResultAlu, ResultAluOut;



RegEXMEM RegEXMEM(.clk(clk), .OpCode(OpCode), .Rd(Rd), .BranchResult(BranchResult), 
.ResultAlu(ResultAlu), .OpCodeOut(OpCodeOut), .RdOut(RdOut), .BranchResultOut(BranchResultOut), 
.ResultAluOut(ResultAluOut));


always 
#5 clk =  ~clk;


initial begin
OpCode = 5'd3;
Rd = 9'd8;
BranchResult = 7'd1;
ResultAlu = 32'd2;

#10
OpCode = 5'd11;
Rd = 9'd7;
BranchResult = 7'd6;
ResultAlu = 32'd9;


#10
OpCode = 5'd7;
Rd = 9'd11;
BranchResult = 7'd9;
ResultAlu = 32'd7;

end


endmodule 