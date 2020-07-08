
module cpu_tb();

logic clock=0;
logic vgaClock =0;
logic vgaDone;
logic done;
CPU UUT (clock, done);


always#0.5
	if(done != 1)
		clock = ~clock;
	else if(done == 1) begin
		clock = 0;
		if(vgaDone != 1) begin
			vgaClock = ~vgaClock;
		end
		else	begin
			$stop;
		end
	end
		
initial begin
	
end
endmodule 