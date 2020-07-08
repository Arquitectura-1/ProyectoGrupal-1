module CPU(input logic clk, output logic Done);

//
logic [6:0]branchResultOut;

//MEM->Deco
logic [31:0] Result;
logic [31:0] Instruccion;
logic[8:0] RdWb;

//
logic [4:0] OpCodeID;
logic [31:0]  RdID;
logic [31:0]  RsID;
logic [31:0]  RtID;
logic [31:0]  RsiID;
logic clockOutID;

//
logic [4:0] OpCodeIDEX;
logic [31:0]  RdIDEx;
logic [31:0]  RsIDEx;
logic [31:0]  RtIDEx;
logic [31:0]  RsiIDEx;
logic clockOutIDEx;

//
logic [6:0]RdOut,branchResult;
logic [4:0] OpCode;
logic [31:0] AluResult;

//

logic [4:0] OpCodeOutEXMEM;
logic [8:0] RdOutOutEXMEM;
logic [6:0]  BranchResultOutEXMEM;
logic [31:0]  AluResultOutEXMEM;

//

logic [31:0] resultMEM;
logic [6:0] rdMEM;
logic Wrenable;
logic [6:0] branchResultMEM;

//

logic [31:0] resultMWB;
logic [6:0] rdMWB;
logic WrenableMWB=0;
logic [6:0] branchResultMWB;


//Memoria_Procesador IF(.branchResultOut(branchResultMWB),.clk(clk),.Instruccion(Instruccion),.Done(Done));
Memoria_Procesador IF(.branchResultOut(branchResult),.clk(clk),.Instruccion(Instruccion),.Done(Done));

DECO deco (.Result(AluResult),.RdWb(RdOut),.Wrenable(Wrenable),.Instruccion(Instruccion),.clock(clk),.OpCode(OpCodeID),.Rd(RdID),.Rs(RsID),.Rsi(RsiID),.Rt(RtID),.clockOut(clockOutID));

RegIDEX regIDEX(.clk(clk),.OpCode(OpCodeID),.Rd(RdID),.Rs(RsID),.Rt(RtID),.Rsi(RsiID),.OpCodeOut(OpCodeIDEX),.RdOut(RdIDEx),.RsOut(RsIDEx),.RtOut(RtIDEx),.RsiOut(RsiIDEx));

ALU alu(.OPCODE(OpCodeIDEX), .Rd(RdIDEx), .Rs(RsIDEx), .Rsi(RsiIDEx), .Rt(RtIDEx),.RdOut(RdOut), .branchResult(branchResult),.OpCode(OpCode), .AluResult(AluResult), .Wrenable(Wrenable));

RegEXMEM regEXMEM(.clk(clk),.OpCode(OpCode),.RdOut(RdOut),.BranchResult(branchResult),.AluResult(AluResult),.OpCodeOut(OpCodeOutEXMEM),.RdOutOut(RdOutOutEXMEM),.BranchResultOut(BranchResultOutEXMEM),.AluResultOut(AluResultOutEXMEM));

MEM memData(.Wrenable(Wrenable), .RdOut(RdOutOutEXMEM), .branchResult(BranchResultOutEXMEM), .AluResult(AluResultOutEXMEM), .OpCode(OpCodeOutEXMEM),.Result(AluResult),.RdWb(RdOut),.BranchResultOut(branchResultMEM));

RegMEMWB regmemwb(.clk(clk),.Result(resultMEM),.RdWb(rdMEM), .BranchResult(branchResultMEM),.ResultOut(resultMWB),.RdWbOut(rdMWB),.BranchResultOut(branchResultMWB),.WrenableOut(WrenableMWB));
endmodule 