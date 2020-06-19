module RegIDEX_tb();

logic clk = 1;
logic [4:0] OpCode, OpCodeOut;
logic [8:0]  Rd, Rs, Rt, RdOut, RsOut, RtOut;
logic [26:0]  Dir, DirOut;



RegIDEX RegIDEX(.clk(clk), .OpCode(OpCode), .Rd(Rd), .Rs(Rs), .Rt(Rt), .Dir(Dir), 
.OpCodeOut(OpCodeOut), .RdOut(RdOut), .RsOut(RsOut), .RtOut(RtOut), .DirOut(DirOut));


always 
#5 clk =  ~clk;


initial begin
OpCode = 5'd3;
Rd = 9'd1;
Rs = 9'd2;
Rt = 9'd3;
Dir = 27'd11;

#10
OpCode = 5'd11;
Rd = 9'd6;
Rs = 9'd9;
Rt = 9'd8;
Dir = 27'd14;

#10
OpCode = 5'd7;
Rd = 9'd9;
Rs = 9'd7;
Rt = 9'd5;
Dir = 27'd128;

end


endmodule 