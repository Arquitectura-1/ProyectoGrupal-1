module RegIFID_tb();

logic clk = 1;
logic [31:0] Instruction, InstructionOut;
logic [6:0]  InstructionDir, InstructionDirOut;



RegIFID RegIFID(.clk(clk), .Instruction(Instruction), .InstructionDir(InstructionDir),
.InstructionOut(InstructionOut), .InstructionDirOut(InstructionDirOut));


always 
#5 clk =  ~clk;


initial begin
Instruction = 32'd128;
InstructionDir = 7'd1;

#5
Instruction = 32'd532;
InstructionDir = 7'd8;

#5
Instruction = 32'd1250;
InstructionDir = 7'd365;

end


endmodule 