module cpu_tb();
parameter n1 = 1;
parameter n2 = 2;

logic clock=0;
logic vgaClock =0;
logic vgaDone;

logic done, done2;

CPU #(n1) DUT1 (clock, done);
CPU #(n2) DUT2 (clock, done2);


always#10
	if(done != 1 && done2 !=1 )
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
		

endmodule 