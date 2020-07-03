`timescale 1 ps / 1 ps
module cpu_tb();

logic clock=0;
logic done;
CPU UUT (clock, done);

always#10 
		clock = ~clock;

initial begin
	
end
endmodule 