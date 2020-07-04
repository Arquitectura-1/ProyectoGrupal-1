`timescale 1 ps / 1 ps
module cpu_tb();

logic clock=0;
logic done;
CPU UUT (clock, done);

always#1
	if(done != 1)
		clock = ~clock;
	else
		$stop;
		
initial begin
	
end
endmodule 