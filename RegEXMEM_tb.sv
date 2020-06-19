module RegEXMEM_tb();

logic clk = 1;
logic [4:0] OpCode, OpCodeOut;
logic [6:0]  CurrentAddress, CurrentAddressOut;
logic [31:0] ResultAlu, ResultAluOut;



RegEXMEM RegEXMEM(.clk(clk), .OpCode(OpCode), .CurrentAddress(CurrentAddress), 
.ResultAlu(ResultAlu), .OpCodeOut(OpCodeOut), .CurrentAddressOut(CurrentAddressOut), 
.ResultAluOut(ResultAluOut));


always 
#5 clk =  ~clk;


initial begin
OpCode = 5'd3;
CurrentAddress = 7'd1;
ResultAlu = 32'd2;

#10
OpCode = 5'd11;
CurrentAddress = 7'd6;
ResultAlu = 32'd9;


#10
OpCode = 5'd7;
CurrentAddress = 7'd9;
ResultAlu = 32'd7;

end


endmodule 