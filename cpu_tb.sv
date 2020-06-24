`timescale 1 ps / 1 ps
module cpu_tb();

logic clock=0;
CPU UUT (clock);

always #10
	clock = ~clock;

initial begin
	
end
endmodule 