module RegMEMWB_tb();

logic clk = 1;
logic [31:0] ResultAlu, ResultAluOut;
logic [6:0] WBAddressOut, WBAddress;



RegMEMWB RegMEMWB(.clk(clk), .ResultAlu(ResultAlu), .WBAddress(WBAddress), 
.ResultAluOut(ResultAluOut), .WBAddressOut(WBAddressOut));


always 
#5 clk =  ~clk;


initial begin
ResultAlu = 32'd2;
WBAddress = 7'd1;

#10
ResultAlu = 32'd9;
WBAddress = 7'd11;


#10
ResultAlu = 32'd7;
WBAddress = 7'd5;

end


endmodule 